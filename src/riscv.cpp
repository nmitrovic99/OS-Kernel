
#include "../h/riscv.hpp"
#include "../h/pcb.hpp"
#include "../test/printing.hpp"
#include "../lib/console.h"
#include "../h/semaphoreK.hpp"


void Riscv::popSppSpie() {
    __asm__ volatile("csrw sepc, ra");
    __asm__ volatile("sret");
}

void Riscv::handleSupervisorTrap() {
    uint64 scause = r_scause();

    if (scause == 0x0000000000000008UL || scause==0x0000000000000009UL) {
        // interrupt: no; cause code: environment call from U-mode(8) or S-mode(9)
        uint64 regA0;
        __asm__ volatile ("mv %[regA0], a0" : [regA0] "=r"(regA0));
        if (regA0 == 0x11UL) {

            uint64 volatile sepc = r_sepc() + 4;
            uint64 volatile sstatus = r_sstatus();

            PCB **handle;
            void (*start_routine)(void *);
            void *arg;
            uint64 *stack_space;
            __asm__ volatile ("mv %[handle], a1" : [handle] "=r"(handle));
            __asm__ volatile ("mv %[start_routine], a2" : [start_routine] "=r"(start_routine));
            __asm__ volatile ("mv %[arg], a6" : [arg] "=r"(arg));
            __asm__ volatile ("mv %[stack_space], a7" : [stack_space] "=r"(stack_space));

            PCB *newThread = PCB::createThread(start_routine, arg, stack_space);

            uint64 returnValue;
            if (newThread) {
                printString("Kreirana je nit");
                if (handle) {
                    *handle = newThread;
                    returnValue = 0;
                } else
                    returnValue = -8;

            } else
                returnValue = -2;
            __asm__ volatile ("mv a0, %[returnValue]" : : [returnValue] "r"(returnValue));
            w_sstatus(sstatus);
            w_sepc(sepc);
        } else if (regA0 == 0x12UL) {
            uint64 volatile sepc = r_sepc() + 4;
            uint64 volatile sstatus = r_sstatus();
            PCB::running->setFinished(true);
            PCB::timeSliceCounter = 0;
            uint64 returnValue=0;
            __asm__ volatile ("mv a0, %[returnValue]" : : [returnValue] "r"(returnValue));
            PCB::dispatch();
            w_sstatus(sstatus);
            w_sepc(sepc);
        } else if (regA0 == 0x13UL) {
            uint64 volatile sepc = r_sepc() + 4;
            uint64 volatile sstatus = r_sstatus();
            PCB::timeSliceCounter = 0;
            PCB::dispatch();
            w_sstatus(sstatus);
            w_sepc(sepc);
        } else if (regA0 == 0x21UL) {
            uint64 volatile sepc = r_sepc() + 4;
            uint64 volatile sstatus = r_sstatus();

            SemaphoreK **handle;
            unsigned int init;
            __asm__ volatile ("mv %[handle], a6" : [handle] "=r"(handle));
            __asm__ volatile ("mv %[init], a2" : [init] "=r"(init));

            SemaphoreK *newSemaphore = SemaphoreK::openSemaphore(init);

            uint64 returnValue;
            if (newSemaphore) {
                printString("Kreiran je semafor");
                if (handle) {
                    *handle = newSemaphore;
                    returnValue = 0;
                } else
                    returnValue = -8;

            } else
                returnValue = -2;
            __asm__ volatile ("mv a0, %[returnValue]" : : [returnValue] "r"(returnValue));
            w_sstatus(sstatus);
            w_sepc(sepc);
        } else if (regA0 == 0x22UL) {
            uint64 volatile sepc = r_sepc() + 4;
            uint64 volatile sstatus = r_sstatus();

            SemaphoreK *handle;
            __asm__ volatile ("mv %[handle], a2" : [handle] "=r"(handle));

            handle->~SemaphoreK();

            uint64 returnValue;
            if (handle->getBlockedThreadsQueue()->removeFirst()) {
                printString("Postoji jos niti zablokiranih na ovom semaforu!");
                returnValue = -2;
            } else {
                returnValue = 0;
            }

            __asm__ volatile ("mv a0, %[returnValue]" : : [returnValue] "r"(returnValue));
            w_sstatus(sstatus);
            w_sepc(sepc);
        } else if (regA0 == 0x23UL) {
            uint64 volatile sepc = r_sepc() + 4;
            uint64 volatile sstatus = r_sstatus();

            SemaphoreK *handle;
            __asm__ volatile ("mv %[handle], a2" : [handle] "=r"(handle));

            int returnValue = handle->wait();

            __asm__ volatile ("mv a0, %[returnValue]" : : [returnValue] "r"(returnValue));
            w_sstatus(sstatus);
            w_sepc(sepc);
        } else if (regA0 == 0x24UL) {
            uint64 volatile sepc = r_sepc() + 4;
            uint64 volatile sstatus = r_sstatus();

            SemaphoreK *handle;
            __asm__ volatile ("mv %[handle], a2" : [handle] "=r"(handle));

            int returnValue = handle->signal();

            __asm__ volatile ("mv a0, %[returnValue]" : : [returnValue] "r"(returnValue));
            w_sstatus(sstatus);
            w_sepc(sepc);
        }
        else if (regA0 == 0x41UL) {
            uint64 volatile sepc = r_sepc() + 4;
            uint64 volatile sstatus = r_sstatus();

            char returnValue = __getc();

            __asm__ volatile ("mv a0, %[returnValue]" : : [returnValue] "r"(returnValue));

            w_sstatus(sstatus);
            w_sepc(sepc);
        }
        else if (regA0 == 0x42UL) {
            uint64 volatile sepc = r_sepc() + 4;
            uint64 volatile sstatus = r_sstatus();

            char c;
            __asm__ volatile ("mv %[c], a2" : [c] "=r"(c));
            __putc(c);

            w_sstatus(sstatus);
            w_sepc(sepc);
        }

    } else if (scause == 0x8000000000000001UL) {
        uint64 volatile sepc = r_sepc();
        uint64 volatile sstatus = r_sstatus();
        mc_sip(SIP_SSIP);
        w_sstatus(sstatus);
        w_sepc(sepc);
    }
    else if (scause == 0x8000000000000009UL) {
        uint64 volatile sepc = r_sepc();
        uint64 volatile sstatus = r_sstatus();
        console_handler();
        w_sstatus(sstatus);
        w_sepc(sepc);
    }

    else if(scause == 0x0000000000000002UL){
        printString("Uslo se u ilegall instruction!");
        return;
    }
    else{
        printString("Uslo se u neki drugi prekid!");
        return;
    }
}

void *Riscv::operator new(Riscv::size_t n) {
    return __mem_alloc(n);
}

void *Riscv::operator new[](Riscv::size_t n) {
    return __mem_alloc(n);
}

void Riscv::operator delete(void *p) noexcept {
    __mem_free(p);
}

void Riscv::operator delete[](void *p) noexcept {
    __mem_free(p);
}



