#include "../h/pcb.hpp"
#include "../h/riscv.hpp"
#include "../test/printing.hpp"
#include "../lib/console.h"

extern void userMain();

bool endUserMain = false;

void userMainWrapper(void *param) {
    userMain();
    endUserMain = true;
}

void main() {

    Riscv::w_stvec((uint64) &Riscv::supervisorTrap);


    PCB *thread = PCB::createThread(nullptr, nullptr, nullptr);
    PCB::running = thread;

    uint64 *stack = (uint64 *) __mem_alloc(DEFAULT_STACK_SIZE);
    PCB::createThread(&userMainWrapper, nullptr, stack);

    while (!endUserMain) {
        uint64 number = 0x13;
        __asm__ volatile ("mv a0, %[number]" : : [number] "r"(number));

        __asm__ volatile("ecall");
    }
//    userMain();



    printString("Finished all\n");

}

