#include "../lib/hw.h"
#include "../lib/mem.h"

#include "../h/pcb.hpp"


class PCB;

typedef PCB *thread_t;

int thread_create(thread_t *handle, void(*start_routine)(void *), void *arg);

int thread_exit();

void thread_dispatch();


class SemaphoreK;

typedef SemaphoreK *sem_t;

int sem_open(sem_t *handle, unsigned init);

int sem_close(sem_t handle);

int sem_wait(sem_t id);

int sem_signal(sem_t id);

//const int EOF=-1;

char getc();

void putc(char);


