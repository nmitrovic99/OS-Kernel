#include "../h/pcb.hpp"
#include "../h/riscv.hpp"

PCB *PCB::running = nullptr;
uint64 PCB::timeSliceCounter = 0;

PCB *PCB::createThread(PCB::Body body, void *arg, uint64 *stek) {

    return new PCB(body, arg, stek);
}

void PCB::dispatch() {
    PCB *old = running;
    if (!old->isFinished() && !old->isBlocked()) { Scheduler::put(old); }

    running = Scheduler::get();

    PCB::contextSwitch(&old->context, &running->context);

}

void PCB::threadWrapper() {
    Riscv::popSppSpie();

    running->body(running->getArg());

    running->setFinished(true);

    uint64 number = 0x13;
    __asm__ volatile ("mv a0, %[number]" : : [number] "r"(number));

    __asm__ volatile("ecall");
}

void *PCB::operator new(PCB::size_t n) {
    return __mem_alloc(n);
}

void *PCB::operator new[](PCB::size_t n) {
    return __mem_alloc(n);
}

void PCB::operator delete(void *p)

noexcept {
__mem_free(p);
}

void PCB::operator delete[](void *p)

noexcept {
__mem_free(p);
}

uint64 PCB::getTimeSlice() const {
    return timeSlice;
}





