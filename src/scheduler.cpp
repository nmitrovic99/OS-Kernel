#include "../h/scheduler.hpp"

List<PCB> Scheduler::readyThreadsQueue;

PCB *Scheduler::get() {
    return readyThreadsQueue.removeFirst();
}

void Scheduler::put(PCB *thread) {
    readyThreadsQueue.addLast(thread);
}

void *Scheduler::operator new(Scheduler::size_t n) {
    return __mem_alloc(n);
}

void *Scheduler::operator new[](Scheduler::size_t n) {
    return __mem_alloc(n);
}

void Scheduler::operator delete(void *p) noexcept {
    __mem_free(p);
}

void Scheduler::operator delete[](void *p) noexcept {
    __mem_free(p);
}


