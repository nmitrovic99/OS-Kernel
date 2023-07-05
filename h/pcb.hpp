#ifndef OS1_PROJEKAT_PCB_HPP
#define OS1_PROJEKAT_PCB_HPP

#include "../lib/hw.h"
#include "scheduler.hpp"
#include "../lib/mem.h"

class PCB {
public:
    ~PCB() { __mem_free(stack); }

    bool isFinished() const { return finished; }

    bool isBlocked() const { return blocked; }

    bool isDeblockFromSemClose() const { return semClose; }

    void *getArg() const { return arg; }

    void setFinished(bool value) { finished = value; }

    void setBlocked(bool value) { blocked = value; }

    void setDeblockFromSemClose(bool value) { semClose = value; }

    using Body = void (*)(void *);

    uint64 getTimeSlice() const;

    static PCB *createThread(Body body, void *arg, uint64 *stek);

    static PCB *running;


private:
    PCB(Body body, void *arg, uint64 *stek) :
            body(body),
            stack(body != nullptr ? stek : nullptr),
            context({
                            (uint64) &threadWrapper,
                            stack != nullptr ? (uint64) &stack + DEFAULT_STACK_SIZE : 0
                    }),
            timeSlice(DEFAULT_TIME_SLICE),
            finished(false),
            blocked(false),
            semClose(false),
            arg(arg) {
        if (body != nullptr) {
            Scheduler::put(this);
        }
    }

    struct Context {
        uint64 ra;      //x1
        uint64 sp;      //x2
    };

    Body body;
    uint64 *stack;
    Context context;
    uint64 timeSlice;
    bool finished;
    bool blocked;
    bool semClose;
    void *arg;

    friend class Riscv;

    friend class SemaphoreK;

    static void threadWrapper();

    static void contextSwitch(Context *oldContext, Context *runningContext);

    static void dispatch();

    static uint64 timeSliceCounter;

    using size_t = decltype(sizeof(0));

    void *operator new(size_t n);

    void *operator new[](size_t n);

    void operator delete(void *p) noexcept;

    void operator delete[](void *p) noexcept;
};

#endif