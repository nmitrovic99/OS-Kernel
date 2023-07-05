#include "../h/semaphoreK.hpp"
#include "../test/printing.hpp"

unsigned int SemaphoreK::getVal() const {
    return val;
}

void *SemaphoreK::operator new(SemaphoreK::size_t n) {
    return __mem_alloc(n);
}

void *SemaphoreK::operator new[](SemaphoreK::size_t n) {
    return __mem_alloc(n);
}

void SemaphoreK::operator delete(void *p) noexcept {
    __mem_free(p);
}

void SemaphoreK::operator delete[](void *p) noexcept {
    __mem_free(p);
}

SemaphoreK *SemaphoreK::openSemaphore(int init) {
    return new SemaphoreK(init);
}

void SemaphoreK::block(PCB *thread) {
    blockedThreadsQueue->addLast(thread);
}

PCB *SemaphoreK::deblock() {
    return blockedThreadsQueue->removeFirst();
}

int SemaphoreK::wait() {
    int retVal=0;
    val=val-1;

    if(val<0){
        PCB::running->setBlocked(true);
        block(PCB::running);

        PCB::timeSliceCounter = 0;
        PCB::dispatch();
        if(PCB::running->isDeblockFromSemClose()){
            PCB::running->setDeblockFromSemClose(false);
            retVal=-15;
        }

    }
    return retVal;
}

int SemaphoreK::signal() {
    val++;
    if(val<=0){
        PCB* deblockedThread=deblock();
        deblockedThread->setBlocked(false);
        Scheduler::put(deblockedThread);
    }
    return 0;
}

SemaphoreK::~SemaphoreK() {

    PCB* deblockedThreads=blockedThreadsQueue->removeFirst();
    while(deblockedThreads){
        val++;
        deblockedThreads->setBlocked(false);
        deblockedThreads->setDeblockFromSemClose(true);
        Scheduler::put(deblockedThreads);
        deblockedThreads=blockedThreadsQueue->removeFirst();
    }

}

List<PCB> *SemaphoreK::getBlockedThreadsQueue() const {
    return blockedThreadsQueue;
}








