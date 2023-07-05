#ifndef OS1_PROJEKAT_RISCV_HPP
#define OS1_PROJEKAT_RISCV_HPP
#include "../lib/hw.h"

class Riscv {
public:
    static void popSppSpie();

    static uint64 r_scause();

    static void w_scause(uint64 scause);

    static uint64 r_sepc();

    static void w_sepc(uint64 sepc);

    static uint64 r_stvec();

    static void w_stvec(uint64 stvec);

    static uint64 r_stval();

    static void w_stval(uint64 stval);

    enum BitMaskSip {
        SIP_SSIP = (1 << 1),        //supervisor software interrupt enable(pending) bit
        SIP_STIP = (1 << 5),        //supervisor trap interrupt enable(pending) bit
        SIP_SEIP = (1 << 9),        //supervisor external interrupt enable(pending) bit
    };

    //mask set register sip
    static void ms_sip(uint64 mask);

    //mask clear register sip
    static void mc_sip(uint64 mask);

    static uint64 r_sip();

    static void w_sip(uint64 sip);

    enum BitMaskSstatus {
        SSTATUS_SIE = (1 << 1),       //mask external interrupt
        SSTATUS_SPIE = (1 << 5),      //previous value of sie
        SSTATUS_SPP = (1 << 8),       //value of previous mode (user or kernel)
    };

    static void ms_sstatus(uint64 mask);

    static void mc_sstatus(uint64 mask);

    static uint64 r_sstatus();

    static void w_sstatus(uint64 sstatus);

    static void supervisorTrap();       //definition of this function is in supervisorTrap.S



private:

    //supervisor trap handler
    static void handleSupervisorTrap();

    using size_t= decltype(sizeof(0));

    void *operator new(size_t n);

    void *operator new[](size_t n);

    void operator delete(void *p) noexcept;

    void operator delete[](void *p) noexcept;

};

inline uint64 Riscv::r_scause() {
    uint64 volatile scause;
    __asm__ volatile("csrr %[scause], scause":[scause] "=r"(scause));
    return scause;
}

inline void Riscv::w_scause(uint64 scause) {
    __asm__ volatile("csrw scause, %[scause]": :[scause] "r"(scause));
}

inline uint64 Riscv::r_sepc() {
    uint64 volatile sepc;
    __asm__ volatile("csrr %[sepc], sepc":[sepc] "=r"(sepc));
    return sepc;
}

inline void Riscv::w_sepc(uint64 sepc) {
    __asm__ volatile("csrw sepc, %[sepc]": : [sepc] "r"(sepc));
}

inline uint64 Riscv::r_stvec() {
    uint64 volatile stvec;
    __asm__ volatile("csrr %[stvec], stvec":[stvec] "=r"(stvec));
    return stvec;
}

inline void Riscv::w_stvec(uint64 stvec) {
    __asm__ volatile("csrw stvec, %[stvec]": :[stvec] "r"(stvec));
}

inline uint64 Riscv::r_stval() {
    uint64 volatile stval;
    __asm__ volatile("csrr %[stval], stval":[stval] "=r" (stval));
    return stval;
}

inline void Riscv::w_stval(uint64 stval) {
    __asm__ volatile("csrw stval, %[stval]": :[stval] "r" (stval));
}

inline void Riscv::ms_sip(uint64 mask) {
    __asm__ volatile("csrs sip, %[mask]": :[mask] "r"(mask));
}

inline void Riscv::mc_sip(uint64 mask) {
    __asm__ volatile("csrc sip, %[mask]": :[mask] "r"(mask));
}

inline uint64 Riscv::r_sip()
{
    uint64 volatile sip;
    __asm__ volatile ("csrr %[sip], sip" : [sip] "=r"(sip));
    return sip;
}

inline void Riscv::w_sip(uint64 sip)
{
    __asm__ volatile ("csrw sip, %[sip]" : : [sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask)
{
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
}

inline void Riscv::mc_sstatus(uint64 mask)
{
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
}

inline uint64 Riscv::r_sstatus()
{
    uint64 volatile sstatus;
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    return sstatus;
}

inline void Riscv::w_sstatus(uint64 sstatus)
{
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
}

#endif