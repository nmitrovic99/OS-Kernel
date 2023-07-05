#include "../h/syscall_cpp.hpp"

Thread::Thread(void (*body)(void *), void *arg) {
    thread_create(&this->myHandle, body, arg);
}

Thread::~Thread() {
    ::delete myHandle;
}

int Thread::start() {
    if(!myHandle){
        return thread_create(&this->myHandle, &Thread::starter, this);
    }
    return -8;
}

void Thread::dispatch() {
    thread_dispatch();
}

void Thread::starter(void* toStart) {
    Thread *t=(Thread*)toStart;
    if(t)
        t->run();
}


Semaphore::Semaphore(unsigned int init) {
    sem_open(&myHandle,init);
}

Semaphore::~Semaphore() {
    sem_close(myHandle);
}

int Semaphore::wait() {
    return sem_wait(myHandle);
}

int Semaphore::signal() {
    return sem_signal(myHandle);
}

void *operator new(size_t n) {
    return __mem_alloc(n);
}

void operator delete(void *p) {
    __mem_free(p);
}

char Console::getc() {
    return ::getc();
}

void Console::putc(char c) {
    ::putc(c);
}

