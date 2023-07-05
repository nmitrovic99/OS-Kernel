#ifndef _syscall_cpp
#define _syscall_cpp

#include "syscall_c.h"

void* operator new(size_t);
void operator delete(void*);

class Thread {
public:
    Thread(void (*body)(void *), void *arg);

    virtual ~Thread();

    int start();

    static void dispatch();
    //static int sleep(time_t);

protected:
    Thread() : myHandle(nullptr) {}

    virtual void run() {}

private:
    thread_t myHandle;

    static void starter(void *arg);
};

class Semaphore {
public:
    explicit Semaphore(unsigned init = 1);

    virtual ~Semaphore();

    int wait();

    int signal();

private:
    sem_t myHandle;
};

class Console{
public:
    static char getc();
    static void putc(char);
};

#endif