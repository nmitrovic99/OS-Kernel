#ifndef OS1_PROJEKAT_SEMAPHORE_K_HPP
#define OS1_PROJEKAT_SEMAPHORE_K_HPP

#include "../lib/mem.h"
#include "list.hpp"
#include "../h/pcb.hpp"

class PCB;

class SemaphoreK {
public:
    ~SemaphoreK();

    static SemaphoreK *openSemaphore(int init);

    int wait();

    int signal();

    unsigned int getVal() const;

    void block(PCB *thread);

    PCB *deblock();

    List<PCB> *getBlockedThreadsQueue() const;

private:
    explicit SemaphoreK(int initVal) : val(initVal){
        blockedThreadsQueue=new List<PCB>();
    }

    int val;

    List<PCB> *blockedThreadsQueue;

    using size_t = decltype(sizeof(0));

    void *operator new(size_t n);

    void *operator new[](size_t n);

    void operator delete(void *p) noexcept;

    void operator delete[](void *p) noexcept;
};

#endif