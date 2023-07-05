#include "../h/syscall_c.h"
#include "../lib/hw.h"


int thread_create(thread_t *handle, void (*start_routine)(void *), void *arg) {
    __asm__ volatile ("mv a6, %[arg]" : : [arg] "r"(arg));
    __asm__ volatile ("mv a2, %[start_routine]" : : [start_routine] "r"(start_routine));
    __asm__ volatile ("mv a1, %[handle]" : : [handle] "r"(handle));

    uint64 *stack = nullptr;
    if (start_routine != nullptr) {
        stack = (uint64 *) __mem_alloc(DEFAULT_STACK_SIZE);
    }

    __asm__ volatile ("mv a7, %[stack]" : : [stack] "r"(stack));
    uint64 number = 0x11;
    __asm__ volatile ("mv a0, %[number]" : : [number] "r"(number));
    __asm__ volatile("ecall");

    int returnValue;
    __asm__ volatile ("mv %[returnValue], a0" : [returnValue] "=r"(returnValue));

    return returnValue;
}

int thread_exit() {
    uint64 number = 0x12;
    __asm__ volatile ("mv a0, %[number]" : : [number] "r"(number));

    __asm__ volatile("ecall");

    uint64 retV;
    __asm__ volatile ("mv %[retV], a0" : [retV] "=r"(retV));
    int returnValue = (int) retV;

    return returnValue;
}

void thread_dispatch() {
    uint64 number = 0x13;
    __asm__ volatile ("mv a0, %[number]" : : [number] "r"(number));

    __asm__ volatile("ecall");
}

int sem_open(sem_t *handle, unsigned int init) {
    __asm__ volatile ("mv a6, %[handle]" : : [handle] "r"(handle));
    __asm__ volatile ("mv a2, %[init]" : : [init] "r"(init));

    uint64 number = 0x21;
    __asm__ volatile ("mv a0, %[number]" : : [number] "r"(number));
    __asm__ volatile("ecall");

    int returnValue;
    __asm__ volatile ("mv %[returnValue], a0" : [returnValue] "=r"(returnValue));
    return returnValue;
}

int sem_close(sem_t handle) {
    __asm__ volatile ("mv a2, %[handle]" : : [handle] "r"(handle));
    uint64 number = 0x22;
    __asm__ volatile ("mv a0, %[number]" : : [number] "r"(number));

    __asm__ volatile("ecall");

    int returnValue;
    __asm__ volatile ("mv %[returnValue], a0" : [returnValue] "=r"(returnValue));
    return returnValue;
}

int sem_wait(sem_t id) {
    __asm__ volatile ("mv a2, %[id]" : : [id] "r"(id));
    uint64 number = 0x23;
    __asm__ volatile ("mv a0, %[number]" : : [number] "r"(number));

    __asm__ volatile("ecall");

    int returnValue;
    __asm__ volatile ("mv %[returnValue], a0" : [returnValue] "=r"(returnValue));
    return returnValue;
}

int sem_signal(sem_t id){
    __asm__ volatile ("mv a2, %[id]" : : [id] "r"(id));
    uint64 number = 0x24;
    __asm__ volatile ("mv a0, %[number]" : : [number] "r"(number));

    __asm__ volatile("ecall");

    int returnValue;
    __asm__ volatile ("mv %[returnValue], a0" : [returnValue] "=r"(returnValue));
    return returnValue;
}

char getc() {
    uint64 number = 0x41;
    __asm__ volatile ("mv a0, %[number]" : : [number] "r"(number));

    __asm__ volatile("ecall");

    uint64 returnValue;
    __asm__ volatile ("mv %[returnValue], a0" : [returnValue] "=r"(returnValue));
    char retu=(char)returnValue;
    return retu;
}

void putc(char c) {
    __asm__ volatile ("mv a2, %[c]" : : [c] "r"(c));
    uint64 number = 0x42;
    __asm__ volatile ("mv a0, %[number]" : : [number] "r"(number));

    __asm__ volatile("ecall");
}


