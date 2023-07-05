#ifndef OS1_PROJEKAT_SCHEDULER_HPP
#define OS1_PROJEKAT_SCHEDULER_HPP

#include "list.hpp"
#include "../lib/mem.h"

class PCB;

class Scheduler
{
private:
    static List<PCB> readyThreadsQueue;

    using size_t= decltype(sizeof(0));

    void *operator new(size_t n);

    void *operator new[](size_t n);

    void operator delete(void *p) noexcept;

    void operator delete[](void *p) noexcept;

public:
    static PCB *get();

    static void put(PCB *thread);


};

#endif