
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00007117          	auipc	sp,0x7
    80000004:	59813103          	ld	sp,1432(sp) # 80007598 <_GLOBAL_OFFSET_TABLE_+0x18>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	6b8030ef          	jal	ra,800036d4 <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <_ZN5Riscv14supervisorTrapEv>:
_ZN5Riscv14supervisorTrapEv:        #N je od namespace, a v je od void jer supervisorTrap nema parametre
    # push all registers to stack
    #s obzirom da se radi o prekidu koji dolazi asinhrono u bilo kom trenutku treba da obezbedimo u prekidnoj rutini da se sacuva kontekst procesora
    #koji je postojao neposredno pre trenutka prihvatanja ovog exceptiona.
    #s obzirom da se ovde radi o prekidnoj rutini nama je bitno da sacuvamo vrednosti svih registara
    addi sp, sp, -256
    80001000:	f0010113          	addi	sp,sp,-256
    .irp index, 0,1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    80001004:	00013023          	sd	zero,0(sp)
    80001008:	00113423          	sd	ra,8(sp)
    8000100c:	00213823          	sd	sp,16(sp)
    80001010:	00313c23          	sd	gp,24(sp)
    80001014:	02413023          	sd	tp,32(sp)
    80001018:	02513423          	sd	t0,40(sp)
    8000101c:	02613823          	sd	t1,48(sp)
    80001020:	02713c23          	sd	t2,56(sp)
    80001024:	04813023          	sd	s0,64(sp)
    80001028:	04913423          	sd	s1,72(sp)
    8000102c:	04b13c23          	sd	a1,88(sp)
    80001030:	06c13023          	sd	a2,96(sp)
    80001034:	06d13423          	sd	a3,104(sp)
    80001038:	06e13823          	sd	a4,112(sp)
    8000103c:	06f13c23          	sd	a5,120(sp)
    80001040:	09013023          	sd	a6,128(sp)
    80001044:	09113423          	sd	a7,136(sp)
    80001048:	09213823          	sd	s2,144(sp)
    8000104c:	09313c23          	sd	s3,152(sp)
    80001050:	0b413023          	sd	s4,160(sp)
    80001054:	0b513423          	sd	s5,168(sp)
    80001058:	0b613823          	sd	s6,176(sp)
    8000105c:	0b713c23          	sd	s7,184(sp)
    80001060:	0d813023          	sd	s8,192(sp)
    80001064:	0d913423          	sd	s9,200(sp)
    80001068:	0da13823          	sd	s10,208(sp)
    8000106c:	0db13c23          	sd	s11,216(sp)
    80001070:	0fc13023          	sd	t3,224(sp)
    80001074:	0fd13423          	sd	t4,232(sp)
    80001078:	0fe13823          	sd	t5,240(sp)
    8000107c:	0ff13c23          	sd	t6,248(sp)

    #da ne bismo pisali samu obradu prekida u asembleru nego da pisemo u c/c++ ovde pozivamo jednu fju i nju deklarisemo kao privatnu staticku fju u riscv.hpp
    call _ZN5Riscv20handleSupervisorTrapEv
    80001080:	4f9000ef          	jal	ra,80001d78 <_ZN5Riscv20handleSupervisorTrapEv>

    # pop all registers from stack
    .irp index, 0,1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    80001084:	00013003          	ld	zero,0(sp)
    80001088:	00813083          	ld	ra,8(sp)
    8000108c:	01013103          	ld	sp,16(sp)
    80001090:	01813183          	ld	gp,24(sp)
    80001094:	02013203          	ld	tp,32(sp)
    80001098:	02813283          	ld	t0,40(sp)
    8000109c:	03013303          	ld	t1,48(sp)
    800010a0:	03813383          	ld	t2,56(sp)
    800010a4:	04013403          	ld	s0,64(sp)
    800010a8:	04813483          	ld	s1,72(sp)
    800010ac:	05813583          	ld	a1,88(sp)
    800010b0:	06013603          	ld	a2,96(sp)
    800010b4:	06813683          	ld	a3,104(sp)
    800010b8:	07013703          	ld	a4,112(sp)
    800010bc:	07813783          	ld	a5,120(sp)
    800010c0:	08013803          	ld	a6,128(sp)
    800010c4:	08813883          	ld	a7,136(sp)
    800010c8:	09013903          	ld	s2,144(sp)
    800010cc:	09813983          	ld	s3,152(sp)
    800010d0:	0a013a03          	ld	s4,160(sp)
    800010d4:	0a813a83          	ld	s5,168(sp)
    800010d8:	0b013b03          	ld	s6,176(sp)
    800010dc:	0b813b83          	ld	s7,184(sp)
    800010e0:	0c013c03          	ld	s8,192(sp)
    800010e4:	0c813c83          	ld	s9,200(sp)
    800010e8:	0d013d03          	ld	s10,208(sp)
    800010ec:	0d813d83          	ld	s11,216(sp)
    800010f0:	0e013e03          	ld	t3,224(sp)
    800010f4:	0e813e83          	ld	t4,232(sp)
    800010f8:	0f013f03          	ld	t5,240(sp)
    800010fc:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001100:	10010113          	addi	sp,sp,256

    sret
    80001104:	10200073          	sret
	...

0000000080001110 <_ZN3PCB13contextSwitchEPNS_7ContextES1_>:
.global _ZN3PCB13contextSwitchEPNS_7ContextES1_
.type _ZN3PCB13contextSwitchEPNS_7ContextES1_, @function
_ZN3PCB13contextSwitchEPNS_7ContextES1_:
    sd ra, 0 * 8(a0)
    80001110:	00153023          	sd	ra,0(a0) # 1000 <_entry-0x7ffff000>
    sd sp, 1 * 8(a0)
    80001114:	00253423          	sd	sp,8(a0)

    ld ra, 0 * 8(a1)
    80001118:	0005b083          	ld	ra,0(a1)
    ld sp, 1 * 8(a1)
    8000111c:	0085b103          	ld	sp,8(a1)

    80001120:	00008067          	ret

0000000080001124 <copy_and_swap>:
# a1 holds expected value
# a2 holds desired value
# a0 holds return value, 0 if successful, !0 otherwise
.global copy_and_swap
copy_and_swap:
    lr.w t0, (a0)          # Load original value.
    80001124:	100522af          	lr.w	t0,(a0)
    bne t0, a1, fail       # Doesn’t match, so fail.
    80001128:	00b29a63          	bne	t0,a1,8000113c <fail>
    sc.w t0, a2, (a0)      # Try to update.
    8000112c:	18c522af          	sc.w	t0,a2,(a0)
    bnez t0, copy_and_swap # Retry if store-conditional failed.
    80001130:	fe029ae3          	bnez	t0,80001124 <copy_and_swap>
    li a0, 0               # Set return to success.
    80001134:	00000513          	li	a0,0
    jr ra                  # Return.
    80001138:	00008067          	ret

000000008000113c <fail>:
    fail:
    li a0, 1               # Set return to failure.
    8000113c:	00100513          	li	a0,1
    80001140:	00008067          	ret

0000000080001144 <_Z13thread_createPP3PCBPFvPvES2_>:
#include "../h/syscall_c.h"
#include "../lib/hw.h"


int thread_create(thread_t *handle, void (*start_routine)(void *), void *arg) {
    __asm__ volatile ("mv a6, %[arg]" : : [arg] "r"(arg));
    80001144:	00060813          	mv	a6,a2
    __asm__ volatile ("mv a2, %[start_routine]" : : [start_routine] "r"(start_routine));
    80001148:	00058613          	mv	a2,a1
    __asm__ volatile ("mv a1, %[handle]" : : [handle] "r"(handle));
    8000114c:	00050593          	mv	a1,a0

    uint64 *stack = nullptr;
    if (start_routine != nullptr) {
    80001150:	04058463          	beqz	a1,80001198 <_Z13thread_createPP3PCBPFvPvES2_+0x54>
int thread_create(thread_t *handle, void (*start_routine)(void *), void *arg) {
    80001154:	ff010113          	addi	sp,sp,-16
    80001158:	00113423          	sd	ra,8(sp)
    8000115c:	00813023          	sd	s0,0(sp)
    80001160:	01010413          	addi	s0,sp,16
        stack = (uint64 *) __mem_alloc(DEFAULT_STACK_SIZE);
    80001164:	00001537          	lui	a0,0x1
    80001168:	00004097          	auipc	ra,0x4
    8000116c:	700080e7          	jalr	1792(ra) # 80005868 <__mem_alloc>
    }

    __asm__ volatile ("mv a7, %[stack]" : : [stack] "r"(stack));
    80001170:	00050893          	mv	a7,a0
    uint64 number = 0x11;
    __asm__ volatile ("mv a0, %[number]" : : [number] "r"(number));
    80001174:	01100793          	li	a5,17
    80001178:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    8000117c:	00000073          	ecall

    int returnValue;
    __asm__ volatile ("mv %[returnValue], a0" : [returnValue] "=r"(returnValue));
    80001180:	00050513          	mv	a0,a0

    return returnValue;
}
    80001184:	0005051b          	sext.w	a0,a0
    80001188:	00813083          	ld	ra,8(sp)
    8000118c:	00013403          	ld	s0,0(sp)
    80001190:	01010113          	addi	sp,sp,16
    80001194:	00008067          	ret
    uint64 *stack = nullptr;
    80001198:	00000513          	li	a0,0
    __asm__ volatile ("mv a7, %[stack]" : : [stack] "r"(stack));
    8000119c:	00050893          	mv	a7,a0
    __asm__ volatile ("mv a0, %[number]" : : [number] "r"(number));
    800011a0:	01100793          	li	a5,17
    800011a4:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    800011a8:	00000073          	ecall
    __asm__ volatile ("mv %[returnValue], a0" : [returnValue] "=r"(returnValue));
    800011ac:	00050513          	mv	a0,a0
}
    800011b0:	0005051b          	sext.w	a0,a0
    800011b4:	00008067          	ret

00000000800011b8 <_Z11thread_exitv>:

int thread_exit() {
    800011b8:	ff010113          	addi	sp,sp,-16
    800011bc:	00813423          	sd	s0,8(sp)
    800011c0:	01010413          	addi	s0,sp,16
    uint64 number = 0x12;
    __asm__ volatile ("mv a0, %[number]" : : [number] "r"(number));
    800011c4:	01200793          	li	a5,18
    800011c8:	00078513          	mv	a0,a5

    __asm__ volatile("ecall");
    800011cc:	00000073          	ecall

    uint64 retV;
    __asm__ volatile ("mv %[retV], a0" : [retV] "=r"(retV));
    800011d0:	00050513          	mv	a0,a0
    int returnValue = (int) retV;

    return returnValue;
}
    800011d4:	0005051b          	sext.w	a0,a0
    800011d8:	00813403          	ld	s0,8(sp)
    800011dc:	01010113          	addi	sp,sp,16
    800011e0:	00008067          	ret

00000000800011e4 <_Z15thread_dispatchv>:

void thread_dispatch() {
    800011e4:	ff010113          	addi	sp,sp,-16
    800011e8:	00813423          	sd	s0,8(sp)
    800011ec:	01010413          	addi	s0,sp,16
    uint64 number = 0x13;
    __asm__ volatile ("mv a0, %[number]" : : [number] "r"(number));
    800011f0:	01300793          	li	a5,19
    800011f4:	00078513          	mv	a0,a5

    __asm__ volatile("ecall");
    800011f8:	00000073          	ecall
}
    800011fc:	00813403          	ld	s0,8(sp)
    80001200:	01010113          	addi	sp,sp,16
    80001204:	00008067          	ret

0000000080001208 <_Z8sem_openPP10SemaphoreKj>:

int sem_open(sem_t *handle, unsigned int init) {
    80001208:	ff010113          	addi	sp,sp,-16
    8000120c:	00813423          	sd	s0,8(sp)
    80001210:	01010413          	addi	s0,sp,16
    __asm__ volatile ("mv a6, %[handle]" : : [handle] "r"(handle));
    80001214:	00050813          	mv	a6,a0
    __asm__ volatile ("mv a2, %[init]" : : [init] "r"(init));
    80001218:	00058613          	mv	a2,a1

    uint64 number = 0x21;
    __asm__ volatile ("mv a0, %[number]" : : [number] "r"(number));
    8000121c:	02100793          	li	a5,33
    80001220:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80001224:	00000073          	ecall

    int returnValue;
    __asm__ volatile ("mv %[returnValue], a0" : [returnValue] "=r"(returnValue));
    80001228:	00050513          	mv	a0,a0
    return returnValue;
}
    8000122c:	0005051b          	sext.w	a0,a0
    80001230:	00813403          	ld	s0,8(sp)
    80001234:	01010113          	addi	sp,sp,16
    80001238:	00008067          	ret

000000008000123c <_Z9sem_closeP10SemaphoreK>:

int sem_close(sem_t handle) {
    8000123c:	ff010113          	addi	sp,sp,-16
    80001240:	00813423          	sd	s0,8(sp)
    80001244:	01010413          	addi	s0,sp,16
    __asm__ volatile ("mv a2, %[handle]" : : [handle] "r"(handle));
    80001248:	00050613          	mv	a2,a0
    uint64 number = 0x22;
    __asm__ volatile ("mv a0, %[number]" : : [number] "r"(number));
    8000124c:	02200793          	li	a5,34
    80001250:	00078513          	mv	a0,a5

    __asm__ volatile("ecall");
    80001254:	00000073          	ecall

    int returnValue;
    __asm__ volatile ("mv %[returnValue], a0" : [returnValue] "=r"(returnValue));
    80001258:	00050513          	mv	a0,a0
    return returnValue;
}
    8000125c:	0005051b          	sext.w	a0,a0
    80001260:	00813403          	ld	s0,8(sp)
    80001264:	01010113          	addi	sp,sp,16
    80001268:	00008067          	ret

000000008000126c <_Z8sem_waitP10SemaphoreK>:

int sem_wait(sem_t id) {
    8000126c:	ff010113          	addi	sp,sp,-16
    80001270:	00813423          	sd	s0,8(sp)
    80001274:	01010413          	addi	s0,sp,16
    __asm__ volatile ("mv a2, %[id]" : : [id] "r"(id));
    80001278:	00050613          	mv	a2,a0
    uint64 number = 0x23;
    __asm__ volatile ("mv a0, %[number]" : : [number] "r"(number));
    8000127c:	02300793          	li	a5,35
    80001280:	00078513          	mv	a0,a5

    __asm__ volatile("ecall");
    80001284:	00000073          	ecall

    int returnValue;
    __asm__ volatile ("mv %[returnValue], a0" : [returnValue] "=r"(returnValue));
    80001288:	00050513          	mv	a0,a0
    return returnValue;
}
    8000128c:	0005051b          	sext.w	a0,a0
    80001290:	00813403          	ld	s0,8(sp)
    80001294:	01010113          	addi	sp,sp,16
    80001298:	00008067          	ret

000000008000129c <_Z10sem_signalP10SemaphoreK>:

int sem_signal(sem_t id){
    8000129c:	ff010113          	addi	sp,sp,-16
    800012a0:	00813423          	sd	s0,8(sp)
    800012a4:	01010413          	addi	s0,sp,16
    __asm__ volatile ("mv a2, %[id]" : : [id] "r"(id));
    800012a8:	00050613          	mv	a2,a0
    uint64 number = 0x24;
    __asm__ volatile ("mv a0, %[number]" : : [number] "r"(number));
    800012ac:	02400793          	li	a5,36
    800012b0:	00078513          	mv	a0,a5

    __asm__ volatile("ecall");
    800012b4:	00000073          	ecall

    int returnValue;
    __asm__ volatile ("mv %[returnValue], a0" : [returnValue] "=r"(returnValue));
    800012b8:	00050513          	mv	a0,a0
    return returnValue;
}
    800012bc:	0005051b          	sext.w	a0,a0
    800012c0:	00813403          	ld	s0,8(sp)
    800012c4:	01010113          	addi	sp,sp,16
    800012c8:	00008067          	ret

00000000800012cc <_Z4getcv>:

char getc() {
    800012cc:	ff010113          	addi	sp,sp,-16
    800012d0:	00813423          	sd	s0,8(sp)
    800012d4:	01010413          	addi	s0,sp,16
    uint64 number = 0x41;
    __asm__ volatile ("mv a0, %[number]" : : [number] "r"(number));
    800012d8:	04100793          	li	a5,65
    800012dc:	00078513          	mv	a0,a5

    __asm__ volatile("ecall");
    800012e0:	00000073          	ecall

    uint64 returnValue;
    __asm__ volatile ("mv %[returnValue], a0" : [returnValue] "=r"(returnValue));
    800012e4:	00050513          	mv	a0,a0
    char retu=(char)returnValue;
    return retu;
}
    800012e8:	0ff57513          	andi	a0,a0,255
    800012ec:	00813403          	ld	s0,8(sp)
    800012f0:	01010113          	addi	sp,sp,16
    800012f4:	00008067          	ret

00000000800012f8 <_Z4putcc>:

void putc(char c) {
    800012f8:	ff010113          	addi	sp,sp,-16
    800012fc:	00813423          	sd	s0,8(sp)
    80001300:	01010413          	addi	s0,sp,16
    __asm__ volatile ("mv a2, %[c]" : : [c] "r"(c));
    80001304:	00050613          	mv	a2,a0
    uint64 number = 0x42;
    __asm__ volatile ("mv a0, %[number]" : : [number] "r"(number));
    80001308:	04200793          	li	a5,66
    8000130c:	00078513          	mv	a0,a5

    __asm__ volatile("ecall");
    80001310:	00000073          	ecall
}
    80001314:	00813403          	ld	s0,8(sp)
    80001318:	01010113          	addi	sp,sp,16
    8000131c:	00008067          	ret

0000000080001320 <_ZNK10SemaphoreK6getValEv>:
#include "../h/semaphoreK.hpp"
#include "../test/printing.hpp"

unsigned int SemaphoreK::getVal() const {
    80001320:	ff010113          	addi	sp,sp,-16
    80001324:	00813423          	sd	s0,8(sp)
    80001328:	01010413          	addi	s0,sp,16
    return val;
}
    8000132c:	00052503          	lw	a0,0(a0) # 1000 <_entry-0x7ffff000>
    80001330:	00813403          	ld	s0,8(sp)
    80001334:	01010113          	addi	sp,sp,16
    80001338:	00008067          	ret

000000008000133c <_ZN10SemaphoreKnwEm>:

void *SemaphoreK::operator new(SemaphoreK::size_t n) {
    8000133c:	ff010113          	addi	sp,sp,-16
    80001340:	00113423          	sd	ra,8(sp)
    80001344:	00813023          	sd	s0,0(sp)
    80001348:	01010413          	addi	s0,sp,16
    return __mem_alloc(n);
    8000134c:	00004097          	auipc	ra,0x4
    80001350:	51c080e7          	jalr	1308(ra) # 80005868 <__mem_alloc>
}
    80001354:	00813083          	ld	ra,8(sp)
    80001358:	00013403          	ld	s0,0(sp)
    8000135c:	01010113          	addi	sp,sp,16
    80001360:	00008067          	ret

0000000080001364 <_ZN10SemaphoreKnaEm>:

void *SemaphoreK::operator new[](SemaphoreK::size_t n) {
    80001364:	ff010113          	addi	sp,sp,-16
    80001368:	00113423          	sd	ra,8(sp)
    8000136c:	00813023          	sd	s0,0(sp)
    80001370:	01010413          	addi	s0,sp,16
    return __mem_alloc(n);
    80001374:	00004097          	auipc	ra,0x4
    80001378:	4f4080e7          	jalr	1268(ra) # 80005868 <__mem_alloc>
}
    8000137c:	00813083          	ld	ra,8(sp)
    80001380:	00013403          	ld	s0,0(sp)
    80001384:	01010113          	addi	sp,sp,16
    80001388:	00008067          	ret

000000008000138c <_ZN10SemaphoreKdlEPv>:

void SemaphoreK::operator delete(void *p) noexcept {
    8000138c:	ff010113          	addi	sp,sp,-16
    80001390:	00113423          	sd	ra,8(sp)
    80001394:	00813023          	sd	s0,0(sp)
    80001398:	01010413          	addi	s0,sp,16
    __mem_free(p);
    8000139c:	00004097          	auipc	ra,0x4
    800013a0:	400080e7          	jalr	1024(ra) # 8000579c <__mem_free>
}
    800013a4:	00813083          	ld	ra,8(sp)
    800013a8:	00013403          	ld	s0,0(sp)
    800013ac:	01010113          	addi	sp,sp,16
    800013b0:	00008067          	ret

00000000800013b4 <_ZN10SemaphoreKdaEPv>:

void SemaphoreK::operator delete[](void *p) noexcept {
    800013b4:	ff010113          	addi	sp,sp,-16
    800013b8:	00113423          	sd	ra,8(sp)
    800013bc:	00813023          	sd	s0,0(sp)
    800013c0:	01010413          	addi	s0,sp,16
    __mem_free(p);
    800013c4:	00004097          	auipc	ra,0x4
    800013c8:	3d8080e7          	jalr	984(ra) # 8000579c <__mem_free>
}
    800013cc:	00813083          	ld	ra,8(sp)
    800013d0:	00013403          	ld	s0,0(sp)
    800013d4:	01010113          	addi	sp,sp,16
    800013d8:	00008067          	ret

00000000800013dc <_ZN10SemaphoreK13openSemaphoreEi>:

SemaphoreK *SemaphoreK::openSemaphore(int init) {
    800013dc:	fe010113          	addi	sp,sp,-32
    800013e0:	00113c23          	sd	ra,24(sp)
    800013e4:	00813823          	sd	s0,16(sp)
    800013e8:	00913423          	sd	s1,8(sp)
    800013ec:	01213023          	sd	s2,0(sp)
    800013f0:	02010413          	addi	s0,sp,32
    800013f4:	00050913          	mv	s2,a0
    return new SemaphoreK(init);
    800013f8:	01000513          	li	a0,16
    800013fc:	00000097          	auipc	ra,0x0
    80001400:	f40080e7          	jalr	-192(ra) # 8000133c <_ZN10SemaphoreKnwEm>
    80001404:	00050493          	mv	s1,a0
    PCB *deblock();

    List<PCB> *getBlockedThreadsQueue() const;

private:
    explicit SemaphoreK(int initVal) : val(initVal){
    80001408:	01252023          	sw	s2,0(a0)
        blockedThreadsQueue=new List<PCB>();
    8000140c:	01000513          	li	a0,16
    80001410:	00000097          	auipc	ra,0x0
    80001414:	7bc080e7          	jalr	1980(ra) # 80001bcc <_Znwm>
    80001418:	0200006f          	j	80001438 <_ZN10SemaphoreK13openSemaphoreEi+0x5c>
    8000141c:	00050913          	mv	s2,a0
    80001420:	00048513          	mv	a0,s1
    80001424:	00000097          	auipc	ra,0x0
    80001428:	f68080e7          	jalr	-152(ra) # 8000138c <_ZN10SemaphoreKdlEPv>
    8000142c:	00090513          	mv	a0,s2
    80001430:	00007097          	auipc	ra,0x7
    80001434:	2c8080e7          	jalr	712(ra) # 800086f8 <_Unwind_Resume>

    Elem *head;
    Elem *tail;

public:
    List() : head(0), tail(0) {}
    80001438:	00053023          	sd	zero,0(a0)
    8000143c:	00053423          	sd	zero,8(a0)
    80001440:	00a4b423          	sd	a0,8(s1)
}
    80001444:	00048513          	mv	a0,s1
    80001448:	01813083          	ld	ra,24(sp)
    8000144c:	01013403          	ld	s0,16(sp)
    80001450:	00813483          	ld	s1,8(sp)
    80001454:	00013903          	ld	s2,0(sp)
    80001458:	02010113          	addi	sp,sp,32
    8000145c:	00008067          	ret

0000000080001460 <_ZN10SemaphoreK5blockEP3PCB>:

void SemaphoreK::block(PCB *thread) {
    80001460:	fe010113          	addi	sp,sp,-32
    80001464:	00113c23          	sd	ra,24(sp)
    80001468:	00813823          	sd	s0,16(sp)
    8000146c:	00913423          	sd	s1,8(sp)
    80001470:	01213023          	sd	s2,0(sp)
    80001474:	02010413          	addi	s0,sp,32
    80001478:	00058493          	mv	s1,a1
    blockedThreadsQueue->addLast(thread);
    8000147c:	00853903          	ld	s2,8(a0)
        head = elem;
        if (!tail) { tail = head; }
    }

    void addLast(T *data) {
        Elem *elem = new Elem(data, 0);
    80001480:	01000513          	li	a0,16
    80001484:	00000097          	auipc	ra,0x0
    80001488:	748080e7          	jalr	1864(ra) # 80001bcc <_Znwm>
        Elem(T *data, Elem *next) : data(data), next(next) {}
    8000148c:	00953023          	sd	s1,0(a0)
    80001490:	00053423          	sd	zero,8(a0)
        //Elem *elem = (Elem*)__mem_alloc(sizeof (Elem(data, 0)));
        if (tail) {
    80001494:	00893783          	ld	a5,8(s2)
    80001498:	02078263          	beqz	a5,800014bc <_ZN10SemaphoreK5blockEP3PCB+0x5c>
            tail->next = elem;
    8000149c:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    800014a0:	00a93423          	sd	a0,8(s2)
}
    800014a4:	01813083          	ld	ra,24(sp)
    800014a8:	01013403          	ld	s0,16(sp)
    800014ac:	00813483          	ld	s1,8(sp)
    800014b0:	00013903          	ld	s2,0(sp)
    800014b4:	02010113          	addi	sp,sp,32
    800014b8:	00008067          	ret
        } else {
            head = tail = elem;
    800014bc:	00a93423          	sd	a0,8(s2)
    800014c0:	00a93023          	sd	a0,0(s2)
    800014c4:	fe1ff06f          	j	800014a4 <_ZN10SemaphoreK5blockEP3PCB+0x44>

00000000800014c8 <_ZN10SemaphoreK7deblockEv>:

PCB *SemaphoreK::deblock() {
    800014c8:	fe010113          	addi	sp,sp,-32
    800014cc:	00113c23          	sd	ra,24(sp)
    800014d0:	00813823          	sd	s0,16(sp)
    800014d4:	00913423          	sd	s1,8(sp)
    800014d8:	02010413          	addi	s0,sp,32
    return blockedThreadsQueue->removeFirst();
    800014dc:	00853783          	ld	a5,8(a0)
        }
    }

    T *removeFirst() {
        if (!head) { return 0; }
    800014e0:	0007b503          	ld	a0,0(a5)
    800014e4:	02050e63          	beqz	a0,80001520 <_ZN10SemaphoreK7deblockEv+0x58>
        Elem *elem = head;
        head = head->next;
    800014e8:	00853703          	ld	a4,8(a0)
    800014ec:	00e7b023          	sd	a4,0(a5)
        if (!head) { tail = 0; }
    800014f0:	02070463          	beqz	a4,80001518 <_ZN10SemaphoreK7deblockEv+0x50>

        T *ret = elem->data;
    800014f4:	00053483          	ld	s1,0(a0)
        delete elem;
    800014f8:	00000097          	auipc	ra,0x0
    800014fc:	6fc080e7          	jalr	1788(ra) # 80001bf4 <_ZdlPv>
}
    80001500:	00048513          	mv	a0,s1
    80001504:	01813083          	ld	ra,24(sp)
    80001508:	01013403          	ld	s0,16(sp)
    8000150c:	00813483          	ld	s1,8(sp)
    80001510:	02010113          	addi	sp,sp,32
    80001514:	00008067          	ret
        if (!head) { tail = 0; }
    80001518:	0007b423          	sd	zero,8(a5)
    8000151c:	fd9ff06f          	j	800014f4 <_ZN10SemaphoreK7deblockEv+0x2c>
        if (!head) { return 0; }
    80001520:	00050493          	mv	s1,a0
    return blockedThreadsQueue->removeFirst();
    80001524:	fddff06f          	j	80001500 <_ZN10SemaphoreK7deblockEv+0x38>

0000000080001528 <_ZN10SemaphoreK4waitEv>:

int SemaphoreK::wait() {
    int retVal=0;
    val=val-1;
    80001528:	00052783          	lw	a5,0(a0)
    8000152c:	fff7879b          	addiw	a5,a5,-1
    80001530:	00f52023          	sw	a5,0(a0)

    if(val<0){
    80001534:	02079713          	slli	a4,a5,0x20
    80001538:	00074663          	bltz	a4,80001544 <_ZN10SemaphoreK4waitEv+0x1c>
    int retVal=0;
    8000153c:	00000513          	li	a0,0
            retVal=-15;
        }

    }
    return retVal;
}
    80001540:	00008067          	ret
int SemaphoreK::wait() {
    80001544:	fe010113          	addi	sp,sp,-32
    80001548:	00113c23          	sd	ra,24(sp)
    8000154c:	00813823          	sd	s0,16(sp)
    80001550:	00913423          	sd	s1,8(sp)
    80001554:	02010413          	addi	s0,sp,32
        PCB::running->setBlocked(true);
    80001558:	00006497          	auipc	s1,0x6
    8000155c:	0484b483          	ld	s1,72(s1) # 800075a0 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001560:	0004b583          	ld	a1,0(s1)

    void *getArg() const { return arg; }

    void setFinished(bool value) { finished = value; }

    void setBlocked(bool value) { blocked = value; }
    80001564:	00100793          	li	a5,1
    80001568:	02f584a3          	sb	a5,41(a1)
        block(PCB::running);
    8000156c:	00000097          	auipc	ra,0x0
    80001570:	ef4080e7          	jalr	-268(ra) # 80001460 <_ZN10SemaphoreK5blockEP3PCB>
        PCB::timeSliceCounter = 0;
    80001574:	00006797          	auipc	a5,0x6
    80001578:	01c7b783          	ld	a5,28(a5) # 80007590 <_GLOBAL_OFFSET_TABLE_+0x10>
    8000157c:	0007b023          	sd	zero,0(a5)
        PCB::dispatch();
    80001580:	00000097          	auipc	ra,0x0
    80001584:	1c8080e7          	jalr	456(ra) # 80001748 <_ZN3PCB8dispatchEv>
        if(PCB::running->isDeblockFromSemClose()){
    80001588:	0004b783          	ld	a5,0(s1)
    bool isDeblockFromSemClose() const { return semClose; }
    8000158c:	02a7c703          	lbu	a4,42(a5)
    80001590:	00071e63          	bnez	a4,800015ac <_ZN10SemaphoreK4waitEv+0x84>
    int retVal=0;
    80001594:	00000513          	li	a0,0
}
    80001598:	01813083          	ld	ra,24(sp)
    8000159c:	01013403          	ld	s0,16(sp)
    800015a0:	00813483          	ld	s1,8(sp)
    800015a4:	02010113          	addi	sp,sp,32
    800015a8:	00008067          	ret

    void setDeblockFromSemClose(bool value) { semClose = value; }
    800015ac:	02078523          	sb	zero,42(a5)
            retVal=-15;
    800015b0:	ff100513          	li	a0,-15
    800015b4:	fe5ff06f          	j	80001598 <_ZN10SemaphoreK4waitEv+0x70>

00000000800015b8 <_ZN10SemaphoreK6signalEv>:

int SemaphoreK::signal() {
    val++;
    800015b8:	00052783          	lw	a5,0(a0)
    800015bc:	0017879b          	addiw	a5,a5,1
    800015c0:	0007871b          	sext.w	a4,a5
    800015c4:	00f52023          	sw	a5,0(a0)
    if(val<=0){
    800015c8:	00e05663          	blez	a4,800015d4 <_ZN10SemaphoreK6signalEv+0x1c>
        PCB* deblockedThread=deblock();
        deblockedThread->setBlocked(false);
        Scheduler::put(deblockedThread);
    }
    return 0;
}
    800015cc:	00000513          	li	a0,0
    800015d0:	00008067          	ret
int SemaphoreK::signal() {
    800015d4:	ff010113          	addi	sp,sp,-16
    800015d8:	00113423          	sd	ra,8(sp)
    800015dc:	00813023          	sd	s0,0(sp)
    800015e0:	01010413          	addi	s0,sp,16
        PCB* deblockedThread=deblock();
    800015e4:	00000097          	auipc	ra,0x0
    800015e8:	ee4080e7          	jalr	-284(ra) # 800014c8 <_ZN10SemaphoreK7deblockEv>
    void setBlocked(bool value) { blocked = value; }
    800015ec:	020504a3          	sb	zero,41(a0)
        Scheduler::put(deblockedThread);
    800015f0:	00001097          	auipc	ra,0x1
    800015f4:	db0080e7          	jalr	-592(ra) # 800023a0 <_ZN9Scheduler3putEP3PCB>
}
    800015f8:	00000513          	li	a0,0
    800015fc:	00813083          	ld	ra,8(sp)
    80001600:	00013403          	ld	s0,0(sp)
    80001604:	01010113          	addi	sp,sp,16
    80001608:	00008067          	ret

000000008000160c <_ZN10SemaphoreKD1Ev>:

SemaphoreK::~SemaphoreK() {
    8000160c:	fe010113          	addi	sp,sp,-32
    80001610:	00113c23          	sd	ra,24(sp)
    80001614:	00813823          	sd	s0,16(sp)
    80001618:	00913423          	sd	s1,8(sp)
    8000161c:	01213023          	sd	s2,0(sp)
    80001620:	02010413          	addi	s0,sp,32
    80001624:	00050913          	mv	s2,a0

    PCB* deblockedThreads=blockedThreadsQueue->removeFirst();
    80001628:	00853783          	ld	a5,8(a0)
    8000162c:	0007b503          	ld	a0,0(a5)
    80001630:	02050463          	beqz	a0,80001658 <_ZN10SemaphoreKD1Ev+0x4c>
        head = head->next;
    80001634:	00853703          	ld	a4,8(a0)
    80001638:	00e7b023          	sd	a4,0(a5)
        if (!head) { tail = 0; }
    8000163c:	00070a63          	beqz	a4,80001650 <_ZN10SemaphoreKD1Ev+0x44>
        T *ret = elem->data;
    80001640:	00053483          	ld	s1,0(a0)
        delete elem;
    80001644:	00000097          	auipc	ra,0x0
    80001648:	5b0080e7          	jalr	1456(ra) # 80001bf4 <_ZdlPv>
        //__mem_free(elem);
        return ret;
    8000164c:	0240006f          	j	80001670 <_ZN10SemaphoreKD1Ev+0x64>
        if (!head) { tail = 0; }
    80001650:	0007b423          	sd	zero,8(a5)
    80001654:	fedff06f          	j	80001640 <_ZN10SemaphoreKD1Ev+0x34>
        if (!head) { return 0; }
    80001658:	00050493          	mv	s1,a0
    8000165c:	0140006f          	j	80001670 <_ZN10SemaphoreKD1Ev+0x64>
        if (!head) { tail = 0; }
    80001660:	0007b423          	sd	zero,8(a5)
        T *ret = elem->data;
    80001664:	00053483          	ld	s1,0(a0)
        delete elem;
    80001668:	00000097          	auipc	ra,0x0
    8000166c:	58c080e7          	jalr	1420(ra) # 80001bf4 <_ZdlPv>
    while(deblockedThreads){
    80001670:	04048263          	beqz	s1,800016b4 <_ZN10SemaphoreKD1Ev+0xa8>
        val++;
    80001674:	00092783          	lw	a5,0(s2)
    80001678:	0017879b          	addiw	a5,a5,1
    8000167c:	00f92023          	sw	a5,0(s2)
    80001680:	020484a3          	sb	zero,41(s1)
    void setDeblockFromSemClose(bool value) { semClose = value; }
    80001684:	00100793          	li	a5,1
    80001688:	02f48523          	sb	a5,42(s1)
        deblockedThreads->setBlocked(false);
        deblockedThreads->setDeblockFromSemClose(true);
        Scheduler::put(deblockedThreads);
    8000168c:	00048513          	mv	a0,s1
    80001690:	00001097          	auipc	ra,0x1
    80001694:	d10080e7          	jalr	-752(ra) # 800023a0 <_ZN9Scheduler3putEP3PCB>
        deblockedThreads=blockedThreadsQueue->removeFirst();
    80001698:	00893783          	ld	a5,8(s2)
        if (!head) { return 0; }
    8000169c:	0007b503          	ld	a0,0(a5)
    800016a0:	00050a63          	beqz	a0,800016b4 <_ZN10SemaphoreKD1Ev+0xa8>
        head = head->next;
    800016a4:	00853703          	ld	a4,8(a0)
    800016a8:	00e7b023          	sd	a4,0(a5)
        if (!head) { tail = 0; }
    800016ac:	fa071ce3          	bnez	a4,80001664 <_ZN10SemaphoreKD1Ev+0x58>
    800016b0:	fb1ff06f          	j	80001660 <_ZN10SemaphoreKD1Ev+0x54>
    }

}
    800016b4:	01813083          	ld	ra,24(sp)
    800016b8:	01013403          	ld	s0,16(sp)
    800016bc:	00813483          	ld	s1,8(sp)
    800016c0:	00013903          	ld	s2,0(sp)
    800016c4:	02010113          	addi	sp,sp,32
    800016c8:	00008067          	ret

00000000800016cc <_ZNK10SemaphoreK22getBlockedThreadsQueueEv>:

List<PCB> *SemaphoreK::getBlockedThreadsQueue() const {
    800016cc:	ff010113          	addi	sp,sp,-16
    800016d0:	00813423          	sd	s0,8(sp)
    800016d4:	01010413          	addi	s0,sp,16
    return blockedThreadsQueue;
}
    800016d8:	00853503          	ld	a0,8(a0)
    800016dc:	00813403          	ld	s0,8(sp)
    800016e0:	01010113          	addi	sp,sp,16
    800016e4:	00008067          	ret

00000000800016e8 <_ZN3PCB13threadWrapperEv>:

    PCB::contextSwitch(&old->context, &running->context);

}

void PCB::threadWrapper() {
    800016e8:	fe010113          	addi	sp,sp,-32
    800016ec:	00113c23          	sd	ra,24(sp)
    800016f0:	00813823          	sd	s0,16(sp)
    800016f4:	00913423          	sd	s1,8(sp)
    800016f8:	02010413          	addi	s0,sp,32
    Riscv::popSppSpie();
    800016fc:	00000097          	auipc	ra,0x0
    80001700:	65c080e7          	jalr	1628(ra) # 80001d58 <_ZN5Riscv10popSppSpieEv>

    running->body(running->getArg());
    80001704:	00006497          	auipc	s1,0x6
    80001708:	eec48493          	addi	s1,s1,-276 # 800075f0 <_ZN3PCB7runningE>
    8000170c:	0004b783          	ld	a5,0(s1)
    80001710:	0007b703          	ld	a4,0(a5)
    80001714:	0307b503          	ld	a0,48(a5)
    80001718:	000700e7          	jalr	a4

    running->setFinished(true);
    8000171c:	0004b783          	ld	a5,0(s1)

    bool isDeblockFromSemClose() const { return semClose; }

    void *getArg() const { return arg; }

    void setFinished(bool value) { finished = value; }
    80001720:	00100713          	li	a4,1
    80001724:	02e78423          	sb	a4,40(a5)

    uint64 number = 0x13;
    __asm__ volatile ("mv a0, %[number]" : : [number] "r"(number));
    80001728:	01300793          	li	a5,19
    8000172c:	00078513          	mv	a0,a5

    __asm__ volatile("ecall");
    80001730:	00000073          	ecall
}
    80001734:	01813083          	ld	ra,24(sp)
    80001738:	01013403          	ld	s0,16(sp)
    8000173c:	00813483          	ld	s1,8(sp)
    80001740:	02010113          	addi	sp,sp,32
    80001744:	00008067          	ret

0000000080001748 <_ZN3PCB8dispatchEv>:
void PCB::dispatch() {
    80001748:	fe010113          	addi	sp,sp,-32
    8000174c:	00113c23          	sd	ra,24(sp)
    80001750:	00813823          	sd	s0,16(sp)
    80001754:	00913423          	sd	s1,8(sp)
    80001758:	02010413          	addi	s0,sp,32
    PCB *old = running;
    8000175c:	00006497          	auipc	s1,0x6
    80001760:	e944b483          	ld	s1,-364(s1) # 800075f0 <_ZN3PCB7runningE>
    bool isFinished() const { return finished; }
    80001764:	0284c783          	lbu	a5,40(s1)
    if (!old->isFinished() && !old->isBlocked()) { Scheduler::put(old); }
    80001768:	00079663          	bnez	a5,80001774 <_ZN3PCB8dispatchEv+0x2c>
    bool isBlocked() const { return blocked; }
    8000176c:	0294c783          	lbu	a5,41(s1)
    80001770:	02078c63          	beqz	a5,800017a8 <_ZN3PCB8dispatchEv+0x60>
    running = Scheduler::get();
    80001774:	00001097          	auipc	ra,0x1
    80001778:	bc4080e7          	jalr	-1084(ra) # 80002338 <_ZN9Scheduler3getEv>
    8000177c:	00006797          	auipc	a5,0x6
    80001780:	e6a7ba23          	sd	a0,-396(a5) # 800075f0 <_ZN3PCB7runningE>
    PCB::contextSwitch(&old->context, &running->context);
    80001784:	01050593          	addi	a1,a0,16
    80001788:	01048513          	addi	a0,s1,16
    8000178c:	00000097          	auipc	ra,0x0
    80001790:	984080e7          	jalr	-1660(ra) # 80001110 <_ZN3PCB13contextSwitchEPNS_7ContextES1_>
}
    80001794:	01813083          	ld	ra,24(sp)
    80001798:	01013403          	ld	s0,16(sp)
    8000179c:	00813483          	ld	s1,8(sp)
    800017a0:	02010113          	addi	sp,sp,32
    800017a4:	00008067          	ret
    if (!old->isFinished() && !old->isBlocked()) { Scheduler::put(old); }
    800017a8:	00048513          	mv	a0,s1
    800017ac:	00001097          	auipc	ra,0x1
    800017b0:	bf4080e7          	jalr	-1036(ra) # 800023a0 <_ZN9Scheduler3putEP3PCB>
    800017b4:	fc1ff06f          	j	80001774 <_ZN3PCB8dispatchEv+0x2c>

00000000800017b8 <_ZN3PCBnwEm>:

void *PCB::operator new(PCB::size_t n) {
    800017b8:	ff010113          	addi	sp,sp,-16
    800017bc:	00113423          	sd	ra,8(sp)
    800017c0:	00813023          	sd	s0,0(sp)
    800017c4:	01010413          	addi	s0,sp,16
    return __mem_alloc(n);
    800017c8:	00004097          	auipc	ra,0x4
    800017cc:	0a0080e7          	jalr	160(ra) # 80005868 <__mem_alloc>
}
    800017d0:	00813083          	ld	ra,8(sp)
    800017d4:	00013403          	ld	s0,0(sp)
    800017d8:	01010113          	addi	sp,sp,16
    800017dc:	00008067          	ret

00000000800017e0 <_ZN3PCBnaEm>:

void *PCB::operator new[](PCB::size_t n) {
    800017e0:	ff010113          	addi	sp,sp,-16
    800017e4:	00113423          	sd	ra,8(sp)
    800017e8:	00813023          	sd	s0,0(sp)
    800017ec:	01010413          	addi	s0,sp,16
    return __mem_alloc(n);
    800017f0:	00004097          	auipc	ra,0x4
    800017f4:	078080e7          	jalr	120(ra) # 80005868 <__mem_alloc>
}
    800017f8:	00813083          	ld	ra,8(sp)
    800017fc:	00013403          	ld	s0,0(sp)
    80001800:	01010113          	addi	sp,sp,16
    80001804:	00008067          	ret

0000000080001808 <_ZN3PCBdlEPv>:

void PCB::operator delete(void *p)

noexcept {
    80001808:	ff010113          	addi	sp,sp,-16
    8000180c:	00113423          	sd	ra,8(sp)
    80001810:	00813023          	sd	s0,0(sp)
    80001814:	01010413          	addi	s0,sp,16
__mem_free(p);
    80001818:	00004097          	auipc	ra,0x4
    8000181c:	f84080e7          	jalr	-124(ra) # 8000579c <__mem_free>
}
    80001820:	00813083          	ld	ra,8(sp)
    80001824:	00013403          	ld	s0,0(sp)
    80001828:	01010113          	addi	sp,sp,16
    8000182c:	00008067          	ret

0000000080001830 <_ZN3PCB12createThreadEPFvPvES0_Pm>:
PCB *PCB::createThread(PCB::Body body, void *arg, uint64 *stek) {
    80001830:	fd010113          	addi	sp,sp,-48
    80001834:	02113423          	sd	ra,40(sp)
    80001838:	02813023          	sd	s0,32(sp)
    8000183c:	00913c23          	sd	s1,24(sp)
    80001840:	01213823          	sd	s2,16(sp)
    80001844:	01313423          	sd	s3,8(sp)
    80001848:	01413023          	sd	s4,0(sp)
    8000184c:	03010413          	addi	s0,sp,48
    80001850:	00050913          	mv	s2,a0
    80001854:	00058a13          	mv	s4,a1
    80001858:	00060993          	mv	s3,a2
    return new PCB(body, arg, stek);
    8000185c:	03800513          	li	a0,56
    80001860:	00000097          	auipc	ra,0x0
    80001864:	f58080e7          	jalr	-168(ra) # 800017b8 <_ZN3PCBnwEm>
    80001868:	00050493          	mv	s1,a0
                    }),
            timeSlice(DEFAULT_TIME_SLICE),
            finished(false),
            blocked(false),
            semClose(false),
            arg(arg) {
    8000186c:	01253023          	sd	s2,0(a0)
            stack(body != nullptr ? stek : nullptr),
    80001870:	04090a63          	beqz	s2,800018c4 <_ZN3PCB12createThreadEPFvPvES0_Pm+0x94>
            arg(arg) {
    80001874:	0134b423          	sd	s3,8(s1)
    80001878:	00000797          	auipc	a5,0x0
    8000187c:	e7078793          	addi	a5,a5,-400 # 800016e8 <_ZN3PCB13threadWrapperEv>
    80001880:	00f4b823          	sd	a5,16(s1)
                            stack != nullptr ? (uint64) &stack + DEFAULT_STACK_SIZE : 0
    80001884:	04098463          	beqz	s3,800018cc <_ZN3PCB12createThreadEPFvPvES0_Pm+0x9c>
    80001888:	00848793          	addi	a5,s1,8
    8000188c:	00001737          	lui	a4,0x1
    80001890:	00e787b3          	add	a5,a5,a4
            arg(arg) {
    80001894:	00f4bc23          	sd	a5,24(s1)
    80001898:	00200793          	li	a5,2
    8000189c:	02f4b023          	sd	a5,32(s1)
    800018a0:	02048423          	sb	zero,40(s1)
    800018a4:	020484a3          	sb	zero,41(s1)
    800018a8:	02048523          	sb	zero,42(s1)
    800018ac:	0344b823          	sd	s4,48(s1)
        if (body != nullptr) {
    800018b0:	04090063          	beqz	s2,800018f0 <_ZN3PCB12createThreadEPFvPvES0_Pm+0xc0>
            Scheduler::put(this);
    800018b4:	00048513          	mv	a0,s1
    800018b8:	00001097          	auipc	ra,0x1
    800018bc:	ae8080e7          	jalr	-1304(ra) # 800023a0 <_ZN9Scheduler3putEP3PCB>
    800018c0:	0300006f          	j	800018f0 <_ZN3PCB12createThreadEPFvPvES0_Pm+0xc0>
            stack(body != nullptr ? stek : nullptr),
    800018c4:	00000993          	li	s3,0
    800018c8:	fadff06f          	j	80001874 <_ZN3PCB12createThreadEPFvPvES0_Pm+0x44>
                            stack != nullptr ? (uint64) &stack + DEFAULT_STACK_SIZE : 0
    800018cc:	00000793          	li	a5,0
    800018d0:	fc5ff06f          	j	80001894 <_ZN3PCB12createThreadEPFvPvES0_Pm+0x64>
    800018d4:	00050913          	mv	s2,a0
    800018d8:	00048513          	mv	a0,s1
    800018dc:	00000097          	auipc	ra,0x0
    800018e0:	f2c080e7          	jalr	-212(ra) # 80001808 <_ZN3PCBdlEPv>
    800018e4:	00090513          	mv	a0,s2
    800018e8:	00007097          	auipc	ra,0x7
    800018ec:	e10080e7          	jalr	-496(ra) # 800086f8 <_Unwind_Resume>
}
    800018f0:	00048513          	mv	a0,s1
    800018f4:	02813083          	ld	ra,40(sp)
    800018f8:	02013403          	ld	s0,32(sp)
    800018fc:	01813483          	ld	s1,24(sp)
    80001900:	01013903          	ld	s2,16(sp)
    80001904:	00813983          	ld	s3,8(sp)
    80001908:	00013a03          	ld	s4,0(sp)
    8000190c:	03010113          	addi	sp,sp,48
    80001910:	00008067          	ret

0000000080001914 <_ZN3PCBdaEPv>:

void PCB::operator delete[](void *p)

noexcept {
    80001914:	ff010113          	addi	sp,sp,-16
    80001918:	00113423          	sd	ra,8(sp)
    8000191c:	00813023          	sd	s0,0(sp)
    80001920:	01010413          	addi	s0,sp,16
__mem_free(p);
    80001924:	00004097          	auipc	ra,0x4
    80001928:	e78080e7          	jalr	-392(ra) # 8000579c <__mem_free>
}
    8000192c:	00813083          	ld	ra,8(sp)
    80001930:	00013403          	ld	s0,0(sp)
    80001934:	01010113          	addi	sp,sp,16
    80001938:	00008067          	ret

000000008000193c <_ZNK3PCB12getTimeSliceEv>:

uint64 PCB::getTimeSlice() const {
    8000193c:	ff010113          	addi	sp,sp,-16
    80001940:	00813423          	sd	s0,8(sp)
    80001944:	01010413          	addi	s0,sp,16
    return timeSlice;
}
    80001948:	02053503          	ld	a0,32(a0)
    8000194c:	00813403          	ld	s0,8(sp)
    80001950:	01010113          	addi	sp,sp,16
    80001954:	00008067          	ret

0000000080001958 <_Z15userMainWrapperPv>:

extern void userMain();

bool endUserMain = false;

void userMainWrapper(void *param) {
    80001958:	ff010113          	addi	sp,sp,-16
    8000195c:	00113423          	sd	ra,8(sp)
    80001960:	00813023          	sd	s0,0(sp)
    80001964:	01010413          	addi	s0,sp,16
    userMain();
    80001968:	00002097          	auipc	ra,0x2
    8000196c:	820080e7          	jalr	-2016(ra) # 80003188 <_Z8userMainv>
    endUserMain = true;
    80001970:	00100793          	li	a5,1
    80001974:	00006717          	auipc	a4,0x6
    80001978:	c8f70623          	sb	a5,-884(a4) # 80007600 <endUserMain>
}
    8000197c:	00813083          	ld	ra,8(sp)
    80001980:	00013403          	ld	s0,0(sp)
    80001984:	01010113          	addi	sp,sp,16
    80001988:	00008067          	ret

000000008000198c <main>:

void main() {
    8000198c:	ff010113          	addi	sp,sp,-16
    80001990:	00113423          	sd	ra,8(sp)
    80001994:	00813023          	sd	s0,0(sp)
    80001998:	01010413          	addi	s0,sp,16

    Riscv::w_stvec((uint64) &Riscv::supervisorTrap);
    8000199c:	00006797          	auipc	a5,0x6
    800019a0:	bec7b783          	ld	a5,-1044(a5) # 80007588 <_GLOBAL_OFFSET_TABLE_+0x8>
    __asm__ volatile("csrr %[stvec], stvec":[stvec] "=r"(stvec));
    return stvec;
}

inline void Riscv::w_stvec(uint64 stvec) {
    __asm__ volatile("csrw stvec, %[stvec]": :[stvec] "r"(stvec));
    800019a4:	10579073          	csrw	stvec,a5


    PCB *thread = PCB::createThread(nullptr, nullptr, nullptr);
    800019a8:	00000613          	li	a2,0
    800019ac:	00000593          	li	a1,0
    800019b0:	00000513          	li	a0,0
    800019b4:	00000097          	auipc	ra,0x0
    800019b8:	e7c080e7          	jalr	-388(ra) # 80001830 <_ZN3PCB12createThreadEPFvPvES0_Pm>
    PCB::running = thread;
    800019bc:	00006797          	auipc	a5,0x6
    800019c0:	be47b783          	ld	a5,-1052(a5) # 800075a0 <_GLOBAL_OFFSET_TABLE_+0x20>
    800019c4:	00a7b023          	sd	a0,0(a5)

    uint64 *stack = (uint64 *) __mem_alloc(DEFAULT_STACK_SIZE);
    800019c8:	00001537          	lui	a0,0x1
    800019cc:	00004097          	auipc	ra,0x4
    800019d0:	e9c080e7          	jalr	-356(ra) # 80005868 <__mem_alloc>
    800019d4:	00050613          	mv	a2,a0
    PCB::createThread(&userMainWrapper, nullptr, stack);
    800019d8:	00000593          	li	a1,0
    800019dc:	00000517          	auipc	a0,0x0
    800019e0:	f7c50513          	addi	a0,a0,-132 # 80001958 <_Z15userMainWrapperPv>
    800019e4:	00000097          	auipc	ra,0x0
    800019e8:	e4c080e7          	jalr	-436(ra) # 80001830 <_ZN3PCB12createThreadEPFvPvES0_Pm>

    while (!endUserMain) {
    800019ec:	00006797          	auipc	a5,0x6
    800019f0:	c147c783          	lbu	a5,-1004(a5) # 80007600 <endUserMain>
    800019f4:	00079a63          	bnez	a5,80001a08 <main+0x7c>
        uint64 number = 0x13;
        __asm__ volatile ("mv a0, %[number]" : : [number] "r"(number));
    800019f8:	01300793          	li	a5,19
    800019fc:	00078513          	mv	a0,a5

        __asm__ volatile("ecall");
    80001a00:	00000073          	ecall
    while (!endUserMain) {
    80001a04:	fe9ff06f          	j	800019ec <main+0x60>
    }
//    userMain();



    printString("Finished all\n");
    80001a08:	00004517          	auipc	a0,0x4
    80001a0c:	5f850513          	addi	a0,a0,1528 # 80006000 <kvmincrease+0x520>
    80001a10:	00001097          	auipc	ra,0x1
    80001a14:	ad0080e7          	jalr	-1328(ra) # 800024e0 <_Z11printStringPKc>

}
    80001a18:	00813083          	ld	ra,8(sp)
    80001a1c:	00013403          	ld	s0,0(sp)
    80001a20:	01010113          	addi	sp,sp,16
    80001a24:	00008067          	ret

0000000080001a28 <_ZN6Thread7starterEPv>:
    thread_dispatch();
}

void Thread::starter(void* toStart) {
    Thread *t=(Thread*)toStart;
    if(t)
    80001a28:	02050863          	beqz	a0,80001a58 <_ZN6Thread7starterEPv+0x30>
void Thread::starter(void* toStart) {
    80001a2c:	ff010113          	addi	sp,sp,-16
    80001a30:	00113423          	sd	ra,8(sp)
    80001a34:	00813023          	sd	s0,0(sp)
    80001a38:	01010413          	addi	s0,sp,16
        t->run();
    80001a3c:	00053783          	ld	a5,0(a0)
    80001a40:	0107b783          	ld	a5,16(a5)
    80001a44:	000780e7          	jalr	a5
}
    80001a48:	00813083          	ld	ra,8(sp)
    80001a4c:	00013403          	ld	s0,0(sp)
    80001a50:	01010113          	addi	sp,sp,16
    80001a54:	00008067          	ret
    80001a58:	00008067          	ret

0000000080001a5c <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {
    sem_open(&myHandle,init);
}

Semaphore::~Semaphore() {
    80001a5c:	ff010113          	addi	sp,sp,-16
    80001a60:	00113423          	sd	ra,8(sp)
    80001a64:	00813023          	sd	s0,0(sp)
    80001a68:	01010413          	addi	s0,sp,16
    80001a6c:	00006797          	auipc	a5,0x6
    80001a70:	a7478793          	addi	a5,a5,-1420 # 800074e0 <_ZTV9Semaphore+0x10>
    80001a74:	00f53023          	sd	a5,0(a0)
    sem_close(myHandle);
    80001a78:	00853503          	ld	a0,8(a0)
    80001a7c:	fffff097          	auipc	ra,0xfffff
    80001a80:	7c0080e7          	jalr	1984(ra) # 8000123c <_Z9sem_closeP10SemaphoreK>
}
    80001a84:	00813083          	ld	ra,8(sp)
    80001a88:	00013403          	ld	s0,0(sp)
    80001a8c:	01010113          	addi	sp,sp,16
    80001a90:	00008067          	ret

0000000080001a94 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void *), void *arg) {
    80001a94:	ff010113          	addi	sp,sp,-16
    80001a98:	00113423          	sd	ra,8(sp)
    80001a9c:	00813023          	sd	s0,0(sp)
    80001aa0:	01010413          	addi	s0,sp,16
    80001aa4:	00006797          	auipc	a5,0x6
    80001aa8:	a1478793          	addi	a5,a5,-1516 # 800074b8 <_ZTV6Thread+0x10>
    80001aac:	00f53023          	sd	a5,0(a0)
    thread_create(&this->myHandle, body, arg);
    80001ab0:	00850513          	addi	a0,a0,8
    80001ab4:	fffff097          	auipc	ra,0xfffff
    80001ab8:	690080e7          	jalr	1680(ra) # 80001144 <_Z13thread_createPP3PCBPFvPvES2_>
}
    80001abc:	00813083          	ld	ra,8(sp)
    80001ac0:	00013403          	ld	s0,0(sp)
    80001ac4:	01010113          	addi	sp,sp,16
    80001ac8:	00008067          	ret

0000000080001acc <_ZN6Thread5startEv>:
    if(!myHandle){
    80001acc:	00853783          	ld	a5,8(a0)
    80001ad0:	02079e63          	bnez	a5,80001b0c <_ZN6Thread5startEv+0x40>
int Thread::start() {
    80001ad4:	ff010113          	addi	sp,sp,-16
    80001ad8:	00113423          	sd	ra,8(sp)
    80001adc:	00813023          	sd	s0,0(sp)
    80001ae0:	01010413          	addi	s0,sp,16
        return thread_create(&this->myHandle, &Thread::starter, this);
    80001ae4:	00050613          	mv	a2,a0
    80001ae8:	00000597          	auipc	a1,0x0
    80001aec:	f4058593          	addi	a1,a1,-192 # 80001a28 <_ZN6Thread7starterEPv>
    80001af0:	00850513          	addi	a0,a0,8
    80001af4:	fffff097          	auipc	ra,0xfffff
    80001af8:	650080e7          	jalr	1616(ra) # 80001144 <_Z13thread_createPP3PCBPFvPvES2_>
}
    80001afc:	00813083          	ld	ra,8(sp)
    80001b00:	00013403          	ld	s0,0(sp)
    80001b04:	01010113          	addi	sp,sp,16
    80001b08:	00008067          	ret
    return -8;
    80001b0c:	ff800513          	li	a0,-8
}
    80001b10:	00008067          	ret

0000000080001b14 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80001b14:	ff010113          	addi	sp,sp,-16
    80001b18:	00113423          	sd	ra,8(sp)
    80001b1c:	00813023          	sd	s0,0(sp)
    80001b20:	01010413          	addi	s0,sp,16
    thread_dispatch();
    80001b24:	fffff097          	auipc	ra,0xfffff
    80001b28:	6c0080e7          	jalr	1728(ra) # 800011e4 <_Z15thread_dispatchv>
}
    80001b2c:	00813083          	ld	ra,8(sp)
    80001b30:	00013403          	ld	s0,0(sp)
    80001b34:	01010113          	addi	sp,sp,16
    80001b38:	00008067          	ret

0000000080001b3c <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    80001b3c:	ff010113          	addi	sp,sp,-16
    80001b40:	00113423          	sd	ra,8(sp)
    80001b44:	00813023          	sd	s0,0(sp)
    80001b48:	01010413          	addi	s0,sp,16
    80001b4c:	00006797          	auipc	a5,0x6
    80001b50:	99478793          	addi	a5,a5,-1644 # 800074e0 <_ZTV9Semaphore+0x10>
    80001b54:	00f53023          	sd	a5,0(a0)
    sem_open(&myHandle,init);
    80001b58:	00850513          	addi	a0,a0,8
    80001b5c:	fffff097          	auipc	ra,0xfffff
    80001b60:	6ac080e7          	jalr	1708(ra) # 80001208 <_Z8sem_openPP10SemaphoreKj>
}
    80001b64:	00813083          	ld	ra,8(sp)
    80001b68:	00013403          	ld	s0,0(sp)
    80001b6c:	01010113          	addi	sp,sp,16
    80001b70:	00008067          	ret

0000000080001b74 <_ZN9Semaphore4waitEv>:

int Semaphore::wait() {
    80001b74:	ff010113          	addi	sp,sp,-16
    80001b78:	00113423          	sd	ra,8(sp)
    80001b7c:	00813023          	sd	s0,0(sp)
    80001b80:	01010413          	addi	s0,sp,16
    return sem_wait(myHandle);
    80001b84:	00853503          	ld	a0,8(a0)
    80001b88:	fffff097          	auipc	ra,0xfffff
    80001b8c:	6e4080e7          	jalr	1764(ra) # 8000126c <_Z8sem_waitP10SemaphoreK>
}
    80001b90:	00813083          	ld	ra,8(sp)
    80001b94:	00013403          	ld	s0,0(sp)
    80001b98:	01010113          	addi	sp,sp,16
    80001b9c:	00008067          	ret

0000000080001ba0 <_ZN9Semaphore6signalEv>:

int Semaphore::signal() {
    80001ba0:	ff010113          	addi	sp,sp,-16
    80001ba4:	00113423          	sd	ra,8(sp)
    80001ba8:	00813023          	sd	s0,0(sp)
    80001bac:	01010413          	addi	s0,sp,16
    return sem_signal(myHandle);
    80001bb0:	00853503          	ld	a0,8(a0)
    80001bb4:	fffff097          	auipc	ra,0xfffff
    80001bb8:	6e8080e7          	jalr	1768(ra) # 8000129c <_Z10sem_signalP10SemaphoreK>
}
    80001bbc:	00813083          	ld	ra,8(sp)
    80001bc0:	00013403          	ld	s0,0(sp)
    80001bc4:	01010113          	addi	sp,sp,16
    80001bc8:	00008067          	ret

0000000080001bcc <_Znwm>:

void *operator new(size_t n) {
    80001bcc:	ff010113          	addi	sp,sp,-16
    80001bd0:	00113423          	sd	ra,8(sp)
    80001bd4:	00813023          	sd	s0,0(sp)
    80001bd8:	01010413          	addi	s0,sp,16
    return __mem_alloc(n);
    80001bdc:	00004097          	auipc	ra,0x4
    80001be0:	c8c080e7          	jalr	-884(ra) # 80005868 <__mem_alloc>
}
    80001be4:	00813083          	ld	ra,8(sp)
    80001be8:	00013403          	ld	s0,0(sp)
    80001bec:	01010113          	addi	sp,sp,16
    80001bf0:	00008067          	ret

0000000080001bf4 <_ZdlPv>:

void operator delete(void *p) {
    80001bf4:	ff010113          	addi	sp,sp,-16
    80001bf8:	00113423          	sd	ra,8(sp)
    80001bfc:	00813023          	sd	s0,0(sp)
    80001c00:	01010413          	addi	s0,sp,16
    __mem_free(p);
    80001c04:	00004097          	auipc	ra,0x4
    80001c08:	b98080e7          	jalr	-1128(ra) # 8000579c <__mem_free>
}
    80001c0c:	00813083          	ld	ra,8(sp)
    80001c10:	00013403          	ld	s0,0(sp)
    80001c14:	01010113          	addi	sp,sp,16
    80001c18:	00008067          	ret

0000000080001c1c <_ZN6ThreadD1Ev>:
Thread::~Thread() {
    80001c1c:	fe010113          	addi	sp,sp,-32
    80001c20:	00113c23          	sd	ra,24(sp)
    80001c24:	00813823          	sd	s0,16(sp)
    80001c28:	00913423          	sd	s1,8(sp)
    80001c2c:	02010413          	addi	s0,sp,32
    80001c30:	00006797          	auipc	a5,0x6
    80001c34:	88878793          	addi	a5,a5,-1912 # 800074b8 <_ZTV6Thread+0x10>
    80001c38:	00f53023          	sd	a5,0(a0)
    ::delete myHandle;
    80001c3c:	00853483          	ld	s1,8(a0)
    80001c40:	00048e63          	beqz	s1,80001c5c <_ZN6ThreadD1Ev+0x40>
    ~PCB() { __mem_free(stack); }
    80001c44:	0084b503          	ld	a0,8(s1)
    80001c48:	00004097          	auipc	ra,0x4
    80001c4c:	b54080e7          	jalr	-1196(ra) # 8000579c <__mem_free>
    80001c50:	00048513          	mv	a0,s1
    80001c54:	00000097          	auipc	ra,0x0
    80001c58:	fa0080e7          	jalr	-96(ra) # 80001bf4 <_ZdlPv>
}
    80001c5c:	01813083          	ld	ra,24(sp)
    80001c60:	01013403          	ld	s0,16(sp)
    80001c64:	00813483          	ld	s1,8(sp)
    80001c68:	02010113          	addi	sp,sp,32
    80001c6c:	00008067          	ret

0000000080001c70 <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    80001c70:	fe010113          	addi	sp,sp,-32
    80001c74:	00113c23          	sd	ra,24(sp)
    80001c78:	00813823          	sd	s0,16(sp)
    80001c7c:	00913423          	sd	s1,8(sp)
    80001c80:	02010413          	addi	s0,sp,32
    80001c84:	00050493          	mv	s1,a0
}
    80001c88:	00000097          	auipc	ra,0x0
    80001c8c:	f94080e7          	jalr	-108(ra) # 80001c1c <_ZN6ThreadD1Ev>
    80001c90:	00048513          	mv	a0,s1
    80001c94:	00000097          	auipc	ra,0x0
    80001c98:	f60080e7          	jalr	-160(ra) # 80001bf4 <_ZdlPv>
    80001c9c:	01813083          	ld	ra,24(sp)
    80001ca0:	01013403          	ld	s0,16(sp)
    80001ca4:	00813483          	ld	s1,8(sp)
    80001ca8:	02010113          	addi	sp,sp,32
    80001cac:	00008067          	ret

0000000080001cb0 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    80001cb0:	fe010113          	addi	sp,sp,-32
    80001cb4:	00113c23          	sd	ra,24(sp)
    80001cb8:	00813823          	sd	s0,16(sp)
    80001cbc:	00913423          	sd	s1,8(sp)
    80001cc0:	02010413          	addi	s0,sp,32
    80001cc4:	00050493          	mv	s1,a0
}
    80001cc8:	00000097          	auipc	ra,0x0
    80001ccc:	d94080e7          	jalr	-620(ra) # 80001a5c <_ZN9SemaphoreD1Ev>
    80001cd0:	00048513          	mv	a0,s1
    80001cd4:	00000097          	auipc	ra,0x0
    80001cd8:	f20080e7          	jalr	-224(ra) # 80001bf4 <_ZdlPv>
    80001cdc:	01813083          	ld	ra,24(sp)
    80001ce0:	01013403          	ld	s0,16(sp)
    80001ce4:	00813483          	ld	s1,8(sp)
    80001ce8:	02010113          	addi	sp,sp,32
    80001cec:	00008067          	ret

0000000080001cf0 <_ZN7Console4getcEv>:

char Console::getc() {
    80001cf0:	ff010113          	addi	sp,sp,-16
    80001cf4:	00113423          	sd	ra,8(sp)
    80001cf8:	00813023          	sd	s0,0(sp)
    80001cfc:	01010413          	addi	s0,sp,16
    return ::getc();
    80001d00:	fffff097          	auipc	ra,0xfffff
    80001d04:	5cc080e7          	jalr	1484(ra) # 800012cc <_Z4getcv>
}
    80001d08:	00813083          	ld	ra,8(sp)
    80001d0c:	00013403          	ld	s0,0(sp)
    80001d10:	01010113          	addi	sp,sp,16
    80001d14:	00008067          	ret

0000000080001d18 <_ZN7Console4putcEc>:

void Console::putc(char c) {
    80001d18:	ff010113          	addi	sp,sp,-16
    80001d1c:	00113423          	sd	ra,8(sp)
    80001d20:	00813023          	sd	s0,0(sp)
    80001d24:	01010413          	addi	s0,sp,16
    ::putc(c);
    80001d28:	fffff097          	auipc	ra,0xfffff
    80001d2c:	5d0080e7          	jalr	1488(ra) # 800012f8 <_Z4putcc>
}
    80001d30:	00813083          	ld	ra,8(sp)
    80001d34:	00013403          	ld	s0,0(sp)
    80001d38:	01010113          	addi	sp,sp,16
    80001d3c:	00008067          	ret

0000000080001d40 <_ZN6Thread3runEv>:
    //static int sleep(time_t);

protected:
    Thread() : myHandle(nullptr) {}

    virtual void run() {}
    80001d40:	ff010113          	addi	sp,sp,-16
    80001d44:	00813423          	sd	s0,8(sp)
    80001d48:	01010413          	addi	s0,sp,16
    80001d4c:	00813403          	ld	s0,8(sp)
    80001d50:	01010113          	addi	sp,sp,16
    80001d54:	00008067          	ret

0000000080001d58 <_ZN5Riscv10popSppSpieEv>:
#include "../test/printing.hpp"
#include "../lib/console.h"
#include "../h/semaphoreK.hpp"


void Riscv::popSppSpie() {
    80001d58:	ff010113          	addi	sp,sp,-16
    80001d5c:	00813423          	sd	s0,8(sp)
    80001d60:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrw sepc, ra");
    80001d64:	14109073          	csrw	sepc,ra
    __asm__ volatile("sret");
    80001d68:	10200073          	sret
}
    80001d6c:	00813403          	ld	s0,8(sp)
    80001d70:	01010113          	addi	sp,sp,16
    80001d74:	00008067          	ret

0000000080001d78 <_ZN5Riscv20handleSupervisorTrapEv>:

void Riscv::handleSupervisorTrap() {
    80001d78:	e7010113          	addi	sp,sp,-400
    80001d7c:	18113423          	sd	ra,392(sp)
    80001d80:	18813023          	sd	s0,384(sp)
    80001d84:	16913c23          	sd	s1,376(sp)
    80001d88:	17213823          	sd	s2,368(sp)
    80001d8c:	19010413          	addi	s0,sp,400
    __asm__ volatile("csrr %[scause], scause":[scause] "=r"(scause));
    80001d90:	142027f3          	csrr	a5,scause
    80001d94:	f2f43423          	sd	a5,-216(s0)
    return scause;
    80001d98:	f2843703          	ld	a4,-216(s0)
    uint64 scause = r_scause();

    if (scause == 0x0000000000000008UL || scause==0x0000000000000009UL) {
    80001d9c:	ff870693          	addi	a3,a4,-8
    80001da0:	00100793          	li	a5,1
    80001da4:	04d7fa63          	bgeu	a5,a3,80001df8 <_ZN5Riscv20handleSupervisorTrapEv+0x80>

            w_sstatus(sstatus);
            w_sepc(sepc);
        }

    } else if (scause == 0x8000000000000001UL) {
    80001da8:	fff00793          	li	a5,-1
    80001dac:	03f79793          	slli	a5,a5,0x3f
    80001db0:	00178793          	addi	a5,a5,1
    80001db4:	40f70c63          	beq	a4,a5,800021cc <_ZN5Riscv20handleSupervisorTrapEv+0x454>
        uint64 volatile sstatus = r_sstatus();
        mc_sip(SIP_SSIP);
        w_sstatus(sstatus);
        w_sepc(sepc);
    }
    else if (scause == 0x8000000000000009UL) {
    80001db8:	fff00793          	li	a5,-1
    80001dbc:	03f79793          	slli	a5,a5,0x3f
    80001dc0:	00978793          	addi	a5,a5,9
    80001dc4:	44f70263          	beq	a4,a5,80002208 <_ZN5Riscv20handleSupervisorTrapEv+0x490>
        console_handler();
        w_sstatus(sstatus);
        w_sepc(sepc);
    }

    else if(scause == 0x0000000000000002UL){
    80001dc8:	00200793          	li	a5,2
    80001dcc:	46f70c63          	beq	a4,a5,80002244 <_ZN5Riscv20handleSupervisorTrapEv+0x4cc>
        printString("Uslo se u ilegall instruction!");
        return;
    }
    else{
        printString("Uslo se u neki drugi prekid!");
    80001dd0:	00004517          	auipc	a0,0x4
    80001dd4:	2b850513          	addi	a0,a0,696 # 80006088 <kvmincrease+0x5a8>
    80001dd8:	00000097          	auipc	ra,0x0
    80001ddc:	708080e7          	jalr	1800(ra) # 800024e0 <_Z11printStringPKc>
        return;
    }
}
    80001de0:	18813083          	ld	ra,392(sp)
    80001de4:	18013403          	ld	s0,384(sp)
    80001de8:	17813483          	ld	s1,376(sp)
    80001dec:	17013903          	ld	s2,368(sp)
    80001df0:	19010113          	addi	sp,sp,400
    80001df4:	00008067          	ret
        __asm__ volatile ("mv %[regA0], a0" : [regA0] "=r"(regA0));
    80001df8:	00050793          	mv	a5,a0
        if (regA0 == 0x11UL) {
    80001dfc:	01100713          	li	a4,17
    80001e00:	08e78663          	beq	a5,a4,80001e8c <_ZN5Riscv20handleSupervisorTrapEv+0x114>
        } else if (regA0 == 0x12UL) {
    80001e04:	01200713          	li	a4,18
    80001e08:	10e78663          	beq	a5,a4,80001f14 <_ZN5Riscv20handleSupervisorTrapEv+0x19c>
        } else if (regA0 == 0x13UL) {
    80001e0c:	01300713          	li	a4,19
    80001e10:	16e78663          	beq	a5,a4,80001f7c <_ZN5Riscv20handleSupervisorTrapEv+0x204>
        } else if (regA0 == 0x21UL) {
    80001e14:	02100713          	li	a4,33
    80001e18:	1ae78863          	beq	a5,a4,80001fc8 <_ZN5Riscv20handleSupervisorTrapEv+0x250>
        } else if (regA0 == 0x22UL) {
    80001e1c:	02200713          	li	a4,34
    80001e20:	22e78663          	beq	a5,a4,8000204c <_ZN5Riscv20handleSupervisorTrapEv+0x2d4>
        } else if (regA0 == 0x23UL) {
    80001e24:	02300713          	li	a4,35
    80001e28:	2ce78863          	beq	a5,a4,800020f8 <_ZN5Riscv20handleSupervisorTrapEv+0x380>
        } else if (regA0 == 0x24UL) {
    80001e2c:	02400713          	li	a4,36
    80001e30:	30e78863          	beq	a5,a4,80002140 <_ZN5Riscv20handleSupervisorTrapEv+0x3c8>
        else if (regA0 == 0x41UL) {
    80001e34:	04100713          	li	a4,65
    80001e38:	34e78863          	beq	a5,a4,80002188 <_ZN5Riscv20handleSupervisorTrapEv+0x410>
        else if (regA0 == 0x42UL) {
    80001e3c:	04200713          	li	a4,66
    80001e40:	fae790e3          	bne	a5,a4,80001de0 <_ZN5Riscv20handleSupervisorTrapEv+0x68>
    __asm__ volatile("csrr %[sepc], sepc":[sepc] "=r"(sepc));
    80001e44:	141027f3          	csrr	a5,sepc
    80001e48:	faf43c23          	sd	a5,-72(s0)
    return sepc;
    80001e4c:	fb843783          	ld	a5,-72(s0)
            uint64 volatile sepc = r_sepc() + 4;
    80001e50:	00478793          	addi	a5,a5,4
    80001e54:	eef43c23          	sd	a5,-264(s0)
}

inline uint64 Riscv::r_sstatus()
{
    uint64 volatile sstatus;
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80001e58:	100027f3          	csrr	a5,sstatus
    80001e5c:	faf43823          	sd	a5,-80(s0)
    return sstatus;
    80001e60:	fb043783          	ld	a5,-80(s0)
            uint64 volatile sstatus = r_sstatus();
    80001e64:	f0f43023          	sd	a5,-256(s0)
            __asm__ volatile ("mv %[c], a2" : [c] "=r"(c));
    80001e68:	00060513          	mv	a0,a2
            __putc(c);
    80001e6c:	0ff57513          	andi	a0,a0,255
    80001e70:	00004097          	auipc	ra,0x4
    80001e74:	b50080e7          	jalr	-1200(ra) # 800059c0 <__putc>
            w_sstatus(sstatus);
    80001e78:	f0043783          	ld	a5,-256(s0)
}

inline void Riscv::w_sstatus(uint64 sstatus)
{
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80001e7c:	10079073          	csrw	sstatus,a5
            w_sepc(sepc);
    80001e80:	ef843783          	ld	a5,-264(s0)
    __asm__ volatile("csrw sepc, %[sepc]": : [sepc] "r"(sepc));
    80001e84:	14179073          	csrw	sepc,a5
}
    80001e88:	f59ff06f          	j	80001de0 <_ZN5Riscv20handleSupervisorTrapEv+0x68>
    __asm__ volatile("csrr %[sepc], sepc":[sepc] "=r"(sepc));
    80001e8c:	141027f3          	csrr	a5,sepc
    80001e90:	f2f43c23          	sd	a5,-200(s0)
    return sepc;
    80001e94:	f3843783          	ld	a5,-200(s0)
            uint64 volatile sepc = r_sepc() + 4;
    80001e98:	00478793          	addi	a5,a5,4
    80001e9c:	e6f43c23          	sd	a5,-392(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80001ea0:	100027f3          	csrr	a5,sstatus
    80001ea4:	f2f43823          	sd	a5,-208(s0)
    return sstatus;
    80001ea8:	f3043783          	ld	a5,-208(s0)
            uint64 volatile sstatus = r_sstatus();
    80001eac:	e8f43023          	sd	a5,-384(s0)
            __asm__ volatile ("mv %[handle], a1" : [handle] "=r"(handle));
    80001eb0:	00058913          	mv	s2,a1
            __asm__ volatile ("mv %[start_routine], a2" : [start_routine] "=r"(start_routine));
    80001eb4:	00060513          	mv	a0,a2
            __asm__ volatile ("mv %[arg], a6" : [arg] "=r"(arg));
    80001eb8:	00080593          	mv	a1,a6
            __asm__ volatile ("mv %[stack_space], a7" : [stack_space] "=r"(stack_space));
    80001ebc:	00088613          	mv	a2,a7
            PCB *newThread = PCB::createThread(start_routine, arg, stack_space);
    80001ec0:	00000097          	auipc	ra,0x0
    80001ec4:	970080e7          	jalr	-1680(ra) # 80001830 <_ZN3PCB12createThreadEPFvPvES0_Pm>
    80001ec8:	00050493          	mv	s1,a0
            if (newThread) {
    80001ecc:	02050263          	beqz	a0,80001ef0 <_ZN5Riscv20handleSupervisorTrapEv+0x178>
                printString("Kreirana je nit");
    80001ed0:	00004517          	auipc	a0,0x4
    80001ed4:	14050513          	addi	a0,a0,320 # 80006010 <kvmincrease+0x530>
    80001ed8:	00000097          	auipc	ra,0x0
    80001edc:	608080e7          	jalr	1544(ra) # 800024e0 <_Z11printStringPKc>
                if (handle) {
    80001ee0:	02090663          	beqz	s2,80001f0c <_ZN5Riscv20handleSupervisorTrapEv+0x194>
                    *handle = newThread;
    80001ee4:	00993023          	sd	s1,0(s2)
                    returnValue = 0;
    80001ee8:	00000793          	li	a5,0
    80001eec:	0080006f          	j	80001ef4 <_ZN5Riscv20handleSupervisorTrapEv+0x17c>
                returnValue = -2;
    80001ef0:	ffe00793          	li	a5,-2
            __asm__ volatile ("mv a0, %[returnValue]" : : [returnValue] "r"(returnValue));
    80001ef4:	00078513          	mv	a0,a5
            w_sstatus(sstatus);
    80001ef8:	e8043783          	ld	a5,-384(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80001efc:	10079073          	csrw	sstatus,a5
            w_sepc(sepc);
    80001f00:	e7843783          	ld	a5,-392(s0)
    __asm__ volatile("csrw sepc, %[sepc]": : [sepc] "r"(sepc));
    80001f04:	14179073          	csrw	sepc,a5
}
    80001f08:	ed9ff06f          	j	80001de0 <_ZN5Riscv20handleSupervisorTrapEv+0x68>
                    returnValue = -8;
    80001f0c:	ff800793          	li	a5,-8
    80001f10:	fe5ff06f          	j	80001ef4 <_ZN5Riscv20handleSupervisorTrapEv+0x17c>
    __asm__ volatile("csrr %[sepc], sepc":[sepc] "=r"(sepc));
    80001f14:	141027f3          	csrr	a5,sepc
    80001f18:	f4f43423          	sd	a5,-184(s0)
    return sepc;
    80001f1c:	f4843783          	ld	a5,-184(s0)
            uint64 volatile sepc = r_sepc() + 4;
    80001f20:	00478793          	addi	a5,a5,4
    80001f24:	e8f43423          	sd	a5,-376(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80001f28:	100027f3          	csrr	a5,sstatus
    80001f2c:	f4f43023          	sd	a5,-192(s0)
    return sstatus;
    80001f30:	f4043783          	ld	a5,-192(s0)
            uint64 volatile sstatus = r_sstatus();
    80001f34:	e8f43823          	sd	a5,-368(s0)
            PCB::running->setFinished(true);
    80001f38:	00005797          	auipc	a5,0x5
    80001f3c:	6687b783          	ld	a5,1640(a5) # 800075a0 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001f40:	0007b783          	ld	a5,0(a5)
    void setFinished(bool value) { finished = value; }
    80001f44:	00100713          	li	a4,1
    80001f48:	02e78423          	sb	a4,40(a5)
            PCB::timeSliceCounter = 0;
    80001f4c:	00005797          	auipc	a5,0x5
    80001f50:	6447b783          	ld	a5,1604(a5) # 80007590 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001f54:	0007b023          	sd	zero,0(a5)
            __asm__ volatile ("mv a0, %[returnValue]" : : [returnValue] "r"(returnValue));
    80001f58:	00000793          	li	a5,0
    80001f5c:	00078513          	mv	a0,a5
            PCB::dispatch();
    80001f60:	fffff097          	auipc	ra,0xfffff
    80001f64:	7e8080e7          	jalr	2024(ra) # 80001748 <_ZN3PCB8dispatchEv>
            w_sstatus(sstatus);
    80001f68:	e9043783          	ld	a5,-368(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80001f6c:	10079073          	csrw	sstatus,a5
            w_sepc(sepc);
    80001f70:	e8843783          	ld	a5,-376(s0)
    __asm__ volatile("csrw sepc, %[sepc]": : [sepc] "r"(sepc));
    80001f74:	14179073          	csrw	sepc,a5
}
    80001f78:	e69ff06f          	j	80001de0 <_ZN5Riscv20handleSupervisorTrapEv+0x68>
    __asm__ volatile("csrr %[sepc], sepc":[sepc] "=r"(sepc));
    80001f7c:	141027f3          	csrr	a5,sepc
    80001f80:	f4f43c23          	sd	a5,-168(s0)
    return sepc;
    80001f84:	f5843783          	ld	a5,-168(s0)
            uint64 volatile sepc = r_sepc() + 4;
    80001f88:	00478793          	addi	a5,a5,4
    80001f8c:	e8f43c23          	sd	a5,-360(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80001f90:	100027f3          	csrr	a5,sstatus
    80001f94:	f4f43823          	sd	a5,-176(s0)
    return sstatus;
    80001f98:	f5043783          	ld	a5,-176(s0)
            uint64 volatile sstatus = r_sstatus();
    80001f9c:	eaf43023          	sd	a5,-352(s0)
            PCB::timeSliceCounter = 0;
    80001fa0:	00005797          	auipc	a5,0x5
    80001fa4:	5f07b783          	ld	a5,1520(a5) # 80007590 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001fa8:	0007b023          	sd	zero,0(a5)
            PCB::dispatch();
    80001fac:	fffff097          	auipc	ra,0xfffff
    80001fb0:	79c080e7          	jalr	1948(ra) # 80001748 <_ZN3PCB8dispatchEv>
            w_sstatus(sstatus);
    80001fb4:	ea043783          	ld	a5,-352(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80001fb8:	10079073          	csrw	sstatus,a5
            w_sepc(sepc);
    80001fbc:	e9843783          	ld	a5,-360(s0)
    __asm__ volatile("csrw sepc, %[sepc]": : [sepc] "r"(sepc));
    80001fc0:	14179073          	csrw	sepc,a5
}
    80001fc4:	e1dff06f          	j	80001de0 <_ZN5Riscv20handleSupervisorTrapEv+0x68>
    __asm__ volatile("csrr %[sepc], sepc":[sepc] "=r"(sepc));
    80001fc8:	141027f3          	csrr	a5,sepc
    80001fcc:	f6f43423          	sd	a5,-152(s0)
    return sepc;
    80001fd0:	f6843783          	ld	a5,-152(s0)
            uint64 volatile sepc = r_sepc() + 4;
    80001fd4:	00478793          	addi	a5,a5,4
    80001fd8:	eaf43423          	sd	a5,-344(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80001fdc:	100027f3          	csrr	a5,sstatus
    80001fe0:	f6f43023          	sd	a5,-160(s0)
    return sstatus;
    80001fe4:	f6043783          	ld	a5,-160(s0)
            uint64 volatile sstatus = r_sstatus();
    80001fe8:	eaf43823          	sd	a5,-336(s0)
            __asm__ volatile ("mv %[handle], a6" : [handle] "=r"(handle));
    80001fec:	00080913          	mv	s2,a6
            __asm__ volatile ("mv %[init], a2" : [init] "=r"(init));
    80001ff0:	00060513          	mv	a0,a2
            SemaphoreK *newSemaphore = SemaphoreK::openSemaphore(init);
    80001ff4:	0005051b          	sext.w	a0,a0
    80001ff8:	fffff097          	auipc	ra,0xfffff
    80001ffc:	3e4080e7          	jalr	996(ra) # 800013dc <_ZN10SemaphoreK13openSemaphoreEi>
    80002000:	00050493          	mv	s1,a0
            if (newSemaphore) {
    80002004:	02050263          	beqz	a0,80002028 <_ZN5Riscv20handleSupervisorTrapEv+0x2b0>
                printString("Kreiran je semafor");
    80002008:	00004517          	auipc	a0,0x4
    8000200c:	01850513          	addi	a0,a0,24 # 80006020 <kvmincrease+0x540>
    80002010:	00000097          	auipc	ra,0x0
    80002014:	4d0080e7          	jalr	1232(ra) # 800024e0 <_Z11printStringPKc>
                if (handle) {
    80002018:	02090663          	beqz	s2,80002044 <_ZN5Riscv20handleSupervisorTrapEv+0x2cc>
                    *handle = newSemaphore;
    8000201c:	00993023          	sd	s1,0(s2)
                    returnValue = 0;
    80002020:	00000793          	li	a5,0
    80002024:	0080006f          	j	8000202c <_ZN5Riscv20handleSupervisorTrapEv+0x2b4>
                returnValue = -2;
    80002028:	ffe00793          	li	a5,-2
            __asm__ volatile ("mv a0, %[returnValue]" : : [returnValue] "r"(returnValue));
    8000202c:	00078513          	mv	a0,a5
            w_sstatus(sstatus);
    80002030:	eb043783          	ld	a5,-336(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80002034:	10079073          	csrw	sstatus,a5
            w_sepc(sepc);
    80002038:	ea843783          	ld	a5,-344(s0)
    __asm__ volatile("csrw sepc, %[sepc]": : [sepc] "r"(sepc));
    8000203c:	14179073          	csrw	sepc,a5
}
    80002040:	da1ff06f          	j	80001de0 <_ZN5Riscv20handleSupervisorTrapEv+0x68>
                    returnValue = -8;
    80002044:	ff800793          	li	a5,-8
    80002048:	fe5ff06f          	j	8000202c <_ZN5Riscv20handleSupervisorTrapEv+0x2b4>
    __asm__ volatile("csrr %[sepc], sepc":[sepc] "=r"(sepc));
    8000204c:	141027f3          	csrr	a5,sepc
    80002050:	f6f43c23          	sd	a5,-136(s0)
    return sepc;
    80002054:	f7843783          	ld	a5,-136(s0)
            uint64 volatile sepc = r_sepc() + 4;
    80002058:	00478793          	addi	a5,a5,4
    8000205c:	eaf43c23          	sd	a5,-328(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80002060:	100027f3          	csrr	a5,sstatus
    80002064:	f6f43823          	sd	a5,-144(s0)
    return sstatus;
    80002068:	f7043783          	ld	a5,-144(s0)
            uint64 volatile sstatus = r_sstatus();
    8000206c:	ecf43023          	sd	a5,-320(s0)
            __asm__ volatile ("mv %[handle], a2" : [handle] "=r"(handle));
    80002070:	00060493          	mv	s1,a2
            handle->~SemaphoreK();
    80002074:	00048513          	mv	a0,s1
    80002078:	fffff097          	auipc	ra,0xfffff
    8000207c:	594080e7          	jalr	1428(ra) # 8000160c <_ZN10SemaphoreKD1Ev>
            if (handle->getBlockedThreadsQueue()->removeFirst()) {
    80002080:	00048513          	mv	a0,s1
    80002084:	fffff097          	auipc	ra,0xfffff
    80002088:	648080e7          	jalr	1608(ra) # 800016cc <_ZNK10SemaphoreK22getBlockedThreadsQueueEv>
    8000208c:	00050793          	mv	a5,a0
        if (!head) { return 0; }
    80002090:	00053503          	ld	a0,0(a0)
    80002094:	04050a63          	beqz	a0,800020e8 <_ZN5Riscv20handleSupervisorTrapEv+0x370>
        head = head->next;
    80002098:	00853703          	ld	a4,8(a0)
    8000209c:	00e7b023          	sd	a4,0(a5)
        if (!head) { tail = 0; }
    800020a0:	04070063          	beqz	a4,800020e0 <_ZN5Riscv20handleSupervisorTrapEv+0x368>
        T *ret = elem->data;
    800020a4:	00053483          	ld	s1,0(a0)
        delete elem;
    800020a8:	00000097          	auipc	ra,0x0
    800020ac:	b4c080e7          	jalr	-1204(ra) # 80001bf4 <_ZdlPv>
    800020b0:	04048063          	beqz	s1,800020f0 <_ZN5Riscv20handleSupervisorTrapEv+0x378>
                printString("Postoji jos niti zablokiranih na ovom semaforu!");
    800020b4:	00004517          	auipc	a0,0x4
    800020b8:	f8450513          	addi	a0,a0,-124 # 80006038 <kvmincrease+0x558>
    800020bc:	00000097          	auipc	ra,0x0
    800020c0:	424080e7          	jalr	1060(ra) # 800024e0 <_Z11printStringPKc>
                returnValue = -2;
    800020c4:	ffe00793          	li	a5,-2
            __asm__ volatile ("mv a0, %[returnValue]" : : [returnValue] "r"(returnValue));
    800020c8:	00078513          	mv	a0,a5
            w_sstatus(sstatus);
    800020cc:	ec043783          	ld	a5,-320(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    800020d0:	10079073          	csrw	sstatus,a5
            w_sepc(sepc);
    800020d4:	eb843783          	ld	a5,-328(s0)
    __asm__ volatile("csrw sepc, %[sepc]": : [sepc] "r"(sepc));
    800020d8:	14179073          	csrw	sepc,a5
}
    800020dc:	d05ff06f          	j	80001de0 <_ZN5Riscv20handleSupervisorTrapEv+0x68>
        if (!head) { tail = 0; }
    800020e0:	0007b423          	sd	zero,8(a5)
    800020e4:	fc1ff06f          	j	800020a4 <_ZN5Riscv20handleSupervisorTrapEv+0x32c>
                returnValue = 0;
    800020e8:	00000793          	li	a5,0
    800020ec:	fddff06f          	j	800020c8 <_ZN5Riscv20handleSupervisorTrapEv+0x350>
    800020f0:	00000793          	li	a5,0
    800020f4:	fd5ff06f          	j	800020c8 <_ZN5Riscv20handleSupervisorTrapEv+0x350>
    __asm__ volatile("csrr %[sepc], sepc":[sepc] "=r"(sepc));
    800020f8:	141027f3          	csrr	a5,sepc
    800020fc:	f8f43423          	sd	a5,-120(s0)
    return sepc;
    80002100:	f8843783          	ld	a5,-120(s0)
            uint64 volatile sepc = r_sepc() + 4;
    80002104:	00478793          	addi	a5,a5,4
    80002108:	ecf43423          	sd	a5,-312(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    8000210c:	100027f3          	csrr	a5,sstatus
    80002110:	f8f43023          	sd	a5,-128(s0)
    return sstatus;
    80002114:	f8043783          	ld	a5,-128(s0)
            uint64 volatile sstatus = r_sstatus();
    80002118:	ecf43823          	sd	a5,-304(s0)
            __asm__ volatile ("mv %[handle], a2" : [handle] "=r"(handle));
    8000211c:	00060513          	mv	a0,a2
            int returnValue = handle->wait();
    80002120:	fffff097          	auipc	ra,0xfffff
    80002124:	408080e7          	jalr	1032(ra) # 80001528 <_ZN10SemaphoreK4waitEv>
            __asm__ volatile ("mv a0, %[returnValue]" : : [returnValue] "r"(returnValue));
    80002128:	00050513          	mv	a0,a0
            w_sstatus(sstatus);
    8000212c:	ed043783          	ld	a5,-304(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80002130:	10079073          	csrw	sstatus,a5
            w_sepc(sepc);
    80002134:	ec843783          	ld	a5,-312(s0)
    __asm__ volatile("csrw sepc, %[sepc]": : [sepc] "r"(sepc));
    80002138:	14179073          	csrw	sepc,a5
}
    8000213c:	ca5ff06f          	j	80001de0 <_ZN5Riscv20handleSupervisorTrapEv+0x68>
    __asm__ volatile("csrr %[sepc], sepc":[sepc] "=r"(sepc));
    80002140:	141027f3          	csrr	a5,sepc
    80002144:	f8f43c23          	sd	a5,-104(s0)
    return sepc;
    80002148:	f9843783          	ld	a5,-104(s0)
            uint64 volatile sepc = r_sepc() + 4;
    8000214c:	00478793          	addi	a5,a5,4
    80002150:	ecf43c23          	sd	a5,-296(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80002154:	100027f3          	csrr	a5,sstatus
    80002158:	f8f43823          	sd	a5,-112(s0)
    return sstatus;
    8000215c:	f9043783          	ld	a5,-112(s0)
            uint64 volatile sstatus = r_sstatus();
    80002160:	eef43023          	sd	a5,-288(s0)
            __asm__ volatile ("mv %[handle], a2" : [handle] "=r"(handle));
    80002164:	00060513          	mv	a0,a2
            int returnValue = handle->signal();
    80002168:	fffff097          	auipc	ra,0xfffff
    8000216c:	450080e7          	jalr	1104(ra) # 800015b8 <_ZN10SemaphoreK6signalEv>
            __asm__ volatile ("mv a0, %[returnValue]" : : [returnValue] "r"(returnValue));
    80002170:	00050513          	mv	a0,a0
            w_sstatus(sstatus);
    80002174:	ee043783          	ld	a5,-288(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80002178:	10079073          	csrw	sstatus,a5
            w_sepc(sepc);
    8000217c:	ed843783          	ld	a5,-296(s0)
    __asm__ volatile("csrw sepc, %[sepc]": : [sepc] "r"(sepc));
    80002180:	14179073          	csrw	sepc,a5
}
    80002184:	c5dff06f          	j	80001de0 <_ZN5Riscv20handleSupervisorTrapEv+0x68>
    __asm__ volatile("csrr %[sepc], sepc":[sepc] "=r"(sepc));
    80002188:	141027f3          	csrr	a5,sepc
    8000218c:	faf43423          	sd	a5,-88(s0)
    return sepc;
    80002190:	fa843783          	ld	a5,-88(s0)
            uint64 volatile sepc = r_sepc() + 4;
    80002194:	00478793          	addi	a5,a5,4
    80002198:	eef43423          	sd	a5,-280(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    8000219c:	100027f3          	csrr	a5,sstatus
    800021a0:	faf43023          	sd	a5,-96(s0)
    return sstatus;
    800021a4:	fa043783          	ld	a5,-96(s0)
            uint64 volatile sstatus = r_sstatus();
    800021a8:	eef43823          	sd	a5,-272(s0)
            char returnValue = __getc();
    800021ac:	00004097          	auipc	ra,0x4
    800021b0:	850080e7          	jalr	-1968(ra) # 800059fc <__getc>
            __asm__ volatile ("mv a0, %[returnValue]" : : [returnValue] "r"(returnValue));
    800021b4:	00050513          	mv	a0,a0
            w_sstatus(sstatus);
    800021b8:	ef043783          	ld	a5,-272(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    800021bc:	10079073          	csrw	sstatus,a5
            w_sepc(sepc);
    800021c0:	ee843783          	ld	a5,-280(s0)
    __asm__ volatile("csrw sepc, %[sepc]": : [sepc] "r"(sepc));
    800021c4:	14179073          	csrw	sepc,a5
}
    800021c8:	c19ff06f          	j	80001de0 <_ZN5Riscv20handleSupervisorTrapEv+0x68>
    __asm__ volatile("csrr %[sepc], sepc":[sepc] "=r"(sepc));
    800021cc:	141027f3          	csrr	a5,sepc
    800021d0:	fcf43423          	sd	a5,-56(s0)
    return sepc;
    800021d4:	fc843783          	ld	a5,-56(s0)
        uint64 volatile sepc = r_sepc();
    800021d8:	f0f43423          	sd	a5,-248(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    800021dc:	100027f3          	csrr	a5,sstatus
    800021e0:	fcf43023          	sd	a5,-64(s0)
    return sstatus;
    800021e4:	fc043783          	ld	a5,-64(s0)
        uint64 volatile sstatus = r_sstatus();
    800021e8:	f0f43823          	sd	a5,-240(s0)
    __asm__ volatile("csrc sip, %[mask]": :[mask] "r"(mask));
    800021ec:	00200793          	li	a5,2
    800021f0:	1447b073          	csrc	sip,a5
        w_sstatus(sstatus);
    800021f4:	f1043783          	ld	a5,-240(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    800021f8:	10079073          	csrw	sstatus,a5
        w_sepc(sepc);
    800021fc:	f0843783          	ld	a5,-248(s0)
    __asm__ volatile("csrw sepc, %[sepc]": : [sepc] "r"(sepc));
    80002200:	14179073          	csrw	sepc,a5
}
    80002204:	bddff06f          	j	80001de0 <_ZN5Riscv20handleSupervisorTrapEv+0x68>
    __asm__ volatile("csrr %[sepc], sepc":[sepc] "=r"(sepc));
    80002208:	141027f3          	csrr	a5,sepc
    8000220c:	fcf43c23          	sd	a5,-40(s0)
    return sepc;
    80002210:	fd843783          	ld	a5,-40(s0)
        uint64 volatile sepc = r_sepc();
    80002214:	f0f43c23          	sd	a5,-232(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80002218:	100027f3          	csrr	a5,sstatus
    8000221c:	fcf43823          	sd	a5,-48(s0)
    return sstatus;
    80002220:	fd043783          	ld	a5,-48(s0)
        uint64 volatile sstatus = r_sstatus();
    80002224:	f2f43023          	sd	a5,-224(s0)
        console_handler();
    80002228:	00004097          	auipc	ra,0x4
    8000222c:	80c080e7          	jalr	-2036(ra) # 80005a34 <console_handler>
        w_sstatus(sstatus);
    80002230:	f2043783          	ld	a5,-224(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80002234:	10079073          	csrw	sstatus,a5
        w_sepc(sepc);
    80002238:	f1843783          	ld	a5,-232(s0)
    __asm__ volatile("csrw sepc, %[sepc]": : [sepc] "r"(sepc));
    8000223c:	14179073          	csrw	sepc,a5
}
    80002240:	ba1ff06f          	j	80001de0 <_ZN5Riscv20handleSupervisorTrapEv+0x68>
        printString("Uslo se u ilegall instruction!");
    80002244:	00004517          	auipc	a0,0x4
    80002248:	e2450513          	addi	a0,a0,-476 # 80006068 <kvmincrease+0x588>
    8000224c:	00000097          	auipc	ra,0x0
    80002250:	294080e7          	jalr	660(ra) # 800024e0 <_Z11printStringPKc>
        return;
    80002254:	b8dff06f          	j	80001de0 <_ZN5Riscv20handleSupervisorTrapEv+0x68>

0000000080002258 <_ZN5RiscvnwEm>:

void *Riscv::operator new(Riscv::size_t n) {
    80002258:	ff010113          	addi	sp,sp,-16
    8000225c:	00113423          	sd	ra,8(sp)
    80002260:	00813023          	sd	s0,0(sp)
    80002264:	01010413          	addi	s0,sp,16
    return __mem_alloc(n);
    80002268:	00003097          	auipc	ra,0x3
    8000226c:	600080e7          	jalr	1536(ra) # 80005868 <__mem_alloc>
}
    80002270:	00813083          	ld	ra,8(sp)
    80002274:	00013403          	ld	s0,0(sp)
    80002278:	01010113          	addi	sp,sp,16
    8000227c:	00008067          	ret

0000000080002280 <_ZN5RiscvnaEm>:

void *Riscv::operator new[](Riscv::size_t n) {
    80002280:	ff010113          	addi	sp,sp,-16
    80002284:	00113423          	sd	ra,8(sp)
    80002288:	00813023          	sd	s0,0(sp)
    8000228c:	01010413          	addi	s0,sp,16
    return __mem_alloc(n);
    80002290:	00003097          	auipc	ra,0x3
    80002294:	5d8080e7          	jalr	1496(ra) # 80005868 <__mem_alloc>
}
    80002298:	00813083          	ld	ra,8(sp)
    8000229c:	00013403          	ld	s0,0(sp)
    800022a0:	01010113          	addi	sp,sp,16
    800022a4:	00008067          	ret

00000000800022a8 <_ZN5RiscvdlEPv>:

void Riscv::operator delete(void *p) noexcept {
    800022a8:	ff010113          	addi	sp,sp,-16
    800022ac:	00113423          	sd	ra,8(sp)
    800022b0:	00813023          	sd	s0,0(sp)
    800022b4:	01010413          	addi	s0,sp,16
    __mem_free(p);
    800022b8:	00003097          	auipc	ra,0x3
    800022bc:	4e4080e7          	jalr	1252(ra) # 8000579c <__mem_free>
}
    800022c0:	00813083          	ld	ra,8(sp)
    800022c4:	00013403          	ld	s0,0(sp)
    800022c8:	01010113          	addi	sp,sp,16
    800022cc:	00008067          	ret

00000000800022d0 <_ZN5RiscvdaEPv>:

void Riscv::operator delete[](void *p) noexcept {
    800022d0:	ff010113          	addi	sp,sp,-16
    800022d4:	00113423          	sd	ra,8(sp)
    800022d8:	00813023          	sd	s0,0(sp)
    800022dc:	01010413          	addi	s0,sp,16
    __mem_free(p);
    800022e0:	00003097          	auipc	ra,0x3
    800022e4:	4bc080e7          	jalr	1212(ra) # 8000579c <__mem_free>
}
    800022e8:	00813083          	ld	ra,8(sp)
    800022ec:	00013403          	ld	s0,0(sp)
    800022f0:	01010113          	addi	sp,sp,16
    800022f4:	00008067          	ret

00000000800022f8 <_Z41__static_initialization_and_destruction_0ii>:
    __mem_free(p);
}

void Scheduler::operator delete[](void *p) noexcept {
    __mem_free(p);
}
    800022f8:	ff010113          	addi	sp,sp,-16
    800022fc:	00813423          	sd	s0,8(sp)
    80002300:	01010413          	addi	s0,sp,16
    80002304:	00100793          	li	a5,1
    80002308:	00f50863          	beq	a0,a5,80002318 <_Z41__static_initialization_and_destruction_0ii+0x20>
    8000230c:	00813403          	ld	s0,8(sp)
    80002310:	01010113          	addi	sp,sp,16
    80002314:	00008067          	ret
    80002318:	000107b7          	lui	a5,0x10
    8000231c:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80002320:	fef596e3          	bne	a1,a5,8000230c <_Z41__static_initialization_and_destruction_0ii+0x14>
    List() : head(0), tail(0) {}
    80002324:	00005797          	auipc	a5,0x5
    80002328:	2e478793          	addi	a5,a5,740 # 80007608 <_ZN9Scheduler17readyThreadsQueueE>
    8000232c:	0007b023          	sd	zero,0(a5)
    80002330:	0007b423          	sd	zero,8(a5)
    80002334:	fd9ff06f          	j	8000230c <_Z41__static_initialization_and_destruction_0ii+0x14>

0000000080002338 <_ZN9Scheduler3getEv>:
PCB *Scheduler::get() {
    80002338:	fe010113          	addi	sp,sp,-32
    8000233c:	00113c23          	sd	ra,24(sp)
    80002340:	00813823          	sd	s0,16(sp)
    80002344:	00913423          	sd	s1,8(sp)
    80002348:	02010413          	addi	s0,sp,32
        if (!head) { return 0; }
    8000234c:	00005517          	auipc	a0,0x5
    80002350:	2bc53503          	ld	a0,700(a0) # 80007608 <_ZN9Scheduler17readyThreadsQueueE>
    80002354:	04050263          	beqz	a0,80002398 <_ZN9Scheduler3getEv+0x60>
        head = head->next;
    80002358:	00853783          	ld	a5,8(a0)
    8000235c:	00005717          	auipc	a4,0x5
    80002360:	2af73623          	sd	a5,684(a4) # 80007608 <_ZN9Scheduler17readyThreadsQueueE>
        if (!head) { tail = 0; }
    80002364:	02078463          	beqz	a5,8000238c <_ZN9Scheduler3getEv+0x54>
        T *ret = elem->data;
    80002368:	00053483          	ld	s1,0(a0)
        delete elem;
    8000236c:	00000097          	auipc	ra,0x0
    80002370:	888080e7          	jalr	-1912(ra) # 80001bf4 <_ZdlPv>
}
    80002374:	00048513          	mv	a0,s1
    80002378:	01813083          	ld	ra,24(sp)
    8000237c:	01013403          	ld	s0,16(sp)
    80002380:	00813483          	ld	s1,8(sp)
    80002384:	02010113          	addi	sp,sp,32
    80002388:	00008067          	ret
        if (!head) { tail = 0; }
    8000238c:	00005797          	auipc	a5,0x5
    80002390:	2807b223          	sd	zero,644(a5) # 80007610 <_ZN9Scheduler17readyThreadsQueueE+0x8>
    80002394:	fd5ff06f          	j	80002368 <_ZN9Scheduler3getEv+0x30>
        if (!head) { return 0; }
    80002398:	00050493          	mv	s1,a0
    return readyThreadsQueue.removeFirst();
    8000239c:	fd9ff06f          	j	80002374 <_ZN9Scheduler3getEv+0x3c>

00000000800023a0 <_ZN9Scheduler3putEP3PCB>:
void Scheduler::put(PCB *thread) {
    800023a0:	fe010113          	addi	sp,sp,-32
    800023a4:	00113c23          	sd	ra,24(sp)
    800023a8:	00813823          	sd	s0,16(sp)
    800023ac:	00913423          	sd	s1,8(sp)
    800023b0:	02010413          	addi	s0,sp,32
    800023b4:	00050493          	mv	s1,a0
        Elem *elem = new Elem(data, 0);
    800023b8:	01000513          	li	a0,16
    800023bc:	00000097          	auipc	ra,0x0
    800023c0:	810080e7          	jalr	-2032(ra) # 80001bcc <_Znwm>
        Elem(T *data, Elem *next) : data(data), next(next) {}
    800023c4:	00953023          	sd	s1,0(a0)
    800023c8:	00053423          	sd	zero,8(a0)
        if (tail) {
    800023cc:	00005797          	auipc	a5,0x5
    800023d0:	2447b783          	ld	a5,580(a5) # 80007610 <_ZN9Scheduler17readyThreadsQueueE+0x8>
    800023d4:	02078263          	beqz	a5,800023f8 <_ZN9Scheduler3putEP3PCB+0x58>
            tail->next = elem;
    800023d8:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    800023dc:	00005797          	auipc	a5,0x5
    800023e0:	22a7ba23          	sd	a0,564(a5) # 80007610 <_ZN9Scheduler17readyThreadsQueueE+0x8>
}
    800023e4:	01813083          	ld	ra,24(sp)
    800023e8:	01013403          	ld	s0,16(sp)
    800023ec:	00813483          	ld	s1,8(sp)
    800023f0:	02010113          	addi	sp,sp,32
    800023f4:	00008067          	ret
            head = tail = elem;
    800023f8:	00005797          	auipc	a5,0x5
    800023fc:	21078793          	addi	a5,a5,528 # 80007608 <_ZN9Scheduler17readyThreadsQueueE>
    80002400:	00a7b423          	sd	a0,8(a5)
    80002404:	00a7b023          	sd	a0,0(a5)
    80002408:	fddff06f          	j	800023e4 <_ZN9Scheduler3putEP3PCB+0x44>

000000008000240c <_ZN9SchedulernwEm>:
void *Scheduler::operator new(Scheduler::size_t n) {
    8000240c:	ff010113          	addi	sp,sp,-16
    80002410:	00113423          	sd	ra,8(sp)
    80002414:	00813023          	sd	s0,0(sp)
    80002418:	01010413          	addi	s0,sp,16
    return __mem_alloc(n);
    8000241c:	00003097          	auipc	ra,0x3
    80002420:	44c080e7          	jalr	1100(ra) # 80005868 <__mem_alloc>
}
    80002424:	00813083          	ld	ra,8(sp)
    80002428:	00013403          	ld	s0,0(sp)
    8000242c:	01010113          	addi	sp,sp,16
    80002430:	00008067          	ret

0000000080002434 <_ZN9SchedulernaEm>:
void *Scheduler::operator new[](Scheduler::size_t n) {
    80002434:	ff010113          	addi	sp,sp,-16
    80002438:	00113423          	sd	ra,8(sp)
    8000243c:	00813023          	sd	s0,0(sp)
    80002440:	01010413          	addi	s0,sp,16
    return __mem_alloc(n);
    80002444:	00003097          	auipc	ra,0x3
    80002448:	424080e7          	jalr	1060(ra) # 80005868 <__mem_alloc>
}
    8000244c:	00813083          	ld	ra,8(sp)
    80002450:	00013403          	ld	s0,0(sp)
    80002454:	01010113          	addi	sp,sp,16
    80002458:	00008067          	ret

000000008000245c <_ZN9SchedulerdlEPv>:
void Scheduler::operator delete(void *p) noexcept {
    8000245c:	ff010113          	addi	sp,sp,-16
    80002460:	00113423          	sd	ra,8(sp)
    80002464:	00813023          	sd	s0,0(sp)
    80002468:	01010413          	addi	s0,sp,16
    __mem_free(p);
    8000246c:	00003097          	auipc	ra,0x3
    80002470:	330080e7          	jalr	816(ra) # 8000579c <__mem_free>
}
    80002474:	00813083          	ld	ra,8(sp)
    80002478:	00013403          	ld	s0,0(sp)
    8000247c:	01010113          	addi	sp,sp,16
    80002480:	00008067          	ret

0000000080002484 <_ZN9SchedulerdaEPv>:
void Scheduler::operator delete[](void *p) noexcept {
    80002484:	ff010113          	addi	sp,sp,-16
    80002488:	00113423          	sd	ra,8(sp)
    8000248c:	00813023          	sd	s0,0(sp)
    80002490:	01010413          	addi	s0,sp,16
    __mem_free(p);
    80002494:	00003097          	auipc	ra,0x3
    80002498:	308080e7          	jalr	776(ra) # 8000579c <__mem_free>
}
    8000249c:	00813083          	ld	ra,8(sp)
    800024a0:	00013403          	ld	s0,0(sp)
    800024a4:	01010113          	addi	sp,sp,16
    800024a8:	00008067          	ret

00000000800024ac <_GLOBAL__sub_I__ZN9Scheduler17readyThreadsQueueE>:
    800024ac:	ff010113          	addi	sp,sp,-16
    800024b0:	00113423          	sd	ra,8(sp)
    800024b4:	00813023          	sd	s0,0(sp)
    800024b8:	01010413          	addi	s0,sp,16
    800024bc:	000105b7          	lui	a1,0x10
    800024c0:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    800024c4:	00100513          	li	a0,1
    800024c8:	00000097          	auipc	ra,0x0
    800024cc:	e30080e7          	jalr	-464(ra) # 800022f8 <_Z41__static_initialization_and_destruction_0ii>
    800024d0:	00813083          	ld	ra,8(sp)
    800024d4:	00013403          	ld	s0,0(sp)
    800024d8:	01010113          	addi	sp,sp,16
    800024dc:	00008067          	ret

00000000800024e0 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1))
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    800024e0:	fe010113          	addi	sp,sp,-32
    800024e4:	00113c23          	sd	ra,24(sp)
    800024e8:	00813823          	sd	s0,16(sp)
    800024ec:	00913423          	sd	s1,8(sp)
    800024f0:	02010413          	addi	s0,sp,32
    800024f4:	00050493          	mv	s1,a0
    LOCK();
    800024f8:	00100613          	li	a2,1
    800024fc:	00000593          	li	a1,0
    80002500:	00005517          	auipc	a0,0x5
    80002504:	11850513          	addi	a0,a0,280 # 80007618 <lockPrint>
    80002508:	fffff097          	auipc	ra,0xfffff
    8000250c:	c1c080e7          	jalr	-996(ra) # 80001124 <copy_and_swap>
    80002510:	fe0514e3          	bnez	a0,800024f8 <_Z11printStringPKc+0x18>
    //zabranjujemo prekide sve dok traje ispis i prvo citamo sta je stari status da znamo sta je bilo pre
    //uint64 sstatus = Riscv::r_sstatus();
    //bezuslovno onemogucavamo prekide
    //Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    while (*string != '\0')
    80002514:	0004c503          	lbu	a0,0(s1)
    80002518:	00050a63          	beqz	a0,8000252c <_Z11printStringPKc+0x4c>
    {
        __putc(*string);
    8000251c:	00003097          	auipc	ra,0x3
    80002520:	4a4080e7          	jalr	1188(ra) # 800059c0 <__putc>
        string++;
    80002524:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80002528:	fedff06f          	j	80002514 <_Z11printStringPKc+0x34>
    }
    UNLOCK();
    8000252c:	00000613          	li	a2,0
    80002530:	00100593          	li	a1,1
    80002534:	00005517          	auipc	a0,0x5
    80002538:	0e450513          	addi	a0,a0,228 # 80007618 <lockPrint>
    8000253c:	fffff097          	auipc	ra,0xfffff
    80002540:	be8080e7          	jalr	-1048(ra) # 80001124 <copy_and_swap>
    80002544:	fe0514e3          	bnez	a0,8000252c <_Z11printStringPKc+0x4c>
    //Riscv::ms_sstatus(sstatus & Riscv::SSTATUS_SIE ? Riscv::SSTATUS_SIE : 0);
}
    80002548:	01813083          	ld	ra,24(sp)
    8000254c:	01013403          	ld	s0,16(sp)
    80002550:	00813483          	ld	s1,8(sp)
    80002554:	02010113          	addi	sp,sp,32
    80002558:	00008067          	ret

000000008000255c <_Z9getStringPci>:

char* getString(char *buf, int max) {
    8000255c:	fd010113          	addi	sp,sp,-48
    80002560:	02113423          	sd	ra,40(sp)
    80002564:	02813023          	sd	s0,32(sp)
    80002568:	00913c23          	sd	s1,24(sp)
    8000256c:	01213823          	sd	s2,16(sp)
    80002570:	01313423          	sd	s3,8(sp)
    80002574:	01413023          	sd	s4,0(sp)
    80002578:	03010413          	addi	s0,sp,48
    8000257c:	00050993          	mv	s3,a0
    80002580:	00058a13          	mv	s4,a1
    LOCK();
    80002584:	00100613          	li	a2,1
    80002588:	00000593          	li	a1,0
    8000258c:	00005517          	auipc	a0,0x5
    80002590:	08c50513          	addi	a0,a0,140 # 80007618 <lockPrint>
    80002594:	fffff097          	auipc	ra,0xfffff
    80002598:	b90080e7          	jalr	-1136(ra) # 80001124 <copy_and_swap>
    8000259c:	fe0514e3          	bnez	a0,80002584 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    800025a0:	00000913          	li	s2,0
    800025a4:	00090493          	mv	s1,s2
    800025a8:	0019091b          	addiw	s2,s2,1
    800025ac:	03495a63          	bge	s2,s4,800025e0 <_Z9getStringPci+0x84>
        cc = __getc();
    800025b0:	00003097          	auipc	ra,0x3
    800025b4:	44c080e7          	jalr	1100(ra) # 800059fc <__getc>
        if(cc < 1)
    800025b8:	02050463          	beqz	a0,800025e0 <_Z9getStringPci+0x84>
            break;
        c = cc;
        buf[i++] = c;
    800025bc:	009984b3          	add	s1,s3,s1
    800025c0:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    800025c4:	00a00793          	li	a5,10
    800025c8:	00f50a63          	beq	a0,a5,800025dc <_Z9getStringPci+0x80>
    800025cc:	00d00793          	li	a5,13
    800025d0:	fcf51ae3          	bne	a0,a5,800025a4 <_Z9getStringPci+0x48>
        buf[i++] = c;
    800025d4:	00090493          	mv	s1,s2
    800025d8:	0080006f          	j	800025e0 <_Z9getStringPci+0x84>
    800025dc:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    800025e0:	009984b3          	add	s1,s3,s1
    800025e4:	00048023          	sb	zero,0(s1)

    UNLOCK();
    800025e8:	00000613          	li	a2,0
    800025ec:	00100593          	li	a1,1
    800025f0:	00005517          	auipc	a0,0x5
    800025f4:	02850513          	addi	a0,a0,40 # 80007618 <lockPrint>
    800025f8:	fffff097          	auipc	ra,0xfffff
    800025fc:	b2c080e7          	jalr	-1236(ra) # 80001124 <copy_and_swap>
    80002600:	fe0514e3          	bnez	a0,800025e8 <_Z9getStringPci+0x8c>
    return buf;
}
    80002604:	00098513          	mv	a0,s3
    80002608:	02813083          	ld	ra,40(sp)
    8000260c:	02013403          	ld	s0,32(sp)
    80002610:	01813483          	ld	s1,24(sp)
    80002614:	01013903          	ld	s2,16(sp)
    80002618:	00813983          	ld	s3,8(sp)
    8000261c:	00013a03          	ld	s4,0(sp)
    80002620:	03010113          	addi	sp,sp,48
    80002624:	00008067          	ret

0000000080002628 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80002628:	ff010113          	addi	sp,sp,-16
    8000262c:	00813423          	sd	s0,8(sp)
    80002630:	01010413          	addi	s0,sp,16
    80002634:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80002638:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    8000263c:	0006c603          	lbu	a2,0(a3)
    80002640:	fd06071b          	addiw	a4,a2,-48
    80002644:	0ff77713          	andi	a4,a4,255
    80002648:	00900793          	li	a5,9
    8000264c:	02e7e063          	bltu	a5,a4,8000266c <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80002650:	0025179b          	slliw	a5,a0,0x2
    80002654:	00a787bb          	addw	a5,a5,a0
    80002658:	0017979b          	slliw	a5,a5,0x1
    8000265c:	00168693          	addi	a3,a3,1
    80002660:	00c787bb          	addw	a5,a5,a2
    80002664:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80002668:	fd5ff06f          	j	8000263c <_Z11stringToIntPKc+0x14>
    return n;
}
    8000266c:	00813403          	ld	s0,8(sp)
    80002670:	01010113          	addi	sp,sp,16
    80002674:	00008067          	ret

0000000080002678 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80002678:	fc010113          	addi	sp,sp,-64
    8000267c:	02113c23          	sd	ra,56(sp)
    80002680:	02813823          	sd	s0,48(sp)
    80002684:	02913423          	sd	s1,40(sp)
    80002688:	03213023          	sd	s2,32(sp)
    8000268c:	01313c23          	sd	s3,24(sp)
    80002690:	01413823          	sd	s4,16(sp)
    80002694:	04010413          	addi	s0,sp,64
    80002698:	00050913          	mv	s2,a0
    8000269c:	00058993          	mv	s3,a1
    800026a0:	00060a13          	mv	s4,a2
    LOCK();
    800026a4:	00100613          	li	a2,1
    800026a8:	00000593          	li	a1,0
    800026ac:	00005517          	auipc	a0,0x5
    800026b0:	f6c50513          	addi	a0,a0,-148 # 80007618 <lockPrint>
    800026b4:	fffff097          	auipc	ra,0xfffff
    800026b8:	a70080e7          	jalr	-1424(ra) # 80001124 <copy_and_swap>
    800026bc:	fe0514e3          	bnez	a0,800026a4 <_Z8printIntiii+0x2c>
    char buf[16];
    int i, neg;
    int x;

    neg = 0;
    if(sgn && xx < 0){
    800026c0:	000a0663          	beqz	s4,800026cc <_Z8printIntiii+0x54>
    800026c4:	06094a63          	bltz	s2,80002738 <_Z8printIntiii+0xc0>
    neg = 0;
    800026c8:	00000a13          	li	s4,0
        x = -xx;
    } else {
        x = xx;
    }

    i = 0;
    800026cc:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    800026d0:	033966bb          	remw	a3,s2,s3
    800026d4:	00048713          	mv	a4,s1
    800026d8:	0014849b          	addiw	s1,s1,1
    800026dc:	00005797          	auipc	a5,0x5
    800026e0:	e1478793          	addi	a5,a5,-492 # 800074f0 <digits>
    800026e4:	00d787b3          	add	a5,a5,a3
    800026e8:	0007c683          	lbu	a3,0(a5)
    800026ec:	fd040793          	addi	a5,s0,-48
    800026f0:	00e787b3          	add	a5,a5,a4
    800026f4:	fed78823          	sb	a3,-16(a5)
    }while((x /= base) != 0);
    800026f8:	0339493b          	divw	s2,s2,s3
    800026fc:	fc091ae3          	bnez	s2,800026d0 <_Z8printIntiii+0x58>
    if(neg)
    80002700:	000a0c63          	beqz	s4,80002718 <_Z8printIntiii+0xa0>
        buf[i++] = '-';
    80002704:	fd040793          	addi	a5,s0,-48
    80002708:	009784b3          	add	s1,a5,s1
    8000270c:	02d00793          	li	a5,45
    80002710:	fef48823          	sb	a5,-16(s1)
    80002714:	0027049b          	addiw	s1,a4,2

    while(--i >= 0)
    80002718:	fff4849b          	addiw	s1,s1,-1
    8000271c:	0204c463          	bltz	s1,80002744 <_Z8printIntiii+0xcc>
        __putc(buf[i]);
    80002720:	fd040793          	addi	a5,s0,-48
    80002724:	009787b3          	add	a5,a5,s1
    80002728:	ff07c503          	lbu	a0,-16(a5)
    8000272c:	00003097          	auipc	ra,0x3
    80002730:	294080e7          	jalr	660(ra) # 800059c0 <__putc>
    80002734:	fe5ff06f          	j	80002718 <_Z8printIntiii+0xa0>
        x = -xx;
    80002738:	4120093b          	negw	s2,s2
        neg = 1;
    8000273c:	00100a13          	li	s4,1
        x = -xx;
    80002740:	f8dff06f          	j	800026cc <_Z8printIntiii+0x54>

    UNLOCK();
    80002744:	00000613          	li	a2,0
    80002748:	00100593          	li	a1,1
    8000274c:	00005517          	auipc	a0,0x5
    80002750:	ecc50513          	addi	a0,a0,-308 # 80007618 <lockPrint>
    80002754:	fffff097          	auipc	ra,0xfffff
    80002758:	9d0080e7          	jalr	-1584(ra) # 80001124 <copy_and_swap>
    8000275c:	fe0514e3          	bnez	a0,80002744 <_Z8printIntiii+0xcc>
    80002760:	03813083          	ld	ra,56(sp)
    80002764:	03013403          	ld	s0,48(sp)
    80002768:	02813483          	ld	s1,40(sp)
    8000276c:	02013903          	ld	s2,32(sp)
    80002770:	01813983          	ld	s3,24(sp)
    80002774:	01013a03          	ld	s4,16(sp)
    80002778:	04010113          	addi	sp,sp,64
    8000277c:	00008067          	ret

0000000080002780 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80002780:	fd010113          	addi	sp,sp,-48
    80002784:	02113423          	sd	ra,40(sp)
    80002788:	02813023          	sd	s0,32(sp)
    8000278c:	00913c23          	sd	s1,24(sp)
    80002790:	01213823          	sd	s2,16(sp)
    80002794:	01313423          	sd	s3,8(sp)
    80002798:	03010413          	addi	s0,sp,48
    8000279c:	00050493          	mv	s1,a0
    800027a0:	00058913          	mv	s2,a1
    800027a4:	0015879b          	addiw	a5,a1,1
    800027a8:	0007851b          	sext.w	a0,a5
    800027ac:	00f4a023          	sw	a5,0(s1)
    800027b0:	0004a823          	sw	zero,16(s1)
    800027b4:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)__mem_alloc(sizeof(int) * cap);
    800027b8:	00251513          	slli	a0,a0,0x2
    800027bc:	00003097          	auipc	ra,0x3
    800027c0:	0ac080e7          	jalr	172(ra) # 80005868 <__mem_alloc>
    800027c4:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    800027c8:	01000513          	li	a0,16
    800027cc:	fffff097          	auipc	ra,0xfffff
    800027d0:	400080e7          	jalr	1024(ra) # 80001bcc <_Znwm>
    800027d4:	00050993          	mv	s3,a0
    800027d8:	00000593          	li	a1,0
    800027dc:	fffff097          	auipc	ra,0xfffff
    800027e0:	360080e7          	jalr	864(ra) # 80001b3c <_ZN9SemaphoreC1Ej>
    800027e4:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    800027e8:	01000513          	li	a0,16
    800027ec:	fffff097          	auipc	ra,0xfffff
    800027f0:	3e0080e7          	jalr	992(ra) # 80001bcc <_Znwm>
    800027f4:	00050993          	mv	s3,a0
    800027f8:	00090593          	mv	a1,s2
    800027fc:	fffff097          	auipc	ra,0xfffff
    80002800:	340080e7          	jalr	832(ra) # 80001b3c <_ZN9SemaphoreC1Ej>
    80002804:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    80002808:	01000513          	li	a0,16
    8000280c:	fffff097          	auipc	ra,0xfffff
    80002810:	3c0080e7          	jalr	960(ra) # 80001bcc <_Znwm>
    80002814:	00050913          	mv	s2,a0
    80002818:	00100593          	li	a1,1
    8000281c:	fffff097          	auipc	ra,0xfffff
    80002820:	320080e7          	jalr	800(ra) # 80001b3c <_ZN9SemaphoreC1Ej>
    80002824:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80002828:	01000513          	li	a0,16
    8000282c:	fffff097          	auipc	ra,0xfffff
    80002830:	3a0080e7          	jalr	928(ra) # 80001bcc <_Znwm>
    80002834:	00050913          	mv	s2,a0
    80002838:	00100593          	li	a1,1
    8000283c:	fffff097          	auipc	ra,0xfffff
    80002840:	300080e7          	jalr	768(ra) # 80001b3c <_ZN9SemaphoreC1Ej>
    80002844:	0324b823          	sd	s2,48(s1)
}
    80002848:	02813083          	ld	ra,40(sp)
    8000284c:	02013403          	ld	s0,32(sp)
    80002850:	01813483          	ld	s1,24(sp)
    80002854:	01013903          	ld	s2,16(sp)
    80002858:	00813983          	ld	s3,8(sp)
    8000285c:	03010113          	addi	sp,sp,48
    80002860:	00008067          	ret
    80002864:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80002868:	00098513          	mv	a0,s3
    8000286c:	fffff097          	auipc	ra,0xfffff
    80002870:	388080e7          	jalr	904(ra) # 80001bf4 <_ZdlPv>
    80002874:	00048513          	mv	a0,s1
    80002878:	00006097          	auipc	ra,0x6
    8000287c:	e80080e7          	jalr	-384(ra) # 800086f8 <_Unwind_Resume>
    80002880:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80002884:	00098513          	mv	a0,s3
    80002888:	fffff097          	auipc	ra,0xfffff
    8000288c:	36c080e7          	jalr	876(ra) # 80001bf4 <_ZdlPv>
    80002890:	00048513          	mv	a0,s1
    80002894:	00006097          	auipc	ra,0x6
    80002898:	e64080e7          	jalr	-412(ra) # 800086f8 <_Unwind_Resume>
    8000289c:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    800028a0:	00090513          	mv	a0,s2
    800028a4:	fffff097          	auipc	ra,0xfffff
    800028a8:	350080e7          	jalr	848(ra) # 80001bf4 <_ZdlPv>
    800028ac:	00048513          	mv	a0,s1
    800028b0:	00006097          	auipc	ra,0x6
    800028b4:	e48080e7          	jalr	-440(ra) # 800086f8 <_Unwind_Resume>
    800028b8:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    800028bc:	00090513          	mv	a0,s2
    800028c0:	fffff097          	auipc	ra,0xfffff
    800028c4:	334080e7          	jalr	820(ra) # 80001bf4 <_ZdlPv>
    800028c8:	00048513          	mv	a0,s1
    800028cc:	00006097          	auipc	ra,0x6
    800028d0:	e2c080e7          	jalr	-468(ra) # 800086f8 <_Unwind_Resume>

00000000800028d4 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    800028d4:	fe010113          	addi	sp,sp,-32
    800028d8:	00113c23          	sd	ra,24(sp)
    800028dc:	00813823          	sd	s0,16(sp)
    800028e0:	00913423          	sd	s1,8(sp)
    800028e4:	01213023          	sd	s2,0(sp)
    800028e8:	02010413          	addi	s0,sp,32
    800028ec:	00050493          	mv	s1,a0
    800028f0:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    800028f4:	01853503          	ld	a0,24(a0)
    800028f8:	fffff097          	auipc	ra,0xfffff
    800028fc:	27c080e7          	jalr	636(ra) # 80001b74 <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    80002900:	0304b503          	ld	a0,48(s1)
    80002904:	fffff097          	auipc	ra,0xfffff
    80002908:	270080e7          	jalr	624(ra) # 80001b74 <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    8000290c:	0084b783          	ld	a5,8(s1)
    80002910:	0144a703          	lw	a4,20(s1)
    80002914:	00271713          	slli	a4,a4,0x2
    80002918:	00e787b3          	add	a5,a5,a4
    8000291c:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80002920:	0144a783          	lw	a5,20(s1)
    80002924:	0017879b          	addiw	a5,a5,1
    80002928:	0004a703          	lw	a4,0(s1)
    8000292c:	02e7e7bb          	remw	a5,a5,a4
    80002930:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80002934:	0304b503          	ld	a0,48(s1)
    80002938:	fffff097          	auipc	ra,0xfffff
    8000293c:	268080e7          	jalr	616(ra) # 80001ba0 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80002940:	0204b503          	ld	a0,32(s1)
    80002944:	fffff097          	auipc	ra,0xfffff
    80002948:	25c080e7          	jalr	604(ra) # 80001ba0 <_ZN9Semaphore6signalEv>

}
    8000294c:	01813083          	ld	ra,24(sp)
    80002950:	01013403          	ld	s0,16(sp)
    80002954:	00813483          	ld	s1,8(sp)
    80002958:	00013903          	ld	s2,0(sp)
    8000295c:	02010113          	addi	sp,sp,32
    80002960:	00008067          	ret

0000000080002964 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80002964:	fe010113          	addi	sp,sp,-32
    80002968:	00113c23          	sd	ra,24(sp)
    8000296c:	00813823          	sd	s0,16(sp)
    80002970:	00913423          	sd	s1,8(sp)
    80002974:	01213023          	sd	s2,0(sp)
    80002978:	02010413          	addi	s0,sp,32
    8000297c:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80002980:	02053503          	ld	a0,32(a0)
    80002984:	fffff097          	auipc	ra,0xfffff
    80002988:	1f0080e7          	jalr	496(ra) # 80001b74 <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    8000298c:	0284b503          	ld	a0,40(s1)
    80002990:	fffff097          	auipc	ra,0xfffff
    80002994:	1e4080e7          	jalr	484(ra) # 80001b74 <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    80002998:	0084b703          	ld	a4,8(s1)
    8000299c:	0104a783          	lw	a5,16(s1)
    800029a0:	00279693          	slli	a3,a5,0x2
    800029a4:	00d70733          	add	a4,a4,a3
    800029a8:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    800029ac:	0017879b          	addiw	a5,a5,1
    800029b0:	0004a703          	lw	a4,0(s1)
    800029b4:	02e7e7bb          	remw	a5,a5,a4
    800029b8:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    800029bc:	0284b503          	ld	a0,40(s1)
    800029c0:	fffff097          	auipc	ra,0xfffff
    800029c4:	1e0080e7          	jalr	480(ra) # 80001ba0 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    800029c8:	0184b503          	ld	a0,24(s1)
    800029cc:	fffff097          	auipc	ra,0xfffff
    800029d0:	1d4080e7          	jalr	468(ra) # 80001ba0 <_ZN9Semaphore6signalEv>

    return ret;
}
    800029d4:	00090513          	mv	a0,s2
    800029d8:	01813083          	ld	ra,24(sp)
    800029dc:	01013403          	ld	s0,16(sp)
    800029e0:	00813483          	ld	s1,8(sp)
    800029e4:	00013903          	ld	s2,0(sp)
    800029e8:	02010113          	addi	sp,sp,32
    800029ec:	00008067          	ret

00000000800029f0 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    800029f0:	fe010113          	addi	sp,sp,-32
    800029f4:	00113c23          	sd	ra,24(sp)
    800029f8:	00813823          	sd	s0,16(sp)
    800029fc:	00913423          	sd	s1,8(sp)
    80002a00:	01213023          	sd	s2,0(sp)
    80002a04:	02010413          	addi	s0,sp,32
    80002a08:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    80002a0c:	02853503          	ld	a0,40(a0)
    80002a10:	fffff097          	auipc	ra,0xfffff
    80002a14:	164080e7          	jalr	356(ra) # 80001b74 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    80002a18:	0304b503          	ld	a0,48(s1)
    80002a1c:	fffff097          	auipc	ra,0xfffff
    80002a20:	158080e7          	jalr	344(ra) # 80001b74 <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    80002a24:	0144a783          	lw	a5,20(s1)
    80002a28:	0104a903          	lw	s2,16(s1)
    80002a2c:	0327ce63          	blt	a5,s2,80002a68 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80002a30:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80002a34:	0304b503          	ld	a0,48(s1)
    80002a38:	fffff097          	auipc	ra,0xfffff
    80002a3c:	168080e7          	jalr	360(ra) # 80001ba0 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80002a40:	0284b503          	ld	a0,40(s1)
    80002a44:	fffff097          	auipc	ra,0xfffff
    80002a48:	15c080e7          	jalr	348(ra) # 80001ba0 <_ZN9Semaphore6signalEv>

    return ret;
}
    80002a4c:	00090513          	mv	a0,s2
    80002a50:	01813083          	ld	ra,24(sp)
    80002a54:	01013403          	ld	s0,16(sp)
    80002a58:	00813483          	ld	s1,8(sp)
    80002a5c:	00013903          	ld	s2,0(sp)
    80002a60:	02010113          	addi	sp,sp,32
    80002a64:	00008067          	ret
        ret = cap - head + tail;
    80002a68:	0004a703          	lw	a4,0(s1)
    80002a6c:	4127093b          	subw	s2,a4,s2
    80002a70:	00f9093b          	addw	s2,s2,a5
    80002a74:	fc1ff06f          	j	80002a34 <_ZN9BufferCPP6getCntEv+0x44>

0000000080002a78 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    80002a78:	fe010113          	addi	sp,sp,-32
    80002a7c:	00113c23          	sd	ra,24(sp)
    80002a80:	00813823          	sd	s0,16(sp)
    80002a84:	00913423          	sd	s1,8(sp)
    80002a88:	02010413          	addi	s0,sp,32
    80002a8c:	00050493          	mv	s1,a0
    __putc('\n');
    80002a90:	00a00513          	li	a0,10
    80002a94:	00003097          	auipc	ra,0x3
    80002a98:	f2c080e7          	jalr	-212(ra) # 800059c0 <__putc>
    printString("Buffer deleted!\n");
    80002a9c:	00003517          	auipc	a0,0x3
    80002aa0:	60c50513          	addi	a0,a0,1548 # 800060a8 <kvmincrease+0x5c8>
    80002aa4:	00000097          	auipc	ra,0x0
    80002aa8:	a3c080e7          	jalr	-1476(ra) # 800024e0 <_Z11printStringPKc>
    while (getCnt()) {
    80002aac:	00048513          	mv	a0,s1
    80002ab0:	00000097          	auipc	ra,0x0
    80002ab4:	f40080e7          	jalr	-192(ra) # 800029f0 <_ZN9BufferCPP6getCntEv>
    80002ab8:	02050c63          	beqz	a0,80002af0 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80002abc:	0084b783          	ld	a5,8(s1)
    80002ac0:	0104a703          	lw	a4,16(s1)
    80002ac4:	00271713          	slli	a4,a4,0x2
    80002ac8:	00e787b3          	add	a5,a5,a4
        __putc(ch);
    80002acc:	0007c503          	lbu	a0,0(a5)
    80002ad0:	00003097          	auipc	ra,0x3
    80002ad4:	ef0080e7          	jalr	-272(ra) # 800059c0 <__putc>
        head = (head + 1) % cap;
    80002ad8:	0104a783          	lw	a5,16(s1)
    80002adc:	0017879b          	addiw	a5,a5,1
    80002ae0:	0004a703          	lw	a4,0(s1)
    80002ae4:	02e7e7bb          	remw	a5,a5,a4
    80002ae8:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    80002aec:	fc1ff06f          	j	80002aac <_ZN9BufferCPPD1Ev+0x34>
    __putc('!');
    80002af0:	02100513          	li	a0,33
    80002af4:	00003097          	auipc	ra,0x3
    80002af8:	ecc080e7          	jalr	-308(ra) # 800059c0 <__putc>
    __putc('\n');
    80002afc:	00a00513          	li	a0,10
    80002b00:	00003097          	auipc	ra,0x3
    80002b04:	ec0080e7          	jalr	-320(ra) # 800059c0 <__putc>
    __mem_free(buffer);
    80002b08:	0084b503          	ld	a0,8(s1)
    80002b0c:	00003097          	auipc	ra,0x3
    80002b10:	c90080e7          	jalr	-880(ra) # 8000579c <__mem_free>
    delete itemAvailable;
    80002b14:	0204b503          	ld	a0,32(s1)
    80002b18:	00050863          	beqz	a0,80002b28 <_ZN9BufferCPPD1Ev+0xb0>
    80002b1c:	00053783          	ld	a5,0(a0)
    80002b20:	0087b783          	ld	a5,8(a5)
    80002b24:	000780e7          	jalr	a5
    delete spaceAvailable;
    80002b28:	0184b503          	ld	a0,24(s1)
    80002b2c:	00050863          	beqz	a0,80002b3c <_ZN9BufferCPPD1Ev+0xc4>
    80002b30:	00053783          	ld	a5,0(a0)
    80002b34:	0087b783          	ld	a5,8(a5)
    80002b38:	000780e7          	jalr	a5
    delete mutexTail;
    80002b3c:	0304b503          	ld	a0,48(s1)
    80002b40:	00050863          	beqz	a0,80002b50 <_ZN9BufferCPPD1Ev+0xd8>
    80002b44:	00053783          	ld	a5,0(a0)
    80002b48:	0087b783          	ld	a5,8(a5)
    80002b4c:	000780e7          	jalr	a5
    delete mutexHead;
    80002b50:	0284b503          	ld	a0,40(s1)
    80002b54:	00050863          	beqz	a0,80002b64 <_ZN9BufferCPPD1Ev+0xec>
    80002b58:	00053783          	ld	a5,0(a0)
    80002b5c:	0087b783          	ld	a5,8(a5)
    80002b60:	000780e7          	jalr	a5
}
    80002b64:	01813083          	ld	ra,24(sp)
    80002b68:	01013403          	ld	s0,16(sp)
    80002b6c:	00813483          	ld	s1,8(sp)
    80002b70:	02010113          	addi	sp,sp,32
    80002b74:	00008067          	ret

0000000080002b78 <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    80002b78:	fd010113          	addi	sp,sp,-48
    80002b7c:	02113423          	sd	ra,40(sp)
    80002b80:	02813023          	sd	s0,32(sp)
    80002b84:	00913c23          	sd	s1,24(sp)
    80002b88:	01213823          	sd	s2,16(sp)
    80002b8c:	01313423          	sd	s3,8(sp)
    80002b90:	03010413          	addi	s0,sp,48
    80002b94:	00050993          	mv	s3,a0
    80002b98:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80002b9c:	00000913          	li	s2,0
    80002ba0:	00c0006f          	j	80002bac <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 59) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80002ba4:	fffff097          	auipc	ra,0xfffff
    80002ba8:	f70080e7          	jalr	-144(ra) # 80001b14 <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 59) {
    80002bac:	ffffe097          	auipc	ra,0xffffe
    80002bb0:	720080e7          	jalr	1824(ra) # 800012cc <_Z4getcv>
    80002bb4:	0005059b          	sext.w	a1,a0
    80002bb8:	03b00793          	li	a5,59
    80002bbc:	02f58a63          	beq	a1,a5,80002bf0 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    80002bc0:	0084b503          	ld	a0,8(s1)
    80002bc4:	00000097          	auipc	ra,0x0
    80002bc8:	d10080e7          	jalr	-752(ra) # 800028d4 <_ZN9BufferCPP3putEi>
        i++;
    80002bcc:	0019071b          	addiw	a4,s2,1
    80002bd0:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80002bd4:	0004a683          	lw	a3,0(s1)
    80002bd8:	0026979b          	slliw	a5,a3,0x2
    80002bdc:	00d787bb          	addw	a5,a5,a3
    80002be0:	0017979b          	slliw	a5,a5,0x1
    80002be4:	02f767bb          	remw	a5,a4,a5
    80002be8:	fc0792e3          	bnez	a5,80002bac <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    80002bec:	fb9ff06f          	j	80002ba4 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    80002bf0:	00100793          	li	a5,1
    80002bf4:	00005717          	auipc	a4,0x5
    80002bf8:	a2f72623          	sw	a5,-1492(a4) # 80007620 <threadEnd>
    td->buffer->put('!');
    80002bfc:	0109b783          	ld	a5,16(s3)
    80002c00:	02100593          	li	a1,33
    80002c04:	0087b503          	ld	a0,8(a5)
    80002c08:	00000097          	auipc	ra,0x0
    80002c0c:	ccc080e7          	jalr	-820(ra) # 800028d4 <_ZN9BufferCPP3putEi>

    data->wait->signal();
    80002c10:	0104b503          	ld	a0,16(s1)
    80002c14:	fffff097          	auipc	ra,0xfffff
    80002c18:	f8c080e7          	jalr	-116(ra) # 80001ba0 <_ZN9Semaphore6signalEv>
}
    80002c1c:	02813083          	ld	ra,40(sp)
    80002c20:	02013403          	ld	s0,32(sp)
    80002c24:	01813483          	ld	s1,24(sp)
    80002c28:	01013903          	ld	s2,16(sp)
    80002c2c:	00813983          	ld	s3,8(sp)
    80002c30:	03010113          	addi	sp,sp,48
    80002c34:	00008067          	ret

0000000080002c38 <_ZN8Producer8producerEPv>:
    void run() override {
        producer(td);
    }
};

void Producer::producer(void *arg) {
    80002c38:	fe010113          	addi	sp,sp,-32
    80002c3c:	00113c23          	sd	ra,24(sp)
    80002c40:	00813823          	sd	s0,16(sp)
    80002c44:	00913423          	sd	s1,8(sp)
    80002c48:	01213023          	sd	s2,0(sp)
    80002c4c:	02010413          	addi	s0,sp,32
    80002c50:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80002c54:	00000913          	li	s2,0
    80002c58:	00c0006f          	j	80002c64 <_ZN8Producer8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80002c5c:	fffff097          	auipc	ra,0xfffff
    80002c60:	eb8080e7          	jalr	-328(ra) # 80001b14 <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    80002c64:	00005797          	auipc	a5,0x5
    80002c68:	9bc7a783          	lw	a5,-1604(a5) # 80007620 <threadEnd>
    80002c6c:	02079e63          	bnez	a5,80002ca8 <_ZN8Producer8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    80002c70:	0004a583          	lw	a1,0(s1)
    80002c74:	0305859b          	addiw	a1,a1,48
    80002c78:	0084b503          	ld	a0,8(s1)
    80002c7c:	00000097          	auipc	ra,0x0
    80002c80:	c58080e7          	jalr	-936(ra) # 800028d4 <_ZN9BufferCPP3putEi>
        i++;
    80002c84:	0019071b          	addiw	a4,s2,1
    80002c88:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80002c8c:	0004a683          	lw	a3,0(s1)
    80002c90:	0026979b          	slliw	a5,a3,0x2
    80002c94:	00d787bb          	addw	a5,a5,a3
    80002c98:	0017979b          	slliw	a5,a5,0x1
    80002c9c:	02f767bb          	remw	a5,a4,a5
    80002ca0:	fc0792e3          	bnez	a5,80002c64 <_ZN8Producer8producerEPv+0x2c>
    80002ca4:	fb9ff06f          	j	80002c5c <_ZN8Producer8producerEPv+0x24>
        }
    }

    data->wait->signal();
    80002ca8:	0104b503          	ld	a0,16(s1)
    80002cac:	fffff097          	auipc	ra,0xfffff
    80002cb0:	ef4080e7          	jalr	-268(ra) # 80001ba0 <_ZN9Semaphore6signalEv>
}
    80002cb4:	01813083          	ld	ra,24(sp)
    80002cb8:	01013403          	ld	s0,16(sp)
    80002cbc:	00813483          	ld	s1,8(sp)
    80002cc0:	00013903          	ld	s2,0(sp)
    80002cc4:	02010113          	addi	sp,sp,32
    80002cc8:	00008067          	ret

0000000080002ccc <_ZN8Consumer8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void Consumer::consumer(void *arg) {
    80002ccc:	fd010113          	addi	sp,sp,-48
    80002cd0:	02113423          	sd	ra,40(sp)
    80002cd4:	02813023          	sd	s0,32(sp)
    80002cd8:	00913c23          	sd	s1,24(sp)
    80002cdc:	01213823          	sd	s2,16(sp)
    80002ce0:	01313423          	sd	s3,8(sp)
    80002ce4:	01413023          	sd	s4,0(sp)
    80002ce8:	03010413          	addi	s0,sp,48
    80002cec:	00050993          	mv	s3,a0
    80002cf0:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80002cf4:	00000a13          	li	s4,0
    80002cf8:	01c0006f          	j	80002d14 <_ZN8Consumer8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    80002cfc:	fffff097          	auipc	ra,0xfffff
    80002d00:	e18080e7          	jalr	-488(ra) # 80001b14 <_ZN6Thread8dispatchEv>
    80002d04:	0500006f          	j	80002d54 <_ZN8Consumer8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    80002d08:	00a00513          	li	a0,10
    80002d0c:	ffffe097          	auipc	ra,0xffffe
    80002d10:	5ec080e7          	jalr	1516(ra) # 800012f8 <_Z4putcc>
    while (!threadEnd) {
    80002d14:	00005797          	auipc	a5,0x5
    80002d18:	90c7a783          	lw	a5,-1780(a5) # 80007620 <threadEnd>
    80002d1c:	06079263          	bnez	a5,80002d80 <_ZN8Consumer8consumerEPv+0xb4>
        int key = data->buffer->get();
    80002d20:	00893503          	ld	a0,8(s2)
    80002d24:	00000097          	auipc	ra,0x0
    80002d28:	c40080e7          	jalr	-960(ra) # 80002964 <_ZN9BufferCPP3getEv>
        i++;
    80002d2c:	001a049b          	addiw	s1,s4,1
    80002d30:	00048a1b          	sext.w	s4,s1
        putc(key);
    80002d34:	0ff57513          	andi	a0,a0,255
    80002d38:	ffffe097          	auipc	ra,0xffffe
    80002d3c:	5c0080e7          	jalr	1472(ra) # 800012f8 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80002d40:	00092703          	lw	a4,0(s2)
    80002d44:	0027179b          	slliw	a5,a4,0x2
    80002d48:	00e787bb          	addw	a5,a5,a4
    80002d4c:	02f4e7bb          	remw	a5,s1,a5
    80002d50:	fa0786e3          	beqz	a5,80002cfc <_ZN8Consumer8consumerEPv+0x30>
        if (i % 80 == 0) {
    80002d54:	05000793          	li	a5,80
    80002d58:	02f4e4bb          	remw	s1,s1,a5
    80002d5c:	fa049ce3          	bnez	s1,80002d14 <_ZN8Consumer8consumerEPv+0x48>
    80002d60:	fa9ff06f          	j	80002d08 <_ZN8Consumer8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    80002d64:	0109b783          	ld	a5,16(s3)
    80002d68:	0087b503          	ld	a0,8(a5)
    80002d6c:	00000097          	auipc	ra,0x0
    80002d70:	bf8080e7          	jalr	-1032(ra) # 80002964 <_ZN9BufferCPP3getEv>
        Console::putc(key);
    80002d74:	0ff57513          	andi	a0,a0,255
    80002d78:	fffff097          	auipc	ra,0xfffff
    80002d7c:	fa0080e7          	jalr	-96(ra) # 80001d18 <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    80002d80:	0109b783          	ld	a5,16(s3)
    80002d84:	0087b503          	ld	a0,8(a5)
    80002d88:	00000097          	auipc	ra,0x0
    80002d8c:	c68080e7          	jalr	-920(ra) # 800029f0 <_ZN9BufferCPP6getCntEv>
    80002d90:	fca04ae3          	bgtz	a0,80002d64 <_ZN8Consumer8consumerEPv+0x98>
    }

    data->wait->signal();
    80002d94:	01093503          	ld	a0,16(s2)
    80002d98:	fffff097          	auipc	ra,0xfffff
    80002d9c:	e08080e7          	jalr	-504(ra) # 80001ba0 <_ZN9Semaphore6signalEv>
}
    80002da0:	02813083          	ld	ra,40(sp)
    80002da4:	02013403          	ld	s0,32(sp)
    80002da8:	01813483          	ld	s1,24(sp)
    80002dac:	01013903          	ld	s2,16(sp)
    80002db0:	00813983          	ld	s3,8(sp)
    80002db4:	00013a03          	ld	s4,0(sp)
    80002db8:	03010113          	addi	sp,sp,48
    80002dbc:	00008067          	ret

0000000080002dc0 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    80002dc0:	f9010113          	addi	sp,sp,-112
    80002dc4:	06113423          	sd	ra,104(sp)
    80002dc8:	06813023          	sd	s0,96(sp)
    80002dcc:	04913c23          	sd	s1,88(sp)
    80002dd0:	05213823          	sd	s2,80(sp)
    80002dd4:	05313423          	sd	s3,72(sp)
    80002dd8:	05413023          	sd	s4,64(sp)
    80002ddc:	03513c23          	sd	s5,56(sp)
    80002de0:	03613823          	sd	s6,48(sp)
    80002de4:	03713423          	sd	s7,40(sp)
    80002de8:	07010413          	addi	s0,sp,112
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    80002dec:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    80002df0:	00003517          	auipc	a0,0x3
    80002df4:	2d050513          	addi	a0,a0,720 # 800060c0 <kvmincrease+0x5e0>
    80002df8:	fffff097          	auipc	ra,0xfffff
    80002dfc:	6e8080e7          	jalr	1768(ra) # 800024e0 <_Z11printStringPKc>
    getString(input, 30);
    80002e00:	01e00593          	li	a1,30
    80002e04:	f9040493          	addi	s1,s0,-112
    80002e08:	00048513          	mv	a0,s1
    80002e0c:	fffff097          	auipc	ra,0xfffff
    80002e10:	750080e7          	jalr	1872(ra) # 8000255c <_Z9getStringPci>
    threadNum = stringToInt(input);
    80002e14:	00048513          	mv	a0,s1
    80002e18:	00000097          	auipc	ra,0x0
    80002e1c:	810080e7          	jalr	-2032(ra) # 80002628 <_Z11stringToIntPKc>
    80002e20:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80002e24:	00003517          	auipc	a0,0x3
    80002e28:	2bc50513          	addi	a0,a0,700 # 800060e0 <kvmincrease+0x600>
    80002e2c:	fffff097          	auipc	ra,0xfffff
    80002e30:	6b4080e7          	jalr	1716(ra) # 800024e0 <_Z11printStringPKc>
    getString(input, 30);
    80002e34:	01e00593          	li	a1,30
    80002e38:	00048513          	mv	a0,s1
    80002e3c:	fffff097          	auipc	ra,0xfffff
    80002e40:	720080e7          	jalr	1824(ra) # 8000255c <_Z9getStringPci>
    n = stringToInt(input);
    80002e44:	00048513          	mv	a0,s1
    80002e48:	fffff097          	auipc	ra,0xfffff
    80002e4c:	7e0080e7          	jalr	2016(ra) # 80002628 <_Z11stringToIntPKc>
    80002e50:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80002e54:	00003517          	auipc	a0,0x3
    80002e58:	2ac50513          	addi	a0,a0,684 # 80006100 <kvmincrease+0x620>
    80002e5c:	fffff097          	auipc	ra,0xfffff
    80002e60:	684080e7          	jalr	1668(ra) # 800024e0 <_Z11printStringPKc>
    80002e64:	00000613          	li	a2,0
    80002e68:	00a00593          	li	a1,10
    80002e6c:	00090513          	mv	a0,s2
    80002e70:	00000097          	auipc	ra,0x0
    80002e74:	808080e7          	jalr	-2040(ra) # 80002678 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80002e78:	00003517          	auipc	a0,0x3
    80002e7c:	2a050513          	addi	a0,a0,672 # 80006118 <kvmincrease+0x638>
    80002e80:	fffff097          	auipc	ra,0xfffff
    80002e84:	660080e7          	jalr	1632(ra) # 800024e0 <_Z11printStringPKc>
    80002e88:	00000613          	li	a2,0
    80002e8c:	00a00593          	li	a1,10
    80002e90:	00048513          	mv	a0,s1
    80002e94:	fffff097          	auipc	ra,0xfffff
    80002e98:	7e4080e7          	jalr	2020(ra) # 80002678 <_Z8printIntiii>
    printString(".\n");
    80002e9c:	00003517          	auipc	a0,0x3
    80002ea0:	29450513          	addi	a0,a0,660 # 80006130 <kvmincrease+0x650>
    80002ea4:	fffff097          	auipc	ra,0xfffff
    80002ea8:	63c080e7          	jalr	1596(ra) # 800024e0 <_Z11printStringPKc>
    if(threadNum > n) {
    80002eac:	0324c463          	blt	s1,s2,80002ed4 <_Z29producerConsumer_CPP_Sync_APIv+0x114>
    } else if (threadNum < 1) {
    80002eb0:	03205c63          	blez	s2,80002ee8 <_Z29producerConsumer_CPP_Sync_APIv+0x128>
    BufferCPP *buffer = new BufferCPP(n);
    80002eb4:	03800513          	li	a0,56
    80002eb8:	fffff097          	auipc	ra,0xfffff
    80002ebc:	d14080e7          	jalr	-748(ra) # 80001bcc <_Znwm>
    80002ec0:	00050a93          	mv	s5,a0
    80002ec4:	00048593          	mv	a1,s1
    80002ec8:	00000097          	auipc	ra,0x0
    80002ecc:	8b8080e7          	jalr	-1864(ra) # 80002780 <_ZN9BufferCPPC1Ei>
    80002ed0:	0300006f          	j	80002f00 <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80002ed4:	00003517          	auipc	a0,0x3
    80002ed8:	26450513          	addi	a0,a0,612 # 80006138 <kvmincrease+0x658>
    80002edc:	fffff097          	auipc	ra,0xfffff
    80002ee0:	604080e7          	jalr	1540(ra) # 800024e0 <_Z11printStringPKc>
        return;
    80002ee4:	0140006f          	j	80002ef8 <_Z29producerConsumer_CPP_Sync_APIv+0x138>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80002ee8:	00003517          	auipc	a0,0x3
    80002eec:	29050513          	addi	a0,a0,656 # 80006178 <kvmincrease+0x698>
    80002ef0:	fffff097          	auipc	ra,0xfffff
    80002ef4:	5f0080e7          	jalr	1520(ra) # 800024e0 <_Z11printStringPKc>
        return;
    80002ef8:	000b8113          	mv	sp,s7
    80002efc:	2240006f          	j	80003120 <_Z29producerConsumer_CPP_Sync_APIv+0x360>
    waitForAll = new Semaphore(0);
    80002f00:	01000513          	li	a0,16
    80002f04:	fffff097          	auipc	ra,0xfffff
    80002f08:	cc8080e7          	jalr	-824(ra) # 80001bcc <_Znwm>
    80002f0c:	00050493          	mv	s1,a0
    80002f10:	00000593          	li	a1,0
    80002f14:	fffff097          	auipc	ra,0xfffff
    80002f18:	c28080e7          	jalr	-984(ra) # 80001b3c <_ZN9SemaphoreC1Ej>
    80002f1c:	00004717          	auipc	a4,0x4
    80002f20:	70470713          	addi	a4,a4,1796 # 80007620 <threadEnd>
    80002f24:	00973423          	sd	s1,8(a4)
    Thread* threads[threadNum];
    80002f28:	00391793          	slli	a5,s2,0x3
    80002f2c:	00f78793          	addi	a5,a5,15
    80002f30:	ff07f793          	andi	a5,a5,-16
    80002f34:	40f10133          	sub	sp,sp,a5
    80002f38:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    80002f3c:	0019069b          	addiw	a3,s2,1
    80002f40:	00169793          	slli	a5,a3,0x1
    80002f44:	00d787b3          	add	a5,a5,a3
    80002f48:	00379793          	slli	a5,a5,0x3
    80002f4c:	00f78793          	addi	a5,a5,15
    80002f50:	ff07f793          	andi	a5,a5,-16
    80002f54:	40f10133          	sub	sp,sp,a5
    80002f58:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    80002f5c:	00191493          	slli	s1,s2,0x1
    80002f60:	012487b3          	add	a5,s1,s2
    80002f64:	00379793          	slli	a5,a5,0x3
    80002f68:	00fa07b3          	add	a5,s4,a5
    80002f6c:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80002f70:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    80002f74:	00873703          	ld	a4,8(a4)
    80002f78:	00e7b823          	sd	a4,16(a5)
    consumerThread = new Consumer(data+threadNum);
    80002f7c:	01800513          	li	a0,24
    80002f80:	fffff097          	auipc	ra,0xfffff
    80002f84:	c4c080e7          	jalr	-948(ra) # 80001bcc <_Znwm>
    80002f88:	00050b13          	mv	s6,a0
    80002f8c:	012484b3          	add	s1,s1,s2
    80002f90:	00349493          	slli	s1,s1,0x3
    80002f94:	009a04b3          	add	s1,s4,s1

    static void dispatch();
    //static int sleep(time_t);

protected:
    Thread() : myHandle(nullptr) {}
    80002f98:	00053423          	sd	zero,8(a0)
    Consumer(thread_data* _td):Thread(), td(_td) {}
    80002f9c:	00004797          	auipc	a5,0x4
    80002fa0:	5cc78793          	addi	a5,a5,1484 # 80007568 <_ZTV8Consumer+0x10>
    80002fa4:	00f53023          	sd	a5,0(a0)
    80002fa8:	00953823          	sd	s1,16(a0)
    consumerThread->start();
    80002fac:	fffff097          	auipc	ra,0xfffff
    80002fb0:	b20080e7          	jalr	-1248(ra) # 80001acc <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80002fb4:	00000493          	li	s1,0
    80002fb8:	0580006f          	j	80003010 <_Z29producerConsumer_CPP_Sync_APIv+0x250>
            threads[i] = new Producer(data+i);
    80002fbc:	01800513          	li	a0,24
    80002fc0:	fffff097          	auipc	ra,0xfffff
    80002fc4:	c0c080e7          	jalr	-1012(ra) # 80001bcc <_Znwm>
    80002fc8:	00149793          	slli	a5,s1,0x1
    80002fcc:	009787b3          	add	a5,a5,s1
    80002fd0:	00379793          	slli	a5,a5,0x3
    80002fd4:	00fa07b3          	add	a5,s4,a5
    80002fd8:	00053423          	sd	zero,8(a0)
    Producer(thread_data* _td):Thread(), td(_td) {}
    80002fdc:	00004717          	auipc	a4,0x4
    80002fe0:	56470713          	addi	a4,a4,1380 # 80007540 <_ZTV8Producer+0x10>
    80002fe4:	00e53023          	sd	a4,0(a0)
    80002fe8:	00f53823          	sd	a5,16(a0)
            threads[i] = new Producer(data+i);
    80002fec:	00349793          	slli	a5,s1,0x3
    80002ff0:	00f987b3          	add	a5,s3,a5
    80002ff4:	00a7b023          	sd	a0,0(a5)
        threads[i]->start();
    80002ff8:	00349793          	slli	a5,s1,0x3
    80002ffc:	00f987b3          	add	a5,s3,a5
    80003000:	0007b503          	ld	a0,0(a5)
    80003004:	fffff097          	auipc	ra,0xfffff
    80003008:	ac8080e7          	jalr	-1336(ra) # 80001acc <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    8000300c:	0014849b          	addiw	s1,s1,1
    80003010:	0724d663          	bge	s1,s2,8000307c <_Z29producerConsumer_CPP_Sync_APIv+0x2bc>
        data[i].id = i;
    80003014:	00149793          	slli	a5,s1,0x1
    80003018:	009787b3          	add	a5,a5,s1
    8000301c:	00379793          	slli	a5,a5,0x3
    80003020:	00fa07b3          	add	a5,s4,a5
    80003024:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80003028:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    8000302c:	00004717          	auipc	a4,0x4
    80003030:	5fc73703          	ld	a4,1532(a4) # 80007628 <waitForAll>
    80003034:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    80003038:	f89042e3          	bgtz	s1,80002fbc <_Z29producerConsumer_CPP_Sync_APIv+0x1fc>
            threads[i] = new ProducerKeyboard(data+i);
    8000303c:	01800513          	li	a0,24
    80003040:	fffff097          	auipc	ra,0xfffff
    80003044:	b8c080e7          	jalr	-1140(ra) # 80001bcc <_Znwm>
    80003048:	00149793          	slli	a5,s1,0x1
    8000304c:	009787b3          	add	a5,a5,s1
    80003050:	00379793          	slli	a5,a5,0x3
    80003054:	00fa07b3          	add	a5,s4,a5
    80003058:	00053423          	sd	zero,8(a0)
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    8000305c:	00004717          	auipc	a4,0x4
    80003060:	4bc70713          	addi	a4,a4,1212 # 80007518 <_ZTV16ProducerKeyboard+0x10>
    80003064:	00e53023          	sd	a4,0(a0)
    80003068:	00f53823          	sd	a5,16(a0)
            threads[i] = new ProducerKeyboard(data+i);
    8000306c:	00349793          	slli	a5,s1,0x3
    80003070:	00f987b3          	add	a5,s3,a5
    80003074:	00a7b023          	sd	a0,0(a5)
    80003078:	f81ff06f          	j	80002ff8 <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    Thread::dispatch();
    8000307c:	fffff097          	auipc	ra,0xfffff
    80003080:	a98080e7          	jalr	-1384(ra) # 80001b14 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80003084:	00000493          	li	s1,0
    80003088:	00994e63          	blt	s2,s1,800030a4 <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
        waitForAll->wait();
    8000308c:	00004517          	auipc	a0,0x4
    80003090:	59c53503          	ld	a0,1436(a0) # 80007628 <waitForAll>
    80003094:	fffff097          	auipc	ra,0xfffff
    80003098:	ae0080e7          	jalr	-1312(ra) # 80001b74 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    8000309c:	0014849b          	addiw	s1,s1,1
    800030a0:	fe9ff06f          	j	80003088 <_Z29producerConsumer_CPP_Sync_APIv+0x2c8>
    for (int i = 0; i < threadNum; i++) {
    800030a4:	00000493          	li	s1,0
    800030a8:	0080006f          	j	800030b0 <_Z29producerConsumer_CPP_Sync_APIv+0x2f0>
    800030ac:	0014849b          	addiw	s1,s1,1
    800030b0:	0324d263          	bge	s1,s2,800030d4 <_Z29producerConsumer_CPP_Sync_APIv+0x314>
        delete threads[i];
    800030b4:	00349793          	slli	a5,s1,0x3
    800030b8:	00f987b3          	add	a5,s3,a5
    800030bc:	0007b503          	ld	a0,0(a5)
    800030c0:	fe0506e3          	beqz	a0,800030ac <_Z29producerConsumer_CPP_Sync_APIv+0x2ec>
    800030c4:	00053783          	ld	a5,0(a0)
    800030c8:	0087b783          	ld	a5,8(a5)
    800030cc:	000780e7          	jalr	a5
    800030d0:	fddff06f          	j	800030ac <_Z29producerConsumer_CPP_Sync_APIv+0x2ec>
    delete consumerThread;
    800030d4:	000b0a63          	beqz	s6,800030e8 <_Z29producerConsumer_CPP_Sync_APIv+0x328>
    800030d8:	000b3783          	ld	a5,0(s6)
    800030dc:	0087b783          	ld	a5,8(a5)
    800030e0:	000b0513          	mv	a0,s6
    800030e4:	000780e7          	jalr	a5
    delete waitForAll;
    800030e8:	00004517          	auipc	a0,0x4
    800030ec:	54053503          	ld	a0,1344(a0) # 80007628 <waitForAll>
    800030f0:	00050863          	beqz	a0,80003100 <_Z29producerConsumer_CPP_Sync_APIv+0x340>
    800030f4:	00053783          	ld	a5,0(a0)
    800030f8:	0087b783          	ld	a5,8(a5)
    800030fc:	000780e7          	jalr	a5
    delete buffer;
    80003100:	000a8e63          	beqz	s5,8000311c <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    80003104:	000a8513          	mv	a0,s5
    80003108:	00000097          	auipc	ra,0x0
    8000310c:	970080e7          	jalr	-1680(ra) # 80002a78 <_ZN9BufferCPPD1Ev>
    80003110:	000a8513          	mv	a0,s5
    80003114:	fffff097          	auipc	ra,0xfffff
    80003118:	ae0080e7          	jalr	-1312(ra) # 80001bf4 <_ZdlPv>
    8000311c:	000b8113          	mv	sp,s7

}
    80003120:	f9040113          	addi	sp,s0,-112
    80003124:	06813083          	ld	ra,104(sp)
    80003128:	06013403          	ld	s0,96(sp)
    8000312c:	05813483          	ld	s1,88(sp)
    80003130:	05013903          	ld	s2,80(sp)
    80003134:	04813983          	ld	s3,72(sp)
    80003138:	04013a03          	ld	s4,64(sp)
    8000313c:	03813a83          	ld	s5,56(sp)
    80003140:	03013b03          	ld	s6,48(sp)
    80003144:	02813b83          	ld	s7,40(sp)
    80003148:	07010113          	addi	sp,sp,112
    8000314c:	00008067          	ret
    80003150:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80003154:	000a8513          	mv	a0,s5
    80003158:	fffff097          	auipc	ra,0xfffff
    8000315c:	a9c080e7          	jalr	-1380(ra) # 80001bf4 <_ZdlPv>
    80003160:	00048513          	mv	a0,s1
    80003164:	00005097          	auipc	ra,0x5
    80003168:	594080e7          	jalr	1428(ra) # 800086f8 <_Unwind_Resume>
    8000316c:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    80003170:	00048513          	mv	a0,s1
    80003174:	fffff097          	auipc	ra,0xfffff
    80003178:	a80080e7          	jalr	-1408(ra) # 80001bf4 <_ZdlPv>
    8000317c:	00090513          	mv	a0,s2
    80003180:	00005097          	auipc	ra,0x5
    80003184:	578080e7          	jalr	1400(ra) # 800086f8 <_Unwind_Resume>

0000000080003188 <_Z8userMainv>:
#include "../test/ConsumerProducer_CPP_Sync_API_test.hpp" // zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta

//#include "../test/ThreadSleep_C_API_test.hpp" // thread_sleep test C API
//#include "../test/ConsumerProducer_CPP_API_test.hpp" // zadatak 4. CPP API i asinhrona promena konteksta

void userMain() {
    80003188:	ff010113          	addi	sp,sp,-16
    8000318c:	00113423          	sd	ra,8(sp)
    80003190:	00813023          	sd	s0,0(sp)
    80003194:	01010413          	addi	s0,sp,16
//    Threads_C_API_test(); // zadatak 2., niti C API i sinhrona promena konteksta
//    Threads_CPP_API_test(); // zadatak 2., niti CPP API i sinhrona promena konteksta

//    producerConsumer_C_API(); // zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta
    producerConsumer_CPP_Sync_API(); // zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta
    80003198:	00000097          	auipc	ra,0x0
    8000319c:	c28080e7          	jalr	-984(ra) # 80002dc0 <_Z29producerConsumer_CPP_Sync_APIv>

    //testSleeping(); // thread_sleep test C API
    //ConsumerProducerCPP::testConsumerProducer(); // zadatak 4. CPP API i asinhrona promena konteksta, kompletan test svega

    800031a0:	00813083          	ld	ra,8(sp)
    800031a4:	00013403          	ld	s0,0(sp)
    800031a8:	01010113          	addi	sp,sp,16
    800031ac:	00008067          	ret

00000000800031b0 <_ZN8ConsumerD1Ev>:
class Consumer:public Thread {
    800031b0:	ff010113          	addi	sp,sp,-16
    800031b4:	00113423          	sd	ra,8(sp)
    800031b8:	00813023          	sd	s0,0(sp)
    800031bc:	01010413          	addi	s0,sp,16
    800031c0:	00004797          	auipc	a5,0x4
    800031c4:	3a878793          	addi	a5,a5,936 # 80007568 <_ZTV8Consumer+0x10>
    800031c8:	00f53023          	sd	a5,0(a0)
    800031cc:	fffff097          	auipc	ra,0xfffff
    800031d0:	a50080e7          	jalr	-1456(ra) # 80001c1c <_ZN6ThreadD1Ev>
    800031d4:	00813083          	ld	ra,8(sp)
    800031d8:	00013403          	ld	s0,0(sp)
    800031dc:	01010113          	addi	sp,sp,16
    800031e0:	00008067          	ret

00000000800031e4 <_ZN8ConsumerD0Ev>:
    800031e4:	fe010113          	addi	sp,sp,-32
    800031e8:	00113c23          	sd	ra,24(sp)
    800031ec:	00813823          	sd	s0,16(sp)
    800031f0:	00913423          	sd	s1,8(sp)
    800031f4:	02010413          	addi	s0,sp,32
    800031f8:	00050493          	mv	s1,a0
    800031fc:	00004797          	auipc	a5,0x4
    80003200:	36c78793          	addi	a5,a5,876 # 80007568 <_ZTV8Consumer+0x10>
    80003204:	00f53023          	sd	a5,0(a0)
    80003208:	fffff097          	auipc	ra,0xfffff
    8000320c:	a14080e7          	jalr	-1516(ra) # 80001c1c <_ZN6ThreadD1Ev>
    80003210:	00048513          	mv	a0,s1
    80003214:	fffff097          	auipc	ra,0xfffff
    80003218:	9e0080e7          	jalr	-1568(ra) # 80001bf4 <_ZdlPv>
    8000321c:	01813083          	ld	ra,24(sp)
    80003220:	01013403          	ld	s0,16(sp)
    80003224:	00813483          	ld	s1,8(sp)
    80003228:	02010113          	addi	sp,sp,32
    8000322c:	00008067          	ret

0000000080003230 <_ZN8ProducerD1Ev>:
class Producer:public Thread {
    80003230:	ff010113          	addi	sp,sp,-16
    80003234:	00113423          	sd	ra,8(sp)
    80003238:	00813023          	sd	s0,0(sp)
    8000323c:	01010413          	addi	s0,sp,16
    80003240:	00004797          	auipc	a5,0x4
    80003244:	30078793          	addi	a5,a5,768 # 80007540 <_ZTV8Producer+0x10>
    80003248:	00f53023          	sd	a5,0(a0)
    8000324c:	fffff097          	auipc	ra,0xfffff
    80003250:	9d0080e7          	jalr	-1584(ra) # 80001c1c <_ZN6ThreadD1Ev>
    80003254:	00813083          	ld	ra,8(sp)
    80003258:	00013403          	ld	s0,0(sp)
    8000325c:	01010113          	addi	sp,sp,16
    80003260:	00008067          	ret

0000000080003264 <_ZN8ProducerD0Ev>:
    80003264:	fe010113          	addi	sp,sp,-32
    80003268:	00113c23          	sd	ra,24(sp)
    8000326c:	00813823          	sd	s0,16(sp)
    80003270:	00913423          	sd	s1,8(sp)
    80003274:	02010413          	addi	s0,sp,32
    80003278:	00050493          	mv	s1,a0
    8000327c:	00004797          	auipc	a5,0x4
    80003280:	2c478793          	addi	a5,a5,708 # 80007540 <_ZTV8Producer+0x10>
    80003284:	00f53023          	sd	a5,0(a0)
    80003288:	fffff097          	auipc	ra,0xfffff
    8000328c:	994080e7          	jalr	-1644(ra) # 80001c1c <_ZN6ThreadD1Ev>
    80003290:	00048513          	mv	a0,s1
    80003294:	fffff097          	auipc	ra,0xfffff
    80003298:	960080e7          	jalr	-1696(ra) # 80001bf4 <_ZdlPv>
    8000329c:	01813083          	ld	ra,24(sp)
    800032a0:	01013403          	ld	s0,16(sp)
    800032a4:	00813483          	ld	s1,8(sp)
    800032a8:	02010113          	addi	sp,sp,32
    800032ac:	00008067          	ret

00000000800032b0 <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    800032b0:	ff010113          	addi	sp,sp,-16
    800032b4:	00113423          	sd	ra,8(sp)
    800032b8:	00813023          	sd	s0,0(sp)
    800032bc:	01010413          	addi	s0,sp,16
    800032c0:	00004797          	auipc	a5,0x4
    800032c4:	25878793          	addi	a5,a5,600 # 80007518 <_ZTV16ProducerKeyboard+0x10>
    800032c8:	00f53023          	sd	a5,0(a0)
    800032cc:	fffff097          	auipc	ra,0xfffff
    800032d0:	950080e7          	jalr	-1712(ra) # 80001c1c <_ZN6ThreadD1Ev>
    800032d4:	00813083          	ld	ra,8(sp)
    800032d8:	00013403          	ld	s0,0(sp)
    800032dc:	01010113          	addi	sp,sp,16
    800032e0:	00008067          	ret

00000000800032e4 <_ZN16ProducerKeyboardD0Ev>:
    800032e4:	fe010113          	addi	sp,sp,-32
    800032e8:	00113c23          	sd	ra,24(sp)
    800032ec:	00813823          	sd	s0,16(sp)
    800032f0:	00913423          	sd	s1,8(sp)
    800032f4:	02010413          	addi	s0,sp,32
    800032f8:	00050493          	mv	s1,a0
    800032fc:	00004797          	auipc	a5,0x4
    80003300:	21c78793          	addi	a5,a5,540 # 80007518 <_ZTV16ProducerKeyboard+0x10>
    80003304:	00f53023          	sd	a5,0(a0)
    80003308:	fffff097          	auipc	ra,0xfffff
    8000330c:	914080e7          	jalr	-1772(ra) # 80001c1c <_ZN6ThreadD1Ev>
    80003310:	00048513          	mv	a0,s1
    80003314:	fffff097          	auipc	ra,0xfffff
    80003318:	8e0080e7          	jalr	-1824(ra) # 80001bf4 <_ZdlPv>
    8000331c:	01813083          	ld	ra,24(sp)
    80003320:	01013403          	ld	s0,16(sp)
    80003324:	00813483          	ld	s1,8(sp)
    80003328:	02010113          	addi	sp,sp,32
    8000332c:	00008067          	ret

0000000080003330 <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    80003330:	ff010113          	addi	sp,sp,-16
    80003334:	00113423          	sd	ra,8(sp)
    80003338:	00813023          	sd	s0,0(sp)
    8000333c:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    80003340:	01053583          	ld	a1,16(a0)
    80003344:	00000097          	auipc	ra,0x0
    80003348:	834080e7          	jalr	-1996(ra) # 80002b78 <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    8000334c:	00813083          	ld	ra,8(sp)
    80003350:	00013403          	ld	s0,0(sp)
    80003354:	01010113          	addi	sp,sp,16
    80003358:	00008067          	ret

000000008000335c <_ZN8Producer3runEv>:
    void run() override {
    8000335c:	ff010113          	addi	sp,sp,-16
    80003360:	00113423          	sd	ra,8(sp)
    80003364:	00813023          	sd	s0,0(sp)
    80003368:	01010413          	addi	s0,sp,16
        producer(td);
    8000336c:	01053583          	ld	a1,16(a0)
    80003370:	00000097          	auipc	ra,0x0
    80003374:	8c8080e7          	jalr	-1848(ra) # 80002c38 <_ZN8Producer8producerEPv>
    }
    80003378:	00813083          	ld	ra,8(sp)
    8000337c:	00013403          	ld	s0,0(sp)
    80003380:	01010113          	addi	sp,sp,16
    80003384:	00008067          	ret

0000000080003388 <_ZN8Consumer3runEv>:
    void run() override {
    80003388:	ff010113          	addi	sp,sp,-16
    8000338c:	00113423          	sd	ra,8(sp)
    80003390:	00813023          	sd	s0,0(sp)
    80003394:	01010413          	addi	s0,sp,16
        consumer(td);
    80003398:	01053583          	ld	a1,16(a0)
    8000339c:	00000097          	auipc	ra,0x0
    800033a0:	930080e7          	jalr	-1744(ra) # 80002ccc <_ZN8Consumer8consumerEPv>
    }
    800033a4:	00813083          	ld	ra,8(sp)
    800033a8:	00013403          	ld	s0,0(sp)
    800033ac:	01010113          	addi	sp,sp,16
    800033b0:	00008067          	ret

00000000800033b4 <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    800033b4:	fe010113          	addi	sp,sp,-32
    800033b8:	00113c23          	sd	ra,24(sp)
    800033bc:	00813823          	sd	s0,16(sp)
    800033c0:	00913423          	sd	s1,8(sp)
    800033c4:	01213023          	sd	s2,0(sp)
    800033c8:	02010413          	addi	s0,sp,32
    800033cc:	00050493          	mv	s1,a0
    800033d0:	00058913          	mv	s2,a1
    800033d4:	0015879b          	addiw	a5,a1,1
    800033d8:	0007851b          	sext.w	a0,a5
    800033dc:	00f4a023          	sw	a5,0(s1)
    800033e0:	0004a823          	sw	zero,16(s1)
    800033e4:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)__mem_alloc(sizeof(int) * cap);
    800033e8:	00251513          	slli	a0,a0,0x2
    800033ec:	00002097          	auipc	ra,0x2
    800033f0:	47c080e7          	jalr	1148(ra) # 80005868 <__mem_alloc>
    800033f4:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    800033f8:	00000593          	li	a1,0
    800033fc:	02048513          	addi	a0,s1,32
    80003400:	ffffe097          	auipc	ra,0xffffe
    80003404:	e08080e7          	jalr	-504(ra) # 80001208 <_Z8sem_openPP10SemaphoreKj>
    sem_open(&spaceAvailable, _cap);
    80003408:	00090593          	mv	a1,s2
    8000340c:	01848513          	addi	a0,s1,24
    80003410:	ffffe097          	auipc	ra,0xffffe
    80003414:	df8080e7          	jalr	-520(ra) # 80001208 <_Z8sem_openPP10SemaphoreKj>
    sem_open(&mutexHead, 1);
    80003418:	00100593          	li	a1,1
    8000341c:	02848513          	addi	a0,s1,40
    80003420:	ffffe097          	auipc	ra,0xffffe
    80003424:	de8080e7          	jalr	-536(ra) # 80001208 <_Z8sem_openPP10SemaphoreKj>
    sem_open(&mutexTail, 1);
    80003428:	00100593          	li	a1,1
    8000342c:	03048513          	addi	a0,s1,48
    80003430:	ffffe097          	auipc	ra,0xffffe
    80003434:	dd8080e7          	jalr	-552(ra) # 80001208 <_Z8sem_openPP10SemaphoreKj>
}
    80003438:	01813083          	ld	ra,24(sp)
    8000343c:	01013403          	ld	s0,16(sp)
    80003440:	00813483          	ld	s1,8(sp)
    80003444:	00013903          	ld	s2,0(sp)
    80003448:	02010113          	addi	sp,sp,32
    8000344c:	00008067          	ret

0000000080003450 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80003450:	fe010113          	addi	sp,sp,-32
    80003454:	00113c23          	sd	ra,24(sp)
    80003458:	00813823          	sd	s0,16(sp)
    8000345c:	00913423          	sd	s1,8(sp)
    80003460:	01213023          	sd	s2,0(sp)
    80003464:	02010413          	addi	s0,sp,32
    80003468:	00050493          	mv	s1,a0
    8000346c:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80003470:	01853503          	ld	a0,24(a0)
    80003474:	ffffe097          	auipc	ra,0xffffe
    80003478:	df8080e7          	jalr	-520(ra) # 8000126c <_Z8sem_waitP10SemaphoreK>

    sem_wait(mutexTail);
    8000347c:	0304b503          	ld	a0,48(s1)
    80003480:	ffffe097          	auipc	ra,0xffffe
    80003484:	dec080e7          	jalr	-532(ra) # 8000126c <_Z8sem_waitP10SemaphoreK>
    buffer[tail] = val;
    80003488:	0084b783          	ld	a5,8(s1)
    8000348c:	0144a703          	lw	a4,20(s1)
    80003490:	00271713          	slli	a4,a4,0x2
    80003494:	00e787b3          	add	a5,a5,a4
    80003498:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    8000349c:	0144a783          	lw	a5,20(s1)
    800034a0:	0017879b          	addiw	a5,a5,1
    800034a4:	0004a703          	lw	a4,0(s1)
    800034a8:	02e7e7bb          	remw	a5,a5,a4
    800034ac:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    800034b0:	0304b503          	ld	a0,48(s1)
    800034b4:	ffffe097          	auipc	ra,0xffffe
    800034b8:	de8080e7          	jalr	-536(ra) # 8000129c <_Z10sem_signalP10SemaphoreK>

    sem_signal(itemAvailable);
    800034bc:	0204b503          	ld	a0,32(s1)
    800034c0:	ffffe097          	auipc	ra,0xffffe
    800034c4:	ddc080e7          	jalr	-548(ra) # 8000129c <_Z10sem_signalP10SemaphoreK>

}
    800034c8:	01813083          	ld	ra,24(sp)
    800034cc:	01013403          	ld	s0,16(sp)
    800034d0:	00813483          	ld	s1,8(sp)
    800034d4:	00013903          	ld	s2,0(sp)
    800034d8:	02010113          	addi	sp,sp,32
    800034dc:	00008067          	ret

00000000800034e0 <_ZN6Buffer3getEv>:

int Buffer::get() {
    800034e0:	fe010113          	addi	sp,sp,-32
    800034e4:	00113c23          	sd	ra,24(sp)
    800034e8:	00813823          	sd	s0,16(sp)
    800034ec:	00913423          	sd	s1,8(sp)
    800034f0:	01213023          	sd	s2,0(sp)
    800034f4:	02010413          	addi	s0,sp,32
    800034f8:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    800034fc:	02053503          	ld	a0,32(a0)
    80003500:	ffffe097          	auipc	ra,0xffffe
    80003504:	d6c080e7          	jalr	-660(ra) # 8000126c <_Z8sem_waitP10SemaphoreK>

    sem_wait(mutexHead);
    80003508:	0284b503          	ld	a0,40(s1)
    8000350c:	ffffe097          	auipc	ra,0xffffe
    80003510:	d60080e7          	jalr	-672(ra) # 8000126c <_Z8sem_waitP10SemaphoreK>

    int ret = buffer[head];
    80003514:	0084b703          	ld	a4,8(s1)
    80003518:	0104a783          	lw	a5,16(s1)
    8000351c:	00279693          	slli	a3,a5,0x2
    80003520:	00d70733          	add	a4,a4,a3
    80003524:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80003528:	0017879b          	addiw	a5,a5,1
    8000352c:	0004a703          	lw	a4,0(s1)
    80003530:	02e7e7bb          	remw	a5,a5,a4
    80003534:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80003538:	0284b503          	ld	a0,40(s1)
    8000353c:	ffffe097          	auipc	ra,0xffffe
    80003540:	d60080e7          	jalr	-672(ra) # 8000129c <_Z10sem_signalP10SemaphoreK>

    sem_signal(spaceAvailable);
    80003544:	0184b503          	ld	a0,24(s1)
    80003548:	ffffe097          	auipc	ra,0xffffe
    8000354c:	d54080e7          	jalr	-684(ra) # 8000129c <_Z10sem_signalP10SemaphoreK>

    return ret;
}
    80003550:	00090513          	mv	a0,s2
    80003554:	01813083          	ld	ra,24(sp)
    80003558:	01013403          	ld	s0,16(sp)
    8000355c:	00813483          	ld	s1,8(sp)
    80003560:	00013903          	ld	s2,0(sp)
    80003564:	02010113          	addi	sp,sp,32
    80003568:	00008067          	ret

000000008000356c <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    8000356c:	fe010113          	addi	sp,sp,-32
    80003570:	00113c23          	sd	ra,24(sp)
    80003574:	00813823          	sd	s0,16(sp)
    80003578:	00913423          	sd	s1,8(sp)
    8000357c:	01213023          	sd	s2,0(sp)
    80003580:	02010413          	addi	s0,sp,32
    80003584:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80003588:	02853503          	ld	a0,40(a0)
    8000358c:	ffffe097          	auipc	ra,0xffffe
    80003590:	ce0080e7          	jalr	-800(ra) # 8000126c <_Z8sem_waitP10SemaphoreK>
    sem_wait(mutexTail);
    80003594:	0304b503          	ld	a0,48(s1)
    80003598:	ffffe097          	auipc	ra,0xffffe
    8000359c:	cd4080e7          	jalr	-812(ra) # 8000126c <_Z8sem_waitP10SemaphoreK>

    if (tail >= head) {
    800035a0:	0144a783          	lw	a5,20(s1)
    800035a4:	0104a903          	lw	s2,16(s1)
    800035a8:	0327ce63          	blt	a5,s2,800035e4 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    800035ac:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    800035b0:	0304b503          	ld	a0,48(s1)
    800035b4:	ffffe097          	auipc	ra,0xffffe
    800035b8:	ce8080e7          	jalr	-792(ra) # 8000129c <_Z10sem_signalP10SemaphoreK>
    sem_signal(mutexHead);
    800035bc:	0284b503          	ld	a0,40(s1)
    800035c0:	ffffe097          	auipc	ra,0xffffe
    800035c4:	cdc080e7          	jalr	-804(ra) # 8000129c <_Z10sem_signalP10SemaphoreK>

    return ret;
}
    800035c8:	00090513          	mv	a0,s2
    800035cc:	01813083          	ld	ra,24(sp)
    800035d0:	01013403          	ld	s0,16(sp)
    800035d4:	00813483          	ld	s1,8(sp)
    800035d8:	00013903          	ld	s2,0(sp)
    800035dc:	02010113          	addi	sp,sp,32
    800035e0:	00008067          	ret
        ret = cap - head + tail;
    800035e4:	0004a703          	lw	a4,0(s1)
    800035e8:	4127093b          	subw	s2,a4,s2
    800035ec:	00f9093b          	addw	s2,s2,a5
    800035f0:	fc1ff06f          	j	800035b0 <_ZN6Buffer6getCntEv+0x44>

00000000800035f4 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    800035f4:	fe010113          	addi	sp,sp,-32
    800035f8:	00113c23          	sd	ra,24(sp)
    800035fc:	00813823          	sd	s0,16(sp)
    80003600:	00913423          	sd	s1,8(sp)
    80003604:	02010413          	addi	s0,sp,32
    80003608:	00050493          	mv	s1,a0
    __putc('\n');
    8000360c:	00a00513          	li	a0,10
    80003610:	00002097          	auipc	ra,0x2
    80003614:	3b0080e7          	jalr	944(ra) # 800059c0 <__putc>
    printString("Buffer deleted!\n");
    80003618:	00003517          	auipc	a0,0x3
    8000361c:	a9050513          	addi	a0,a0,-1392 # 800060a8 <kvmincrease+0x5c8>
    80003620:	fffff097          	auipc	ra,0xfffff
    80003624:	ec0080e7          	jalr	-320(ra) # 800024e0 <_Z11printStringPKc>
    while (getCnt() > 0) {
    80003628:	00048513          	mv	a0,s1
    8000362c:	00000097          	auipc	ra,0x0
    80003630:	f40080e7          	jalr	-192(ra) # 8000356c <_ZN6Buffer6getCntEv>
    80003634:	02a05c63          	blez	a0,8000366c <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80003638:	0084b783          	ld	a5,8(s1)
    8000363c:	0104a703          	lw	a4,16(s1)
    80003640:	00271713          	slli	a4,a4,0x2
    80003644:	00e787b3          	add	a5,a5,a4
        __putc(ch);
    80003648:	0007c503          	lbu	a0,0(a5)
    8000364c:	00002097          	auipc	ra,0x2
    80003650:	374080e7          	jalr	884(ra) # 800059c0 <__putc>
        head = (head + 1) % cap;
    80003654:	0104a783          	lw	a5,16(s1)
    80003658:	0017879b          	addiw	a5,a5,1
    8000365c:	0004a703          	lw	a4,0(s1)
    80003660:	02e7e7bb          	remw	a5,a5,a4
    80003664:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    80003668:	fc1ff06f          	j	80003628 <_ZN6BufferD1Ev+0x34>
    __putc('!');
    8000366c:	02100513          	li	a0,33
    80003670:	00002097          	auipc	ra,0x2
    80003674:	350080e7          	jalr	848(ra) # 800059c0 <__putc>
    __putc('\n');
    80003678:	00a00513          	li	a0,10
    8000367c:	00002097          	auipc	ra,0x2
    80003680:	344080e7          	jalr	836(ra) # 800059c0 <__putc>
    __mem_free(buffer);
    80003684:	0084b503          	ld	a0,8(s1)
    80003688:	00002097          	auipc	ra,0x2
    8000368c:	114080e7          	jalr	276(ra) # 8000579c <__mem_free>
    sem_close(itemAvailable);
    80003690:	0204b503          	ld	a0,32(s1)
    80003694:	ffffe097          	auipc	ra,0xffffe
    80003698:	ba8080e7          	jalr	-1112(ra) # 8000123c <_Z9sem_closeP10SemaphoreK>
    sem_close(spaceAvailable);
    8000369c:	0184b503          	ld	a0,24(s1)
    800036a0:	ffffe097          	auipc	ra,0xffffe
    800036a4:	b9c080e7          	jalr	-1124(ra) # 8000123c <_Z9sem_closeP10SemaphoreK>
    sem_close(mutexTail);
    800036a8:	0304b503          	ld	a0,48(s1)
    800036ac:	ffffe097          	auipc	ra,0xffffe
    800036b0:	b90080e7          	jalr	-1136(ra) # 8000123c <_Z9sem_closeP10SemaphoreK>
    sem_close(mutexHead);
    800036b4:	0284b503          	ld	a0,40(s1)
    800036b8:	ffffe097          	auipc	ra,0xffffe
    800036bc:	b84080e7          	jalr	-1148(ra) # 8000123c <_Z9sem_closeP10SemaphoreK>
}
    800036c0:	01813083          	ld	ra,24(sp)
    800036c4:	01013403          	ld	s0,16(sp)
    800036c8:	00813483          	ld	s1,8(sp)
    800036cc:	02010113          	addi	sp,sp,32
    800036d0:	00008067          	ret

00000000800036d4 <start>:
    800036d4:	ff010113          	addi	sp,sp,-16
    800036d8:	00813423          	sd	s0,8(sp)
    800036dc:	01010413          	addi	s0,sp,16
    800036e0:	300027f3          	csrr	a5,mstatus
    800036e4:	ffffe737          	lui	a4,0xffffe
    800036e8:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff5f5f>
    800036ec:	00e7f7b3          	and	a5,a5,a4
    800036f0:	00001737          	lui	a4,0x1
    800036f4:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    800036f8:	00e7e7b3          	or	a5,a5,a4
    800036fc:	30079073          	csrw	mstatus,a5
    80003700:	00000797          	auipc	a5,0x0
    80003704:	16078793          	addi	a5,a5,352 # 80003860 <system_main>
    80003708:	34179073          	csrw	mepc,a5
    8000370c:	00000793          	li	a5,0
    80003710:	18079073          	csrw	satp,a5
    80003714:	000107b7          	lui	a5,0x10
    80003718:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    8000371c:	30279073          	csrw	medeleg,a5
    80003720:	30379073          	csrw	mideleg,a5
    80003724:	104027f3          	csrr	a5,sie
    80003728:	2227e793          	ori	a5,a5,546
    8000372c:	10479073          	csrw	sie,a5
    80003730:	fff00793          	li	a5,-1
    80003734:	00a7d793          	srli	a5,a5,0xa
    80003738:	3b079073          	csrw	pmpaddr0,a5
    8000373c:	00f00793          	li	a5,15
    80003740:	3a079073          	csrw	pmpcfg0,a5
    80003744:	f14027f3          	csrr	a5,mhartid
    80003748:	0200c737          	lui	a4,0x200c
    8000374c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80003750:	0007869b          	sext.w	a3,a5
    80003754:	00269713          	slli	a4,a3,0x2
    80003758:	000f4637          	lui	a2,0xf4
    8000375c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80003760:	00d70733          	add	a4,a4,a3
    80003764:	0037979b          	slliw	a5,a5,0x3
    80003768:	020046b7          	lui	a3,0x2004
    8000376c:	00d787b3          	add	a5,a5,a3
    80003770:	00c585b3          	add	a1,a1,a2
    80003774:	00371693          	slli	a3,a4,0x3
    80003778:	00004717          	auipc	a4,0x4
    8000377c:	eb870713          	addi	a4,a4,-328 # 80007630 <timer_scratch>
    80003780:	00b7b023          	sd	a1,0(a5)
    80003784:	00d70733          	add	a4,a4,a3
    80003788:	00f73c23          	sd	a5,24(a4)
    8000378c:	02c73023          	sd	a2,32(a4)
    80003790:	34071073          	csrw	mscratch,a4
    80003794:	00000797          	auipc	a5,0x0
    80003798:	6ec78793          	addi	a5,a5,1772 # 80003e80 <timervec>
    8000379c:	30579073          	csrw	mtvec,a5
    800037a0:	300027f3          	csrr	a5,mstatus
    800037a4:	0087e793          	ori	a5,a5,8
    800037a8:	30079073          	csrw	mstatus,a5
    800037ac:	304027f3          	csrr	a5,mie
    800037b0:	0807e793          	ori	a5,a5,128
    800037b4:	30479073          	csrw	mie,a5
    800037b8:	f14027f3          	csrr	a5,mhartid
    800037bc:	0007879b          	sext.w	a5,a5
    800037c0:	00078213          	mv	tp,a5
    800037c4:	30200073          	mret
    800037c8:	00813403          	ld	s0,8(sp)
    800037cc:	01010113          	addi	sp,sp,16
    800037d0:	00008067          	ret

00000000800037d4 <timerinit>:
    800037d4:	ff010113          	addi	sp,sp,-16
    800037d8:	00813423          	sd	s0,8(sp)
    800037dc:	01010413          	addi	s0,sp,16
    800037e0:	f14027f3          	csrr	a5,mhartid
    800037e4:	0200c737          	lui	a4,0x200c
    800037e8:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800037ec:	0007869b          	sext.w	a3,a5
    800037f0:	00269713          	slli	a4,a3,0x2
    800037f4:	000f4637          	lui	a2,0xf4
    800037f8:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800037fc:	00d70733          	add	a4,a4,a3
    80003800:	0037979b          	slliw	a5,a5,0x3
    80003804:	020046b7          	lui	a3,0x2004
    80003808:	00d787b3          	add	a5,a5,a3
    8000380c:	00c585b3          	add	a1,a1,a2
    80003810:	00371693          	slli	a3,a4,0x3
    80003814:	00004717          	auipc	a4,0x4
    80003818:	e1c70713          	addi	a4,a4,-484 # 80007630 <timer_scratch>
    8000381c:	00b7b023          	sd	a1,0(a5)
    80003820:	00d70733          	add	a4,a4,a3
    80003824:	00f73c23          	sd	a5,24(a4)
    80003828:	02c73023          	sd	a2,32(a4)
    8000382c:	34071073          	csrw	mscratch,a4
    80003830:	00000797          	auipc	a5,0x0
    80003834:	65078793          	addi	a5,a5,1616 # 80003e80 <timervec>
    80003838:	30579073          	csrw	mtvec,a5
    8000383c:	300027f3          	csrr	a5,mstatus
    80003840:	0087e793          	ori	a5,a5,8
    80003844:	30079073          	csrw	mstatus,a5
    80003848:	304027f3          	csrr	a5,mie
    8000384c:	0807e793          	ori	a5,a5,128
    80003850:	30479073          	csrw	mie,a5
    80003854:	00813403          	ld	s0,8(sp)
    80003858:	01010113          	addi	sp,sp,16
    8000385c:	00008067          	ret

0000000080003860 <system_main>:
    80003860:	fe010113          	addi	sp,sp,-32
    80003864:	00813823          	sd	s0,16(sp)
    80003868:	00913423          	sd	s1,8(sp)
    8000386c:	00113c23          	sd	ra,24(sp)
    80003870:	02010413          	addi	s0,sp,32
    80003874:	00000097          	auipc	ra,0x0
    80003878:	0c4080e7          	jalr	196(ra) # 80003938 <cpuid>
    8000387c:	00004497          	auipc	s1,0x4
    80003880:	d4448493          	addi	s1,s1,-700 # 800075c0 <started>
    80003884:	02050263          	beqz	a0,800038a8 <system_main+0x48>
    80003888:	0004a783          	lw	a5,0(s1)
    8000388c:	0007879b          	sext.w	a5,a5
    80003890:	fe078ce3          	beqz	a5,80003888 <system_main+0x28>
    80003894:	0ff0000f          	fence
    80003898:	00003517          	auipc	a0,0x3
    8000389c:	94050513          	addi	a0,a0,-1728 # 800061d8 <kvmincrease+0x6f8>
    800038a0:	00001097          	auipc	ra,0x1
    800038a4:	a7c080e7          	jalr	-1412(ra) # 8000431c <panic>
    800038a8:	00001097          	auipc	ra,0x1
    800038ac:	9d0080e7          	jalr	-1584(ra) # 80004278 <consoleinit>
    800038b0:	00001097          	auipc	ra,0x1
    800038b4:	15c080e7          	jalr	348(ra) # 80004a0c <printfinit>
    800038b8:	00003517          	auipc	a0,0x3
    800038bc:	84050513          	addi	a0,a0,-1984 # 800060f8 <kvmincrease+0x618>
    800038c0:	00001097          	auipc	ra,0x1
    800038c4:	ab8080e7          	jalr	-1352(ra) # 80004378 <__printf>
    800038c8:	00003517          	auipc	a0,0x3
    800038cc:	8e050513          	addi	a0,a0,-1824 # 800061a8 <kvmincrease+0x6c8>
    800038d0:	00001097          	auipc	ra,0x1
    800038d4:	aa8080e7          	jalr	-1368(ra) # 80004378 <__printf>
    800038d8:	00003517          	auipc	a0,0x3
    800038dc:	82050513          	addi	a0,a0,-2016 # 800060f8 <kvmincrease+0x618>
    800038e0:	00001097          	auipc	ra,0x1
    800038e4:	a98080e7          	jalr	-1384(ra) # 80004378 <__printf>
    800038e8:	00001097          	auipc	ra,0x1
    800038ec:	4b0080e7          	jalr	1200(ra) # 80004d98 <kinit>
    800038f0:	00000097          	auipc	ra,0x0
    800038f4:	148080e7          	jalr	328(ra) # 80003a38 <trapinit>
    800038f8:	00000097          	auipc	ra,0x0
    800038fc:	16c080e7          	jalr	364(ra) # 80003a64 <trapinithart>
    80003900:	00000097          	auipc	ra,0x0
    80003904:	5c0080e7          	jalr	1472(ra) # 80003ec0 <plicinit>
    80003908:	00000097          	auipc	ra,0x0
    8000390c:	5e0080e7          	jalr	1504(ra) # 80003ee8 <plicinithart>
    80003910:	00000097          	auipc	ra,0x0
    80003914:	078080e7          	jalr	120(ra) # 80003988 <userinit>
    80003918:	0ff0000f          	fence
    8000391c:	00100793          	li	a5,1
    80003920:	00003517          	auipc	a0,0x3
    80003924:	8a050513          	addi	a0,a0,-1888 # 800061c0 <kvmincrease+0x6e0>
    80003928:	00f4a023          	sw	a5,0(s1)
    8000392c:	00001097          	auipc	ra,0x1
    80003930:	a4c080e7          	jalr	-1460(ra) # 80004378 <__printf>
    80003934:	0000006f          	j	80003934 <system_main+0xd4>

0000000080003938 <cpuid>:
    80003938:	ff010113          	addi	sp,sp,-16
    8000393c:	00813423          	sd	s0,8(sp)
    80003940:	01010413          	addi	s0,sp,16
    80003944:	00020513          	mv	a0,tp
    80003948:	00813403          	ld	s0,8(sp)
    8000394c:	0005051b          	sext.w	a0,a0
    80003950:	01010113          	addi	sp,sp,16
    80003954:	00008067          	ret

0000000080003958 <mycpu>:
    80003958:	ff010113          	addi	sp,sp,-16
    8000395c:	00813423          	sd	s0,8(sp)
    80003960:	01010413          	addi	s0,sp,16
    80003964:	00020793          	mv	a5,tp
    80003968:	00813403          	ld	s0,8(sp)
    8000396c:	0007879b          	sext.w	a5,a5
    80003970:	00779793          	slli	a5,a5,0x7
    80003974:	00005517          	auipc	a0,0x5
    80003978:	cec50513          	addi	a0,a0,-788 # 80008660 <cpus>
    8000397c:	00f50533          	add	a0,a0,a5
    80003980:	01010113          	addi	sp,sp,16
    80003984:	00008067          	ret

0000000080003988 <userinit>:
    80003988:	ff010113          	addi	sp,sp,-16
    8000398c:	00813423          	sd	s0,8(sp)
    80003990:	01010413          	addi	s0,sp,16
    80003994:	00813403          	ld	s0,8(sp)
    80003998:	01010113          	addi	sp,sp,16
    8000399c:	ffffe317          	auipc	t1,0xffffe
    800039a0:	ff030067          	jr	-16(t1) # 8000198c <main>

00000000800039a4 <either_copyout>:
    800039a4:	ff010113          	addi	sp,sp,-16
    800039a8:	00813023          	sd	s0,0(sp)
    800039ac:	00113423          	sd	ra,8(sp)
    800039b0:	01010413          	addi	s0,sp,16
    800039b4:	02051663          	bnez	a0,800039e0 <either_copyout+0x3c>
    800039b8:	00058513          	mv	a0,a1
    800039bc:	00060593          	mv	a1,a2
    800039c0:	0006861b          	sext.w	a2,a3
    800039c4:	00002097          	auipc	ra,0x2
    800039c8:	c60080e7          	jalr	-928(ra) # 80005624 <__memmove>
    800039cc:	00813083          	ld	ra,8(sp)
    800039d0:	00013403          	ld	s0,0(sp)
    800039d4:	00000513          	li	a0,0
    800039d8:	01010113          	addi	sp,sp,16
    800039dc:	00008067          	ret
    800039e0:	00003517          	auipc	a0,0x3
    800039e4:	82050513          	addi	a0,a0,-2016 # 80006200 <kvmincrease+0x720>
    800039e8:	00001097          	auipc	ra,0x1
    800039ec:	934080e7          	jalr	-1740(ra) # 8000431c <panic>

00000000800039f0 <either_copyin>:
    800039f0:	ff010113          	addi	sp,sp,-16
    800039f4:	00813023          	sd	s0,0(sp)
    800039f8:	00113423          	sd	ra,8(sp)
    800039fc:	01010413          	addi	s0,sp,16
    80003a00:	02059463          	bnez	a1,80003a28 <either_copyin+0x38>
    80003a04:	00060593          	mv	a1,a2
    80003a08:	0006861b          	sext.w	a2,a3
    80003a0c:	00002097          	auipc	ra,0x2
    80003a10:	c18080e7          	jalr	-1000(ra) # 80005624 <__memmove>
    80003a14:	00813083          	ld	ra,8(sp)
    80003a18:	00013403          	ld	s0,0(sp)
    80003a1c:	00000513          	li	a0,0
    80003a20:	01010113          	addi	sp,sp,16
    80003a24:	00008067          	ret
    80003a28:	00003517          	auipc	a0,0x3
    80003a2c:	80050513          	addi	a0,a0,-2048 # 80006228 <kvmincrease+0x748>
    80003a30:	00001097          	auipc	ra,0x1
    80003a34:	8ec080e7          	jalr	-1812(ra) # 8000431c <panic>

0000000080003a38 <trapinit>:
    80003a38:	ff010113          	addi	sp,sp,-16
    80003a3c:	00813423          	sd	s0,8(sp)
    80003a40:	01010413          	addi	s0,sp,16
    80003a44:	00813403          	ld	s0,8(sp)
    80003a48:	00003597          	auipc	a1,0x3
    80003a4c:	80858593          	addi	a1,a1,-2040 # 80006250 <kvmincrease+0x770>
    80003a50:	00005517          	auipc	a0,0x5
    80003a54:	c9050513          	addi	a0,a0,-880 # 800086e0 <tickslock>
    80003a58:	01010113          	addi	sp,sp,16
    80003a5c:	00001317          	auipc	t1,0x1
    80003a60:	5cc30067          	jr	1484(t1) # 80005028 <initlock>

0000000080003a64 <trapinithart>:
    80003a64:	ff010113          	addi	sp,sp,-16
    80003a68:	00813423          	sd	s0,8(sp)
    80003a6c:	01010413          	addi	s0,sp,16
    80003a70:	00000797          	auipc	a5,0x0
    80003a74:	30078793          	addi	a5,a5,768 # 80003d70 <kernelvec>
    80003a78:	10579073          	csrw	stvec,a5
    80003a7c:	00813403          	ld	s0,8(sp)
    80003a80:	01010113          	addi	sp,sp,16
    80003a84:	00008067          	ret

0000000080003a88 <usertrap>:
    80003a88:	ff010113          	addi	sp,sp,-16
    80003a8c:	00813423          	sd	s0,8(sp)
    80003a90:	01010413          	addi	s0,sp,16
    80003a94:	00813403          	ld	s0,8(sp)
    80003a98:	01010113          	addi	sp,sp,16
    80003a9c:	00008067          	ret

0000000080003aa0 <usertrapret>:
    80003aa0:	ff010113          	addi	sp,sp,-16
    80003aa4:	00813423          	sd	s0,8(sp)
    80003aa8:	01010413          	addi	s0,sp,16
    80003aac:	00813403          	ld	s0,8(sp)
    80003ab0:	01010113          	addi	sp,sp,16
    80003ab4:	00008067          	ret

0000000080003ab8 <kerneltrap>:
    80003ab8:	fe010113          	addi	sp,sp,-32
    80003abc:	00813823          	sd	s0,16(sp)
    80003ac0:	00113c23          	sd	ra,24(sp)
    80003ac4:	00913423          	sd	s1,8(sp)
    80003ac8:	02010413          	addi	s0,sp,32
    80003acc:	142025f3          	csrr	a1,scause
    80003ad0:	100027f3          	csrr	a5,sstatus
    80003ad4:	0027f793          	andi	a5,a5,2
    80003ad8:	10079c63          	bnez	a5,80003bf0 <kerneltrap+0x138>
    80003adc:	142027f3          	csrr	a5,scause
    80003ae0:	0207ce63          	bltz	a5,80003b1c <kerneltrap+0x64>
    80003ae4:	00002517          	auipc	a0,0x2
    80003ae8:	7b450513          	addi	a0,a0,1972 # 80006298 <kvmincrease+0x7b8>
    80003aec:	00001097          	auipc	ra,0x1
    80003af0:	88c080e7          	jalr	-1908(ra) # 80004378 <__printf>
    80003af4:	141025f3          	csrr	a1,sepc
    80003af8:	14302673          	csrr	a2,stval
    80003afc:	00002517          	auipc	a0,0x2
    80003b00:	7ac50513          	addi	a0,a0,1964 # 800062a8 <kvmincrease+0x7c8>
    80003b04:	00001097          	auipc	ra,0x1
    80003b08:	874080e7          	jalr	-1932(ra) # 80004378 <__printf>
    80003b0c:	00002517          	auipc	a0,0x2
    80003b10:	7b450513          	addi	a0,a0,1972 # 800062c0 <kvmincrease+0x7e0>
    80003b14:	00001097          	auipc	ra,0x1
    80003b18:	808080e7          	jalr	-2040(ra) # 8000431c <panic>
    80003b1c:	0ff7f713          	andi	a4,a5,255
    80003b20:	00900693          	li	a3,9
    80003b24:	04d70063          	beq	a4,a3,80003b64 <kerneltrap+0xac>
    80003b28:	fff00713          	li	a4,-1
    80003b2c:	03f71713          	slli	a4,a4,0x3f
    80003b30:	00170713          	addi	a4,a4,1
    80003b34:	fae798e3          	bne	a5,a4,80003ae4 <kerneltrap+0x2c>
    80003b38:	00000097          	auipc	ra,0x0
    80003b3c:	e00080e7          	jalr	-512(ra) # 80003938 <cpuid>
    80003b40:	06050663          	beqz	a0,80003bac <kerneltrap+0xf4>
    80003b44:	144027f3          	csrr	a5,sip
    80003b48:	ffd7f793          	andi	a5,a5,-3
    80003b4c:	14479073          	csrw	sip,a5
    80003b50:	01813083          	ld	ra,24(sp)
    80003b54:	01013403          	ld	s0,16(sp)
    80003b58:	00813483          	ld	s1,8(sp)
    80003b5c:	02010113          	addi	sp,sp,32
    80003b60:	00008067          	ret
    80003b64:	00000097          	auipc	ra,0x0
    80003b68:	3d0080e7          	jalr	976(ra) # 80003f34 <plic_claim>
    80003b6c:	00a00793          	li	a5,10
    80003b70:	00050493          	mv	s1,a0
    80003b74:	06f50863          	beq	a0,a5,80003be4 <kerneltrap+0x12c>
    80003b78:	fc050ce3          	beqz	a0,80003b50 <kerneltrap+0x98>
    80003b7c:	00050593          	mv	a1,a0
    80003b80:	00002517          	auipc	a0,0x2
    80003b84:	6f850513          	addi	a0,a0,1784 # 80006278 <kvmincrease+0x798>
    80003b88:	00000097          	auipc	ra,0x0
    80003b8c:	7f0080e7          	jalr	2032(ra) # 80004378 <__printf>
    80003b90:	01013403          	ld	s0,16(sp)
    80003b94:	01813083          	ld	ra,24(sp)
    80003b98:	00048513          	mv	a0,s1
    80003b9c:	00813483          	ld	s1,8(sp)
    80003ba0:	02010113          	addi	sp,sp,32
    80003ba4:	00000317          	auipc	t1,0x0
    80003ba8:	3c830067          	jr	968(t1) # 80003f6c <plic_complete>
    80003bac:	00005517          	auipc	a0,0x5
    80003bb0:	b3450513          	addi	a0,a0,-1228 # 800086e0 <tickslock>
    80003bb4:	00001097          	auipc	ra,0x1
    80003bb8:	498080e7          	jalr	1176(ra) # 8000504c <acquire>
    80003bbc:	00004717          	auipc	a4,0x4
    80003bc0:	a0870713          	addi	a4,a4,-1528 # 800075c4 <ticks>
    80003bc4:	00072783          	lw	a5,0(a4)
    80003bc8:	00005517          	auipc	a0,0x5
    80003bcc:	b1850513          	addi	a0,a0,-1256 # 800086e0 <tickslock>
    80003bd0:	0017879b          	addiw	a5,a5,1
    80003bd4:	00f72023          	sw	a5,0(a4)
    80003bd8:	00001097          	auipc	ra,0x1
    80003bdc:	540080e7          	jalr	1344(ra) # 80005118 <release>
    80003be0:	f65ff06f          	j	80003b44 <kerneltrap+0x8c>
    80003be4:	00001097          	auipc	ra,0x1
    80003be8:	09c080e7          	jalr	156(ra) # 80004c80 <uartintr>
    80003bec:	fa5ff06f          	j	80003b90 <kerneltrap+0xd8>
    80003bf0:	00002517          	auipc	a0,0x2
    80003bf4:	66850513          	addi	a0,a0,1640 # 80006258 <kvmincrease+0x778>
    80003bf8:	00000097          	auipc	ra,0x0
    80003bfc:	724080e7          	jalr	1828(ra) # 8000431c <panic>

0000000080003c00 <clockintr>:
    80003c00:	fe010113          	addi	sp,sp,-32
    80003c04:	00813823          	sd	s0,16(sp)
    80003c08:	00913423          	sd	s1,8(sp)
    80003c0c:	00113c23          	sd	ra,24(sp)
    80003c10:	02010413          	addi	s0,sp,32
    80003c14:	00005497          	auipc	s1,0x5
    80003c18:	acc48493          	addi	s1,s1,-1332 # 800086e0 <tickslock>
    80003c1c:	00048513          	mv	a0,s1
    80003c20:	00001097          	auipc	ra,0x1
    80003c24:	42c080e7          	jalr	1068(ra) # 8000504c <acquire>
    80003c28:	00004717          	auipc	a4,0x4
    80003c2c:	99c70713          	addi	a4,a4,-1636 # 800075c4 <ticks>
    80003c30:	00072783          	lw	a5,0(a4)
    80003c34:	01013403          	ld	s0,16(sp)
    80003c38:	01813083          	ld	ra,24(sp)
    80003c3c:	00048513          	mv	a0,s1
    80003c40:	0017879b          	addiw	a5,a5,1
    80003c44:	00813483          	ld	s1,8(sp)
    80003c48:	00f72023          	sw	a5,0(a4)
    80003c4c:	02010113          	addi	sp,sp,32
    80003c50:	00001317          	auipc	t1,0x1
    80003c54:	4c830067          	jr	1224(t1) # 80005118 <release>

0000000080003c58 <devintr>:
    80003c58:	142027f3          	csrr	a5,scause
    80003c5c:	00000513          	li	a0,0
    80003c60:	0007c463          	bltz	a5,80003c68 <devintr+0x10>
    80003c64:	00008067          	ret
    80003c68:	fe010113          	addi	sp,sp,-32
    80003c6c:	00813823          	sd	s0,16(sp)
    80003c70:	00113c23          	sd	ra,24(sp)
    80003c74:	00913423          	sd	s1,8(sp)
    80003c78:	02010413          	addi	s0,sp,32
    80003c7c:	0ff7f713          	andi	a4,a5,255
    80003c80:	00900693          	li	a3,9
    80003c84:	04d70c63          	beq	a4,a3,80003cdc <devintr+0x84>
    80003c88:	fff00713          	li	a4,-1
    80003c8c:	03f71713          	slli	a4,a4,0x3f
    80003c90:	00170713          	addi	a4,a4,1
    80003c94:	00e78c63          	beq	a5,a4,80003cac <devintr+0x54>
    80003c98:	01813083          	ld	ra,24(sp)
    80003c9c:	01013403          	ld	s0,16(sp)
    80003ca0:	00813483          	ld	s1,8(sp)
    80003ca4:	02010113          	addi	sp,sp,32
    80003ca8:	00008067          	ret
    80003cac:	00000097          	auipc	ra,0x0
    80003cb0:	c8c080e7          	jalr	-884(ra) # 80003938 <cpuid>
    80003cb4:	06050663          	beqz	a0,80003d20 <devintr+0xc8>
    80003cb8:	144027f3          	csrr	a5,sip
    80003cbc:	ffd7f793          	andi	a5,a5,-3
    80003cc0:	14479073          	csrw	sip,a5
    80003cc4:	01813083          	ld	ra,24(sp)
    80003cc8:	01013403          	ld	s0,16(sp)
    80003ccc:	00813483          	ld	s1,8(sp)
    80003cd0:	00200513          	li	a0,2
    80003cd4:	02010113          	addi	sp,sp,32
    80003cd8:	00008067          	ret
    80003cdc:	00000097          	auipc	ra,0x0
    80003ce0:	258080e7          	jalr	600(ra) # 80003f34 <plic_claim>
    80003ce4:	00a00793          	li	a5,10
    80003ce8:	00050493          	mv	s1,a0
    80003cec:	06f50663          	beq	a0,a5,80003d58 <devintr+0x100>
    80003cf0:	00100513          	li	a0,1
    80003cf4:	fa0482e3          	beqz	s1,80003c98 <devintr+0x40>
    80003cf8:	00048593          	mv	a1,s1
    80003cfc:	00002517          	auipc	a0,0x2
    80003d00:	57c50513          	addi	a0,a0,1404 # 80006278 <kvmincrease+0x798>
    80003d04:	00000097          	auipc	ra,0x0
    80003d08:	674080e7          	jalr	1652(ra) # 80004378 <__printf>
    80003d0c:	00048513          	mv	a0,s1
    80003d10:	00000097          	auipc	ra,0x0
    80003d14:	25c080e7          	jalr	604(ra) # 80003f6c <plic_complete>
    80003d18:	00100513          	li	a0,1
    80003d1c:	f7dff06f          	j	80003c98 <devintr+0x40>
    80003d20:	00005517          	auipc	a0,0x5
    80003d24:	9c050513          	addi	a0,a0,-1600 # 800086e0 <tickslock>
    80003d28:	00001097          	auipc	ra,0x1
    80003d2c:	324080e7          	jalr	804(ra) # 8000504c <acquire>
    80003d30:	00004717          	auipc	a4,0x4
    80003d34:	89470713          	addi	a4,a4,-1900 # 800075c4 <ticks>
    80003d38:	00072783          	lw	a5,0(a4)
    80003d3c:	00005517          	auipc	a0,0x5
    80003d40:	9a450513          	addi	a0,a0,-1628 # 800086e0 <tickslock>
    80003d44:	0017879b          	addiw	a5,a5,1
    80003d48:	00f72023          	sw	a5,0(a4)
    80003d4c:	00001097          	auipc	ra,0x1
    80003d50:	3cc080e7          	jalr	972(ra) # 80005118 <release>
    80003d54:	f65ff06f          	j	80003cb8 <devintr+0x60>
    80003d58:	00001097          	auipc	ra,0x1
    80003d5c:	f28080e7          	jalr	-216(ra) # 80004c80 <uartintr>
    80003d60:	fadff06f          	j	80003d0c <devintr+0xb4>
	...

0000000080003d70 <kernelvec>:
    80003d70:	f0010113          	addi	sp,sp,-256
    80003d74:	00113023          	sd	ra,0(sp)
    80003d78:	00213423          	sd	sp,8(sp)
    80003d7c:	00313823          	sd	gp,16(sp)
    80003d80:	00413c23          	sd	tp,24(sp)
    80003d84:	02513023          	sd	t0,32(sp)
    80003d88:	02613423          	sd	t1,40(sp)
    80003d8c:	02713823          	sd	t2,48(sp)
    80003d90:	02813c23          	sd	s0,56(sp)
    80003d94:	04913023          	sd	s1,64(sp)
    80003d98:	04a13423          	sd	a0,72(sp)
    80003d9c:	04b13823          	sd	a1,80(sp)
    80003da0:	04c13c23          	sd	a2,88(sp)
    80003da4:	06d13023          	sd	a3,96(sp)
    80003da8:	06e13423          	sd	a4,104(sp)
    80003dac:	06f13823          	sd	a5,112(sp)
    80003db0:	07013c23          	sd	a6,120(sp)
    80003db4:	09113023          	sd	a7,128(sp)
    80003db8:	09213423          	sd	s2,136(sp)
    80003dbc:	09313823          	sd	s3,144(sp)
    80003dc0:	09413c23          	sd	s4,152(sp)
    80003dc4:	0b513023          	sd	s5,160(sp)
    80003dc8:	0b613423          	sd	s6,168(sp)
    80003dcc:	0b713823          	sd	s7,176(sp)
    80003dd0:	0b813c23          	sd	s8,184(sp)
    80003dd4:	0d913023          	sd	s9,192(sp)
    80003dd8:	0da13423          	sd	s10,200(sp)
    80003ddc:	0db13823          	sd	s11,208(sp)
    80003de0:	0dc13c23          	sd	t3,216(sp)
    80003de4:	0fd13023          	sd	t4,224(sp)
    80003de8:	0fe13423          	sd	t5,232(sp)
    80003dec:	0ff13823          	sd	t6,240(sp)
    80003df0:	cc9ff0ef          	jal	ra,80003ab8 <kerneltrap>
    80003df4:	00013083          	ld	ra,0(sp)
    80003df8:	00813103          	ld	sp,8(sp)
    80003dfc:	01013183          	ld	gp,16(sp)
    80003e00:	02013283          	ld	t0,32(sp)
    80003e04:	02813303          	ld	t1,40(sp)
    80003e08:	03013383          	ld	t2,48(sp)
    80003e0c:	03813403          	ld	s0,56(sp)
    80003e10:	04013483          	ld	s1,64(sp)
    80003e14:	04813503          	ld	a0,72(sp)
    80003e18:	05013583          	ld	a1,80(sp)
    80003e1c:	05813603          	ld	a2,88(sp)
    80003e20:	06013683          	ld	a3,96(sp)
    80003e24:	06813703          	ld	a4,104(sp)
    80003e28:	07013783          	ld	a5,112(sp)
    80003e2c:	07813803          	ld	a6,120(sp)
    80003e30:	08013883          	ld	a7,128(sp)
    80003e34:	08813903          	ld	s2,136(sp)
    80003e38:	09013983          	ld	s3,144(sp)
    80003e3c:	09813a03          	ld	s4,152(sp)
    80003e40:	0a013a83          	ld	s5,160(sp)
    80003e44:	0a813b03          	ld	s6,168(sp)
    80003e48:	0b013b83          	ld	s7,176(sp)
    80003e4c:	0b813c03          	ld	s8,184(sp)
    80003e50:	0c013c83          	ld	s9,192(sp)
    80003e54:	0c813d03          	ld	s10,200(sp)
    80003e58:	0d013d83          	ld	s11,208(sp)
    80003e5c:	0d813e03          	ld	t3,216(sp)
    80003e60:	0e013e83          	ld	t4,224(sp)
    80003e64:	0e813f03          	ld	t5,232(sp)
    80003e68:	0f013f83          	ld	t6,240(sp)
    80003e6c:	10010113          	addi	sp,sp,256
    80003e70:	10200073          	sret
    80003e74:	00000013          	nop
    80003e78:	00000013          	nop
    80003e7c:	00000013          	nop

0000000080003e80 <timervec>:
    80003e80:	34051573          	csrrw	a0,mscratch,a0
    80003e84:	00b53023          	sd	a1,0(a0)
    80003e88:	00c53423          	sd	a2,8(a0)
    80003e8c:	00d53823          	sd	a3,16(a0)
    80003e90:	01853583          	ld	a1,24(a0)
    80003e94:	02053603          	ld	a2,32(a0)
    80003e98:	0005b683          	ld	a3,0(a1)
    80003e9c:	00c686b3          	add	a3,a3,a2
    80003ea0:	00d5b023          	sd	a3,0(a1)
    80003ea4:	00200593          	li	a1,2
    80003ea8:	14459073          	csrw	sip,a1
    80003eac:	01053683          	ld	a3,16(a0)
    80003eb0:	00853603          	ld	a2,8(a0)
    80003eb4:	00053583          	ld	a1,0(a0)
    80003eb8:	34051573          	csrrw	a0,mscratch,a0
    80003ebc:	30200073          	mret

0000000080003ec0 <plicinit>:
    80003ec0:	ff010113          	addi	sp,sp,-16
    80003ec4:	00813423          	sd	s0,8(sp)
    80003ec8:	01010413          	addi	s0,sp,16
    80003ecc:	00813403          	ld	s0,8(sp)
    80003ed0:	0c0007b7          	lui	a5,0xc000
    80003ed4:	00100713          	li	a4,1
    80003ed8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    80003edc:	00e7a223          	sw	a4,4(a5)
    80003ee0:	01010113          	addi	sp,sp,16
    80003ee4:	00008067          	ret

0000000080003ee8 <plicinithart>:
    80003ee8:	ff010113          	addi	sp,sp,-16
    80003eec:	00813023          	sd	s0,0(sp)
    80003ef0:	00113423          	sd	ra,8(sp)
    80003ef4:	01010413          	addi	s0,sp,16
    80003ef8:	00000097          	auipc	ra,0x0
    80003efc:	a40080e7          	jalr	-1472(ra) # 80003938 <cpuid>
    80003f00:	0085171b          	slliw	a4,a0,0x8
    80003f04:	0c0027b7          	lui	a5,0xc002
    80003f08:	00e787b3          	add	a5,a5,a4
    80003f0c:	40200713          	li	a4,1026
    80003f10:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80003f14:	00813083          	ld	ra,8(sp)
    80003f18:	00013403          	ld	s0,0(sp)
    80003f1c:	00d5151b          	slliw	a0,a0,0xd
    80003f20:	0c2017b7          	lui	a5,0xc201
    80003f24:	00a78533          	add	a0,a5,a0
    80003f28:	00052023          	sw	zero,0(a0)
    80003f2c:	01010113          	addi	sp,sp,16
    80003f30:	00008067          	ret

0000000080003f34 <plic_claim>:
    80003f34:	ff010113          	addi	sp,sp,-16
    80003f38:	00813023          	sd	s0,0(sp)
    80003f3c:	00113423          	sd	ra,8(sp)
    80003f40:	01010413          	addi	s0,sp,16
    80003f44:	00000097          	auipc	ra,0x0
    80003f48:	9f4080e7          	jalr	-1548(ra) # 80003938 <cpuid>
    80003f4c:	00813083          	ld	ra,8(sp)
    80003f50:	00013403          	ld	s0,0(sp)
    80003f54:	00d5151b          	slliw	a0,a0,0xd
    80003f58:	0c2017b7          	lui	a5,0xc201
    80003f5c:	00a78533          	add	a0,a5,a0
    80003f60:	00452503          	lw	a0,4(a0)
    80003f64:	01010113          	addi	sp,sp,16
    80003f68:	00008067          	ret

0000000080003f6c <plic_complete>:
    80003f6c:	fe010113          	addi	sp,sp,-32
    80003f70:	00813823          	sd	s0,16(sp)
    80003f74:	00913423          	sd	s1,8(sp)
    80003f78:	00113c23          	sd	ra,24(sp)
    80003f7c:	02010413          	addi	s0,sp,32
    80003f80:	00050493          	mv	s1,a0
    80003f84:	00000097          	auipc	ra,0x0
    80003f88:	9b4080e7          	jalr	-1612(ra) # 80003938 <cpuid>
    80003f8c:	01813083          	ld	ra,24(sp)
    80003f90:	01013403          	ld	s0,16(sp)
    80003f94:	00d5179b          	slliw	a5,a0,0xd
    80003f98:	0c201737          	lui	a4,0xc201
    80003f9c:	00f707b3          	add	a5,a4,a5
    80003fa0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80003fa4:	00813483          	ld	s1,8(sp)
    80003fa8:	02010113          	addi	sp,sp,32
    80003fac:	00008067          	ret

0000000080003fb0 <consolewrite>:
    80003fb0:	fb010113          	addi	sp,sp,-80
    80003fb4:	04813023          	sd	s0,64(sp)
    80003fb8:	04113423          	sd	ra,72(sp)
    80003fbc:	02913c23          	sd	s1,56(sp)
    80003fc0:	03213823          	sd	s2,48(sp)
    80003fc4:	03313423          	sd	s3,40(sp)
    80003fc8:	03413023          	sd	s4,32(sp)
    80003fcc:	01513c23          	sd	s5,24(sp)
    80003fd0:	05010413          	addi	s0,sp,80
    80003fd4:	06c05c63          	blez	a2,8000404c <consolewrite+0x9c>
    80003fd8:	00060993          	mv	s3,a2
    80003fdc:	00050a13          	mv	s4,a0
    80003fe0:	00058493          	mv	s1,a1
    80003fe4:	00000913          	li	s2,0
    80003fe8:	fff00a93          	li	s5,-1
    80003fec:	01c0006f          	j	80004008 <consolewrite+0x58>
    80003ff0:	fbf44503          	lbu	a0,-65(s0)
    80003ff4:	0019091b          	addiw	s2,s2,1
    80003ff8:	00148493          	addi	s1,s1,1
    80003ffc:	00001097          	auipc	ra,0x1
    80004000:	a9c080e7          	jalr	-1380(ra) # 80004a98 <uartputc>
    80004004:	03298063          	beq	s3,s2,80004024 <consolewrite+0x74>
    80004008:	00048613          	mv	a2,s1
    8000400c:	00100693          	li	a3,1
    80004010:	000a0593          	mv	a1,s4
    80004014:	fbf40513          	addi	a0,s0,-65
    80004018:	00000097          	auipc	ra,0x0
    8000401c:	9d8080e7          	jalr	-1576(ra) # 800039f0 <either_copyin>
    80004020:	fd5518e3          	bne	a0,s5,80003ff0 <consolewrite+0x40>
    80004024:	04813083          	ld	ra,72(sp)
    80004028:	04013403          	ld	s0,64(sp)
    8000402c:	03813483          	ld	s1,56(sp)
    80004030:	02813983          	ld	s3,40(sp)
    80004034:	02013a03          	ld	s4,32(sp)
    80004038:	01813a83          	ld	s5,24(sp)
    8000403c:	00090513          	mv	a0,s2
    80004040:	03013903          	ld	s2,48(sp)
    80004044:	05010113          	addi	sp,sp,80
    80004048:	00008067          	ret
    8000404c:	00000913          	li	s2,0
    80004050:	fd5ff06f          	j	80004024 <consolewrite+0x74>

0000000080004054 <consoleread>:
    80004054:	f9010113          	addi	sp,sp,-112
    80004058:	06813023          	sd	s0,96(sp)
    8000405c:	04913c23          	sd	s1,88(sp)
    80004060:	05213823          	sd	s2,80(sp)
    80004064:	05313423          	sd	s3,72(sp)
    80004068:	05413023          	sd	s4,64(sp)
    8000406c:	03513c23          	sd	s5,56(sp)
    80004070:	03613823          	sd	s6,48(sp)
    80004074:	03713423          	sd	s7,40(sp)
    80004078:	03813023          	sd	s8,32(sp)
    8000407c:	06113423          	sd	ra,104(sp)
    80004080:	01913c23          	sd	s9,24(sp)
    80004084:	07010413          	addi	s0,sp,112
    80004088:	00060b93          	mv	s7,a2
    8000408c:	00050913          	mv	s2,a0
    80004090:	00058c13          	mv	s8,a1
    80004094:	00060b1b          	sext.w	s6,a2
    80004098:	00004497          	auipc	s1,0x4
    8000409c:	67048493          	addi	s1,s1,1648 # 80008708 <cons>
    800040a0:	00400993          	li	s3,4
    800040a4:	fff00a13          	li	s4,-1
    800040a8:	00a00a93          	li	s5,10
    800040ac:	05705e63          	blez	s7,80004108 <consoleread+0xb4>
    800040b0:	09c4a703          	lw	a4,156(s1)
    800040b4:	0984a783          	lw	a5,152(s1)
    800040b8:	0007071b          	sext.w	a4,a4
    800040bc:	08e78463          	beq	a5,a4,80004144 <consoleread+0xf0>
    800040c0:	07f7f713          	andi	a4,a5,127
    800040c4:	00e48733          	add	a4,s1,a4
    800040c8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    800040cc:	0017869b          	addiw	a3,a5,1
    800040d0:	08d4ac23          	sw	a3,152(s1)
    800040d4:	00070c9b          	sext.w	s9,a4
    800040d8:	0b370663          	beq	a4,s3,80004184 <consoleread+0x130>
    800040dc:	00100693          	li	a3,1
    800040e0:	f9f40613          	addi	a2,s0,-97
    800040e4:	000c0593          	mv	a1,s8
    800040e8:	00090513          	mv	a0,s2
    800040ec:	f8e40fa3          	sb	a4,-97(s0)
    800040f0:	00000097          	auipc	ra,0x0
    800040f4:	8b4080e7          	jalr	-1868(ra) # 800039a4 <either_copyout>
    800040f8:	01450863          	beq	a0,s4,80004108 <consoleread+0xb4>
    800040fc:	001c0c13          	addi	s8,s8,1
    80004100:	fffb8b9b          	addiw	s7,s7,-1
    80004104:	fb5c94e3          	bne	s9,s5,800040ac <consoleread+0x58>
    80004108:	000b851b          	sext.w	a0,s7
    8000410c:	06813083          	ld	ra,104(sp)
    80004110:	06013403          	ld	s0,96(sp)
    80004114:	05813483          	ld	s1,88(sp)
    80004118:	05013903          	ld	s2,80(sp)
    8000411c:	04813983          	ld	s3,72(sp)
    80004120:	04013a03          	ld	s4,64(sp)
    80004124:	03813a83          	ld	s5,56(sp)
    80004128:	02813b83          	ld	s7,40(sp)
    8000412c:	02013c03          	ld	s8,32(sp)
    80004130:	01813c83          	ld	s9,24(sp)
    80004134:	40ab053b          	subw	a0,s6,a0
    80004138:	03013b03          	ld	s6,48(sp)
    8000413c:	07010113          	addi	sp,sp,112
    80004140:	00008067          	ret
    80004144:	00001097          	auipc	ra,0x1
    80004148:	1d8080e7          	jalr	472(ra) # 8000531c <push_on>
    8000414c:	0984a703          	lw	a4,152(s1)
    80004150:	09c4a783          	lw	a5,156(s1)
    80004154:	0007879b          	sext.w	a5,a5
    80004158:	fef70ce3          	beq	a4,a5,80004150 <consoleread+0xfc>
    8000415c:	00001097          	auipc	ra,0x1
    80004160:	234080e7          	jalr	564(ra) # 80005390 <pop_on>
    80004164:	0984a783          	lw	a5,152(s1)
    80004168:	07f7f713          	andi	a4,a5,127
    8000416c:	00e48733          	add	a4,s1,a4
    80004170:	01874703          	lbu	a4,24(a4)
    80004174:	0017869b          	addiw	a3,a5,1
    80004178:	08d4ac23          	sw	a3,152(s1)
    8000417c:	00070c9b          	sext.w	s9,a4
    80004180:	f5371ee3          	bne	a4,s3,800040dc <consoleread+0x88>
    80004184:	000b851b          	sext.w	a0,s7
    80004188:	f96bf2e3          	bgeu	s7,s6,8000410c <consoleread+0xb8>
    8000418c:	08f4ac23          	sw	a5,152(s1)
    80004190:	f7dff06f          	j	8000410c <consoleread+0xb8>

0000000080004194 <consputc>:
    80004194:	10000793          	li	a5,256
    80004198:	00f50663          	beq	a0,a5,800041a4 <consputc+0x10>
    8000419c:	00001317          	auipc	t1,0x1
    800041a0:	9f430067          	jr	-1548(t1) # 80004b90 <uartputc_sync>
    800041a4:	ff010113          	addi	sp,sp,-16
    800041a8:	00113423          	sd	ra,8(sp)
    800041ac:	00813023          	sd	s0,0(sp)
    800041b0:	01010413          	addi	s0,sp,16
    800041b4:	00800513          	li	a0,8
    800041b8:	00001097          	auipc	ra,0x1
    800041bc:	9d8080e7          	jalr	-1576(ra) # 80004b90 <uartputc_sync>
    800041c0:	02000513          	li	a0,32
    800041c4:	00001097          	auipc	ra,0x1
    800041c8:	9cc080e7          	jalr	-1588(ra) # 80004b90 <uartputc_sync>
    800041cc:	00013403          	ld	s0,0(sp)
    800041d0:	00813083          	ld	ra,8(sp)
    800041d4:	00800513          	li	a0,8
    800041d8:	01010113          	addi	sp,sp,16
    800041dc:	00001317          	auipc	t1,0x1
    800041e0:	9b430067          	jr	-1612(t1) # 80004b90 <uartputc_sync>

00000000800041e4 <consoleintr>:
    800041e4:	fe010113          	addi	sp,sp,-32
    800041e8:	00813823          	sd	s0,16(sp)
    800041ec:	00913423          	sd	s1,8(sp)
    800041f0:	01213023          	sd	s2,0(sp)
    800041f4:	00113c23          	sd	ra,24(sp)
    800041f8:	02010413          	addi	s0,sp,32
    800041fc:	00004917          	auipc	s2,0x4
    80004200:	50c90913          	addi	s2,s2,1292 # 80008708 <cons>
    80004204:	00050493          	mv	s1,a0
    80004208:	00090513          	mv	a0,s2
    8000420c:	00001097          	auipc	ra,0x1
    80004210:	e40080e7          	jalr	-448(ra) # 8000504c <acquire>
    80004214:	02048c63          	beqz	s1,8000424c <consoleintr+0x68>
    80004218:	0a092783          	lw	a5,160(s2)
    8000421c:	09892703          	lw	a4,152(s2)
    80004220:	07f00693          	li	a3,127
    80004224:	40e7873b          	subw	a4,a5,a4
    80004228:	02e6e263          	bltu	a3,a4,8000424c <consoleintr+0x68>
    8000422c:	00d00713          	li	a4,13
    80004230:	04e48063          	beq	s1,a4,80004270 <consoleintr+0x8c>
    80004234:	07f7f713          	andi	a4,a5,127
    80004238:	00e90733          	add	a4,s2,a4
    8000423c:	0017879b          	addiw	a5,a5,1
    80004240:	0af92023          	sw	a5,160(s2)
    80004244:	00970c23          	sb	s1,24(a4)
    80004248:	08f92e23          	sw	a5,156(s2)
    8000424c:	01013403          	ld	s0,16(sp)
    80004250:	01813083          	ld	ra,24(sp)
    80004254:	00813483          	ld	s1,8(sp)
    80004258:	00013903          	ld	s2,0(sp)
    8000425c:	00004517          	auipc	a0,0x4
    80004260:	4ac50513          	addi	a0,a0,1196 # 80008708 <cons>
    80004264:	02010113          	addi	sp,sp,32
    80004268:	00001317          	auipc	t1,0x1
    8000426c:	eb030067          	jr	-336(t1) # 80005118 <release>
    80004270:	00a00493          	li	s1,10
    80004274:	fc1ff06f          	j	80004234 <consoleintr+0x50>

0000000080004278 <consoleinit>:
    80004278:	fe010113          	addi	sp,sp,-32
    8000427c:	00113c23          	sd	ra,24(sp)
    80004280:	00813823          	sd	s0,16(sp)
    80004284:	00913423          	sd	s1,8(sp)
    80004288:	02010413          	addi	s0,sp,32
    8000428c:	00004497          	auipc	s1,0x4
    80004290:	47c48493          	addi	s1,s1,1148 # 80008708 <cons>
    80004294:	00048513          	mv	a0,s1
    80004298:	00002597          	auipc	a1,0x2
    8000429c:	03858593          	addi	a1,a1,56 # 800062d0 <kvmincrease+0x7f0>
    800042a0:	00001097          	auipc	ra,0x1
    800042a4:	d88080e7          	jalr	-632(ra) # 80005028 <initlock>
    800042a8:	00000097          	auipc	ra,0x0
    800042ac:	7ac080e7          	jalr	1964(ra) # 80004a54 <uartinit>
    800042b0:	01813083          	ld	ra,24(sp)
    800042b4:	01013403          	ld	s0,16(sp)
    800042b8:	00000797          	auipc	a5,0x0
    800042bc:	d9c78793          	addi	a5,a5,-612 # 80004054 <consoleread>
    800042c0:	0af4bc23          	sd	a5,184(s1)
    800042c4:	00000797          	auipc	a5,0x0
    800042c8:	cec78793          	addi	a5,a5,-788 # 80003fb0 <consolewrite>
    800042cc:	0cf4b023          	sd	a5,192(s1)
    800042d0:	00813483          	ld	s1,8(sp)
    800042d4:	02010113          	addi	sp,sp,32
    800042d8:	00008067          	ret

00000000800042dc <console_read>:
    800042dc:	ff010113          	addi	sp,sp,-16
    800042e0:	00813423          	sd	s0,8(sp)
    800042e4:	01010413          	addi	s0,sp,16
    800042e8:	00813403          	ld	s0,8(sp)
    800042ec:	00004317          	auipc	t1,0x4
    800042f0:	4d433303          	ld	t1,1236(t1) # 800087c0 <devsw+0x10>
    800042f4:	01010113          	addi	sp,sp,16
    800042f8:	00030067          	jr	t1

00000000800042fc <console_write>:
    800042fc:	ff010113          	addi	sp,sp,-16
    80004300:	00813423          	sd	s0,8(sp)
    80004304:	01010413          	addi	s0,sp,16
    80004308:	00813403          	ld	s0,8(sp)
    8000430c:	00004317          	auipc	t1,0x4
    80004310:	4bc33303          	ld	t1,1212(t1) # 800087c8 <devsw+0x18>
    80004314:	01010113          	addi	sp,sp,16
    80004318:	00030067          	jr	t1

000000008000431c <panic>:
    8000431c:	fe010113          	addi	sp,sp,-32
    80004320:	00113c23          	sd	ra,24(sp)
    80004324:	00813823          	sd	s0,16(sp)
    80004328:	00913423          	sd	s1,8(sp)
    8000432c:	02010413          	addi	s0,sp,32
    80004330:	00050493          	mv	s1,a0
    80004334:	00002517          	auipc	a0,0x2
    80004338:	fa450513          	addi	a0,a0,-92 # 800062d8 <kvmincrease+0x7f8>
    8000433c:	00004797          	auipc	a5,0x4
    80004340:	5207a623          	sw	zero,1324(a5) # 80008868 <pr+0x18>
    80004344:	00000097          	auipc	ra,0x0
    80004348:	034080e7          	jalr	52(ra) # 80004378 <__printf>
    8000434c:	00048513          	mv	a0,s1
    80004350:	00000097          	auipc	ra,0x0
    80004354:	028080e7          	jalr	40(ra) # 80004378 <__printf>
    80004358:	00002517          	auipc	a0,0x2
    8000435c:	da050513          	addi	a0,a0,-608 # 800060f8 <kvmincrease+0x618>
    80004360:	00000097          	auipc	ra,0x0
    80004364:	018080e7          	jalr	24(ra) # 80004378 <__printf>
    80004368:	00100793          	li	a5,1
    8000436c:	00003717          	auipc	a4,0x3
    80004370:	24f72e23          	sw	a5,604(a4) # 800075c8 <panicked>
    80004374:	0000006f          	j	80004374 <panic+0x58>

0000000080004378 <__printf>:
    80004378:	f3010113          	addi	sp,sp,-208
    8000437c:	08813023          	sd	s0,128(sp)
    80004380:	07313423          	sd	s3,104(sp)
    80004384:	09010413          	addi	s0,sp,144
    80004388:	05813023          	sd	s8,64(sp)
    8000438c:	08113423          	sd	ra,136(sp)
    80004390:	06913c23          	sd	s1,120(sp)
    80004394:	07213823          	sd	s2,112(sp)
    80004398:	07413023          	sd	s4,96(sp)
    8000439c:	05513c23          	sd	s5,88(sp)
    800043a0:	05613823          	sd	s6,80(sp)
    800043a4:	05713423          	sd	s7,72(sp)
    800043a8:	03913c23          	sd	s9,56(sp)
    800043ac:	03a13823          	sd	s10,48(sp)
    800043b0:	03b13423          	sd	s11,40(sp)
    800043b4:	00004317          	auipc	t1,0x4
    800043b8:	49c30313          	addi	t1,t1,1180 # 80008850 <pr>
    800043bc:	01832c03          	lw	s8,24(t1)
    800043c0:	00b43423          	sd	a1,8(s0)
    800043c4:	00c43823          	sd	a2,16(s0)
    800043c8:	00d43c23          	sd	a3,24(s0)
    800043cc:	02e43023          	sd	a4,32(s0)
    800043d0:	02f43423          	sd	a5,40(s0)
    800043d4:	03043823          	sd	a6,48(s0)
    800043d8:	03143c23          	sd	a7,56(s0)
    800043dc:	00050993          	mv	s3,a0
    800043e0:	4a0c1663          	bnez	s8,8000488c <__printf+0x514>
    800043e4:	60098c63          	beqz	s3,800049fc <__printf+0x684>
    800043e8:	0009c503          	lbu	a0,0(s3)
    800043ec:	00840793          	addi	a5,s0,8
    800043f0:	f6f43c23          	sd	a5,-136(s0)
    800043f4:	00000493          	li	s1,0
    800043f8:	22050063          	beqz	a0,80004618 <__printf+0x2a0>
    800043fc:	00002a37          	lui	s4,0x2
    80004400:	00018ab7          	lui	s5,0x18
    80004404:	000f4b37          	lui	s6,0xf4
    80004408:	00989bb7          	lui	s7,0x989
    8000440c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80004410:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80004414:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80004418:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    8000441c:	00148c9b          	addiw	s9,s1,1
    80004420:	02500793          	li	a5,37
    80004424:	01998933          	add	s2,s3,s9
    80004428:	38f51263          	bne	a0,a5,800047ac <__printf+0x434>
    8000442c:	00094783          	lbu	a5,0(s2)
    80004430:	00078c9b          	sext.w	s9,a5
    80004434:	1e078263          	beqz	a5,80004618 <__printf+0x2a0>
    80004438:	0024849b          	addiw	s1,s1,2
    8000443c:	07000713          	li	a4,112
    80004440:	00998933          	add	s2,s3,s1
    80004444:	38e78a63          	beq	a5,a4,800047d8 <__printf+0x460>
    80004448:	20f76863          	bltu	a4,a5,80004658 <__printf+0x2e0>
    8000444c:	42a78863          	beq	a5,a0,8000487c <__printf+0x504>
    80004450:	06400713          	li	a4,100
    80004454:	40e79663          	bne	a5,a4,80004860 <__printf+0x4e8>
    80004458:	f7843783          	ld	a5,-136(s0)
    8000445c:	0007a603          	lw	a2,0(a5)
    80004460:	00878793          	addi	a5,a5,8
    80004464:	f6f43c23          	sd	a5,-136(s0)
    80004468:	42064a63          	bltz	a2,8000489c <__printf+0x524>
    8000446c:	00a00713          	li	a4,10
    80004470:	02e677bb          	remuw	a5,a2,a4
    80004474:	00002d97          	auipc	s11,0x2
    80004478:	e8cd8d93          	addi	s11,s11,-372 # 80006300 <digits>
    8000447c:	00900593          	li	a1,9
    80004480:	0006051b          	sext.w	a0,a2
    80004484:	00000c93          	li	s9,0
    80004488:	02079793          	slli	a5,a5,0x20
    8000448c:	0207d793          	srli	a5,a5,0x20
    80004490:	00fd87b3          	add	a5,s11,a5
    80004494:	0007c783          	lbu	a5,0(a5)
    80004498:	02e656bb          	divuw	a3,a2,a4
    8000449c:	f8f40023          	sb	a5,-128(s0)
    800044a0:	14c5d863          	bge	a1,a2,800045f0 <__printf+0x278>
    800044a4:	06300593          	li	a1,99
    800044a8:	00100c93          	li	s9,1
    800044ac:	02e6f7bb          	remuw	a5,a3,a4
    800044b0:	02079793          	slli	a5,a5,0x20
    800044b4:	0207d793          	srli	a5,a5,0x20
    800044b8:	00fd87b3          	add	a5,s11,a5
    800044bc:	0007c783          	lbu	a5,0(a5)
    800044c0:	02e6d73b          	divuw	a4,a3,a4
    800044c4:	f8f400a3          	sb	a5,-127(s0)
    800044c8:	12a5f463          	bgeu	a1,a0,800045f0 <__printf+0x278>
    800044cc:	00a00693          	li	a3,10
    800044d0:	00900593          	li	a1,9
    800044d4:	02d777bb          	remuw	a5,a4,a3
    800044d8:	02079793          	slli	a5,a5,0x20
    800044dc:	0207d793          	srli	a5,a5,0x20
    800044e0:	00fd87b3          	add	a5,s11,a5
    800044e4:	0007c503          	lbu	a0,0(a5)
    800044e8:	02d757bb          	divuw	a5,a4,a3
    800044ec:	f8a40123          	sb	a0,-126(s0)
    800044f0:	48e5f263          	bgeu	a1,a4,80004974 <__printf+0x5fc>
    800044f4:	06300513          	li	a0,99
    800044f8:	02d7f5bb          	remuw	a1,a5,a3
    800044fc:	02059593          	slli	a1,a1,0x20
    80004500:	0205d593          	srli	a1,a1,0x20
    80004504:	00bd85b3          	add	a1,s11,a1
    80004508:	0005c583          	lbu	a1,0(a1)
    8000450c:	02d7d7bb          	divuw	a5,a5,a3
    80004510:	f8b401a3          	sb	a1,-125(s0)
    80004514:	48e57263          	bgeu	a0,a4,80004998 <__printf+0x620>
    80004518:	3e700513          	li	a0,999
    8000451c:	02d7f5bb          	remuw	a1,a5,a3
    80004520:	02059593          	slli	a1,a1,0x20
    80004524:	0205d593          	srli	a1,a1,0x20
    80004528:	00bd85b3          	add	a1,s11,a1
    8000452c:	0005c583          	lbu	a1,0(a1)
    80004530:	02d7d7bb          	divuw	a5,a5,a3
    80004534:	f8b40223          	sb	a1,-124(s0)
    80004538:	46e57663          	bgeu	a0,a4,800049a4 <__printf+0x62c>
    8000453c:	02d7f5bb          	remuw	a1,a5,a3
    80004540:	02059593          	slli	a1,a1,0x20
    80004544:	0205d593          	srli	a1,a1,0x20
    80004548:	00bd85b3          	add	a1,s11,a1
    8000454c:	0005c583          	lbu	a1,0(a1)
    80004550:	02d7d7bb          	divuw	a5,a5,a3
    80004554:	f8b402a3          	sb	a1,-123(s0)
    80004558:	46ea7863          	bgeu	s4,a4,800049c8 <__printf+0x650>
    8000455c:	02d7f5bb          	remuw	a1,a5,a3
    80004560:	02059593          	slli	a1,a1,0x20
    80004564:	0205d593          	srli	a1,a1,0x20
    80004568:	00bd85b3          	add	a1,s11,a1
    8000456c:	0005c583          	lbu	a1,0(a1)
    80004570:	02d7d7bb          	divuw	a5,a5,a3
    80004574:	f8b40323          	sb	a1,-122(s0)
    80004578:	3eeaf863          	bgeu	s5,a4,80004968 <__printf+0x5f0>
    8000457c:	02d7f5bb          	remuw	a1,a5,a3
    80004580:	02059593          	slli	a1,a1,0x20
    80004584:	0205d593          	srli	a1,a1,0x20
    80004588:	00bd85b3          	add	a1,s11,a1
    8000458c:	0005c583          	lbu	a1,0(a1)
    80004590:	02d7d7bb          	divuw	a5,a5,a3
    80004594:	f8b403a3          	sb	a1,-121(s0)
    80004598:	42eb7e63          	bgeu	s6,a4,800049d4 <__printf+0x65c>
    8000459c:	02d7f5bb          	remuw	a1,a5,a3
    800045a0:	02059593          	slli	a1,a1,0x20
    800045a4:	0205d593          	srli	a1,a1,0x20
    800045a8:	00bd85b3          	add	a1,s11,a1
    800045ac:	0005c583          	lbu	a1,0(a1)
    800045b0:	02d7d7bb          	divuw	a5,a5,a3
    800045b4:	f8b40423          	sb	a1,-120(s0)
    800045b8:	42ebfc63          	bgeu	s7,a4,800049f0 <__printf+0x678>
    800045bc:	02079793          	slli	a5,a5,0x20
    800045c0:	0207d793          	srli	a5,a5,0x20
    800045c4:	00fd8db3          	add	s11,s11,a5
    800045c8:	000dc703          	lbu	a4,0(s11)
    800045cc:	00a00793          	li	a5,10
    800045d0:	00900c93          	li	s9,9
    800045d4:	f8e404a3          	sb	a4,-119(s0)
    800045d8:	00065c63          	bgez	a2,800045f0 <__printf+0x278>
    800045dc:	f9040713          	addi	a4,s0,-112
    800045e0:	00f70733          	add	a4,a4,a5
    800045e4:	02d00693          	li	a3,45
    800045e8:	fed70823          	sb	a3,-16(a4)
    800045ec:	00078c93          	mv	s9,a5
    800045f0:	f8040793          	addi	a5,s0,-128
    800045f4:	01978cb3          	add	s9,a5,s9
    800045f8:	f7f40d13          	addi	s10,s0,-129
    800045fc:	000cc503          	lbu	a0,0(s9)
    80004600:	fffc8c93          	addi	s9,s9,-1
    80004604:	00000097          	auipc	ra,0x0
    80004608:	b90080e7          	jalr	-1136(ra) # 80004194 <consputc>
    8000460c:	ffac98e3          	bne	s9,s10,800045fc <__printf+0x284>
    80004610:	00094503          	lbu	a0,0(s2)
    80004614:	e00514e3          	bnez	a0,8000441c <__printf+0xa4>
    80004618:	1a0c1663          	bnez	s8,800047c4 <__printf+0x44c>
    8000461c:	08813083          	ld	ra,136(sp)
    80004620:	08013403          	ld	s0,128(sp)
    80004624:	07813483          	ld	s1,120(sp)
    80004628:	07013903          	ld	s2,112(sp)
    8000462c:	06813983          	ld	s3,104(sp)
    80004630:	06013a03          	ld	s4,96(sp)
    80004634:	05813a83          	ld	s5,88(sp)
    80004638:	05013b03          	ld	s6,80(sp)
    8000463c:	04813b83          	ld	s7,72(sp)
    80004640:	04013c03          	ld	s8,64(sp)
    80004644:	03813c83          	ld	s9,56(sp)
    80004648:	03013d03          	ld	s10,48(sp)
    8000464c:	02813d83          	ld	s11,40(sp)
    80004650:	0d010113          	addi	sp,sp,208
    80004654:	00008067          	ret
    80004658:	07300713          	li	a4,115
    8000465c:	1ce78a63          	beq	a5,a4,80004830 <__printf+0x4b8>
    80004660:	07800713          	li	a4,120
    80004664:	1ee79e63          	bne	a5,a4,80004860 <__printf+0x4e8>
    80004668:	f7843783          	ld	a5,-136(s0)
    8000466c:	0007a703          	lw	a4,0(a5)
    80004670:	00878793          	addi	a5,a5,8
    80004674:	f6f43c23          	sd	a5,-136(s0)
    80004678:	28074263          	bltz	a4,800048fc <__printf+0x584>
    8000467c:	00002d97          	auipc	s11,0x2
    80004680:	c84d8d93          	addi	s11,s11,-892 # 80006300 <digits>
    80004684:	00f77793          	andi	a5,a4,15
    80004688:	00fd87b3          	add	a5,s11,a5
    8000468c:	0007c683          	lbu	a3,0(a5)
    80004690:	00f00613          	li	a2,15
    80004694:	0007079b          	sext.w	a5,a4
    80004698:	f8d40023          	sb	a3,-128(s0)
    8000469c:	0047559b          	srliw	a1,a4,0x4
    800046a0:	0047569b          	srliw	a3,a4,0x4
    800046a4:	00000c93          	li	s9,0
    800046a8:	0ee65063          	bge	a2,a4,80004788 <__printf+0x410>
    800046ac:	00f6f693          	andi	a3,a3,15
    800046b0:	00dd86b3          	add	a3,s11,a3
    800046b4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    800046b8:	0087d79b          	srliw	a5,a5,0x8
    800046bc:	00100c93          	li	s9,1
    800046c0:	f8d400a3          	sb	a3,-127(s0)
    800046c4:	0cb67263          	bgeu	a2,a1,80004788 <__printf+0x410>
    800046c8:	00f7f693          	andi	a3,a5,15
    800046cc:	00dd86b3          	add	a3,s11,a3
    800046d0:	0006c583          	lbu	a1,0(a3)
    800046d4:	00f00613          	li	a2,15
    800046d8:	0047d69b          	srliw	a3,a5,0x4
    800046dc:	f8b40123          	sb	a1,-126(s0)
    800046e0:	0047d593          	srli	a1,a5,0x4
    800046e4:	28f67e63          	bgeu	a2,a5,80004980 <__printf+0x608>
    800046e8:	00f6f693          	andi	a3,a3,15
    800046ec:	00dd86b3          	add	a3,s11,a3
    800046f0:	0006c503          	lbu	a0,0(a3)
    800046f4:	0087d813          	srli	a6,a5,0x8
    800046f8:	0087d69b          	srliw	a3,a5,0x8
    800046fc:	f8a401a3          	sb	a0,-125(s0)
    80004700:	28b67663          	bgeu	a2,a1,8000498c <__printf+0x614>
    80004704:	00f6f693          	andi	a3,a3,15
    80004708:	00dd86b3          	add	a3,s11,a3
    8000470c:	0006c583          	lbu	a1,0(a3)
    80004710:	00c7d513          	srli	a0,a5,0xc
    80004714:	00c7d69b          	srliw	a3,a5,0xc
    80004718:	f8b40223          	sb	a1,-124(s0)
    8000471c:	29067a63          	bgeu	a2,a6,800049b0 <__printf+0x638>
    80004720:	00f6f693          	andi	a3,a3,15
    80004724:	00dd86b3          	add	a3,s11,a3
    80004728:	0006c583          	lbu	a1,0(a3)
    8000472c:	0107d813          	srli	a6,a5,0x10
    80004730:	0107d69b          	srliw	a3,a5,0x10
    80004734:	f8b402a3          	sb	a1,-123(s0)
    80004738:	28a67263          	bgeu	a2,a0,800049bc <__printf+0x644>
    8000473c:	00f6f693          	andi	a3,a3,15
    80004740:	00dd86b3          	add	a3,s11,a3
    80004744:	0006c683          	lbu	a3,0(a3)
    80004748:	0147d79b          	srliw	a5,a5,0x14
    8000474c:	f8d40323          	sb	a3,-122(s0)
    80004750:	21067663          	bgeu	a2,a6,8000495c <__printf+0x5e4>
    80004754:	02079793          	slli	a5,a5,0x20
    80004758:	0207d793          	srli	a5,a5,0x20
    8000475c:	00fd8db3          	add	s11,s11,a5
    80004760:	000dc683          	lbu	a3,0(s11)
    80004764:	00800793          	li	a5,8
    80004768:	00700c93          	li	s9,7
    8000476c:	f8d403a3          	sb	a3,-121(s0)
    80004770:	00075c63          	bgez	a4,80004788 <__printf+0x410>
    80004774:	f9040713          	addi	a4,s0,-112
    80004778:	00f70733          	add	a4,a4,a5
    8000477c:	02d00693          	li	a3,45
    80004780:	fed70823          	sb	a3,-16(a4)
    80004784:	00078c93          	mv	s9,a5
    80004788:	f8040793          	addi	a5,s0,-128
    8000478c:	01978cb3          	add	s9,a5,s9
    80004790:	f7f40d13          	addi	s10,s0,-129
    80004794:	000cc503          	lbu	a0,0(s9)
    80004798:	fffc8c93          	addi	s9,s9,-1
    8000479c:	00000097          	auipc	ra,0x0
    800047a0:	9f8080e7          	jalr	-1544(ra) # 80004194 <consputc>
    800047a4:	ff9d18e3          	bne	s10,s9,80004794 <__printf+0x41c>
    800047a8:	0100006f          	j	800047b8 <__printf+0x440>
    800047ac:	00000097          	auipc	ra,0x0
    800047b0:	9e8080e7          	jalr	-1560(ra) # 80004194 <consputc>
    800047b4:	000c8493          	mv	s1,s9
    800047b8:	00094503          	lbu	a0,0(s2)
    800047bc:	c60510e3          	bnez	a0,8000441c <__printf+0xa4>
    800047c0:	e40c0ee3          	beqz	s8,8000461c <__printf+0x2a4>
    800047c4:	00004517          	auipc	a0,0x4
    800047c8:	08c50513          	addi	a0,a0,140 # 80008850 <pr>
    800047cc:	00001097          	auipc	ra,0x1
    800047d0:	94c080e7          	jalr	-1716(ra) # 80005118 <release>
    800047d4:	e49ff06f          	j	8000461c <__printf+0x2a4>
    800047d8:	f7843783          	ld	a5,-136(s0)
    800047dc:	03000513          	li	a0,48
    800047e0:	01000d13          	li	s10,16
    800047e4:	00878713          	addi	a4,a5,8
    800047e8:	0007bc83          	ld	s9,0(a5)
    800047ec:	f6e43c23          	sd	a4,-136(s0)
    800047f0:	00000097          	auipc	ra,0x0
    800047f4:	9a4080e7          	jalr	-1628(ra) # 80004194 <consputc>
    800047f8:	07800513          	li	a0,120
    800047fc:	00000097          	auipc	ra,0x0
    80004800:	998080e7          	jalr	-1640(ra) # 80004194 <consputc>
    80004804:	00002d97          	auipc	s11,0x2
    80004808:	afcd8d93          	addi	s11,s11,-1284 # 80006300 <digits>
    8000480c:	03ccd793          	srli	a5,s9,0x3c
    80004810:	00fd87b3          	add	a5,s11,a5
    80004814:	0007c503          	lbu	a0,0(a5)
    80004818:	fffd0d1b          	addiw	s10,s10,-1
    8000481c:	004c9c93          	slli	s9,s9,0x4
    80004820:	00000097          	auipc	ra,0x0
    80004824:	974080e7          	jalr	-1676(ra) # 80004194 <consputc>
    80004828:	fe0d12e3          	bnez	s10,8000480c <__printf+0x494>
    8000482c:	f8dff06f          	j	800047b8 <__printf+0x440>
    80004830:	f7843783          	ld	a5,-136(s0)
    80004834:	0007bc83          	ld	s9,0(a5)
    80004838:	00878793          	addi	a5,a5,8
    8000483c:	f6f43c23          	sd	a5,-136(s0)
    80004840:	000c9a63          	bnez	s9,80004854 <__printf+0x4dc>
    80004844:	1080006f          	j	8000494c <__printf+0x5d4>
    80004848:	001c8c93          	addi	s9,s9,1
    8000484c:	00000097          	auipc	ra,0x0
    80004850:	948080e7          	jalr	-1720(ra) # 80004194 <consputc>
    80004854:	000cc503          	lbu	a0,0(s9)
    80004858:	fe0518e3          	bnez	a0,80004848 <__printf+0x4d0>
    8000485c:	f5dff06f          	j	800047b8 <__printf+0x440>
    80004860:	02500513          	li	a0,37
    80004864:	00000097          	auipc	ra,0x0
    80004868:	930080e7          	jalr	-1744(ra) # 80004194 <consputc>
    8000486c:	000c8513          	mv	a0,s9
    80004870:	00000097          	auipc	ra,0x0
    80004874:	924080e7          	jalr	-1756(ra) # 80004194 <consputc>
    80004878:	f41ff06f          	j	800047b8 <__printf+0x440>
    8000487c:	02500513          	li	a0,37
    80004880:	00000097          	auipc	ra,0x0
    80004884:	914080e7          	jalr	-1772(ra) # 80004194 <consputc>
    80004888:	f31ff06f          	j	800047b8 <__printf+0x440>
    8000488c:	00030513          	mv	a0,t1
    80004890:	00000097          	auipc	ra,0x0
    80004894:	7bc080e7          	jalr	1980(ra) # 8000504c <acquire>
    80004898:	b4dff06f          	j	800043e4 <__printf+0x6c>
    8000489c:	40c0053b          	negw	a0,a2
    800048a0:	00a00713          	li	a4,10
    800048a4:	02e576bb          	remuw	a3,a0,a4
    800048a8:	00002d97          	auipc	s11,0x2
    800048ac:	a58d8d93          	addi	s11,s11,-1448 # 80006300 <digits>
    800048b0:	ff700593          	li	a1,-9
    800048b4:	02069693          	slli	a3,a3,0x20
    800048b8:	0206d693          	srli	a3,a3,0x20
    800048bc:	00dd86b3          	add	a3,s11,a3
    800048c0:	0006c683          	lbu	a3,0(a3)
    800048c4:	02e557bb          	divuw	a5,a0,a4
    800048c8:	f8d40023          	sb	a3,-128(s0)
    800048cc:	10b65e63          	bge	a2,a1,800049e8 <__printf+0x670>
    800048d0:	06300593          	li	a1,99
    800048d4:	02e7f6bb          	remuw	a3,a5,a4
    800048d8:	02069693          	slli	a3,a3,0x20
    800048dc:	0206d693          	srli	a3,a3,0x20
    800048e0:	00dd86b3          	add	a3,s11,a3
    800048e4:	0006c683          	lbu	a3,0(a3)
    800048e8:	02e7d73b          	divuw	a4,a5,a4
    800048ec:	00200793          	li	a5,2
    800048f0:	f8d400a3          	sb	a3,-127(s0)
    800048f4:	bca5ece3          	bltu	a1,a0,800044cc <__printf+0x154>
    800048f8:	ce5ff06f          	j	800045dc <__printf+0x264>
    800048fc:	40e007bb          	negw	a5,a4
    80004900:	00002d97          	auipc	s11,0x2
    80004904:	a00d8d93          	addi	s11,s11,-1536 # 80006300 <digits>
    80004908:	00f7f693          	andi	a3,a5,15
    8000490c:	00dd86b3          	add	a3,s11,a3
    80004910:	0006c583          	lbu	a1,0(a3)
    80004914:	ff100613          	li	a2,-15
    80004918:	0047d69b          	srliw	a3,a5,0x4
    8000491c:	f8b40023          	sb	a1,-128(s0)
    80004920:	0047d59b          	srliw	a1,a5,0x4
    80004924:	0ac75e63          	bge	a4,a2,800049e0 <__printf+0x668>
    80004928:	00f6f693          	andi	a3,a3,15
    8000492c:	00dd86b3          	add	a3,s11,a3
    80004930:	0006c603          	lbu	a2,0(a3)
    80004934:	00f00693          	li	a3,15
    80004938:	0087d79b          	srliw	a5,a5,0x8
    8000493c:	f8c400a3          	sb	a2,-127(s0)
    80004940:	d8b6e4e3          	bltu	a3,a1,800046c8 <__printf+0x350>
    80004944:	00200793          	li	a5,2
    80004948:	e2dff06f          	j	80004774 <__printf+0x3fc>
    8000494c:	00002c97          	auipc	s9,0x2
    80004950:	994c8c93          	addi	s9,s9,-1644 # 800062e0 <kvmincrease+0x800>
    80004954:	02800513          	li	a0,40
    80004958:	ef1ff06f          	j	80004848 <__printf+0x4d0>
    8000495c:	00700793          	li	a5,7
    80004960:	00600c93          	li	s9,6
    80004964:	e0dff06f          	j	80004770 <__printf+0x3f8>
    80004968:	00700793          	li	a5,7
    8000496c:	00600c93          	li	s9,6
    80004970:	c69ff06f          	j	800045d8 <__printf+0x260>
    80004974:	00300793          	li	a5,3
    80004978:	00200c93          	li	s9,2
    8000497c:	c5dff06f          	j	800045d8 <__printf+0x260>
    80004980:	00300793          	li	a5,3
    80004984:	00200c93          	li	s9,2
    80004988:	de9ff06f          	j	80004770 <__printf+0x3f8>
    8000498c:	00400793          	li	a5,4
    80004990:	00300c93          	li	s9,3
    80004994:	dddff06f          	j	80004770 <__printf+0x3f8>
    80004998:	00400793          	li	a5,4
    8000499c:	00300c93          	li	s9,3
    800049a0:	c39ff06f          	j	800045d8 <__printf+0x260>
    800049a4:	00500793          	li	a5,5
    800049a8:	00400c93          	li	s9,4
    800049ac:	c2dff06f          	j	800045d8 <__printf+0x260>
    800049b0:	00500793          	li	a5,5
    800049b4:	00400c93          	li	s9,4
    800049b8:	db9ff06f          	j	80004770 <__printf+0x3f8>
    800049bc:	00600793          	li	a5,6
    800049c0:	00500c93          	li	s9,5
    800049c4:	dadff06f          	j	80004770 <__printf+0x3f8>
    800049c8:	00600793          	li	a5,6
    800049cc:	00500c93          	li	s9,5
    800049d0:	c09ff06f          	j	800045d8 <__printf+0x260>
    800049d4:	00800793          	li	a5,8
    800049d8:	00700c93          	li	s9,7
    800049dc:	bfdff06f          	j	800045d8 <__printf+0x260>
    800049e0:	00100793          	li	a5,1
    800049e4:	d91ff06f          	j	80004774 <__printf+0x3fc>
    800049e8:	00100793          	li	a5,1
    800049ec:	bf1ff06f          	j	800045dc <__printf+0x264>
    800049f0:	00900793          	li	a5,9
    800049f4:	00800c93          	li	s9,8
    800049f8:	be1ff06f          	j	800045d8 <__printf+0x260>
    800049fc:	00002517          	auipc	a0,0x2
    80004a00:	8ec50513          	addi	a0,a0,-1812 # 800062e8 <kvmincrease+0x808>
    80004a04:	00000097          	auipc	ra,0x0
    80004a08:	918080e7          	jalr	-1768(ra) # 8000431c <panic>

0000000080004a0c <printfinit>:
    80004a0c:	fe010113          	addi	sp,sp,-32
    80004a10:	00813823          	sd	s0,16(sp)
    80004a14:	00913423          	sd	s1,8(sp)
    80004a18:	00113c23          	sd	ra,24(sp)
    80004a1c:	02010413          	addi	s0,sp,32
    80004a20:	00004497          	auipc	s1,0x4
    80004a24:	e3048493          	addi	s1,s1,-464 # 80008850 <pr>
    80004a28:	00048513          	mv	a0,s1
    80004a2c:	00002597          	auipc	a1,0x2
    80004a30:	8cc58593          	addi	a1,a1,-1844 # 800062f8 <kvmincrease+0x818>
    80004a34:	00000097          	auipc	ra,0x0
    80004a38:	5f4080e7          	jalr	1524(ra) # 80005028 <initlock>
    80004a3c:	01813083          	ld	ra,24(sp)
    80004a40:	01013403          	ld	s0,16(sp)
    80004a44:	0004ac23          	sw	zero,24(s1)
    80004a48:	00813483          	ld	s1,8(sp)
    80004a4c:	02010113          	addi	sp,sp,32
    80004a50:	00008067          	ret

0000000080004a54 <uartinit>:
    80004a54:	ff010113          	addi	sp,sp,-16
    80004a58:	00813423          	sd	s0,8(sp)
    80004a5c:	01010413          	addi	s0,sp,16
    80004a60:	100007b7          	lui	a5,0x10000
    80004a64:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80004a68:	f8000713          	li	a4,-128
    80004a6c:	00e781a3          	sb	a4,3(a5)
    80004a70:	00300713          	li	a4,3
    80004a74:	00e78023          	sb	a4,0(a5)
    80004a78:	000780a3          	sb	zero,1(a5)
    80004a7c:	00e781a3          	sb	a4,3(a5)
    80004a80:	00700693          	li	a3,7
    80004a84:	00d78123          	sb	a3,2(a5)
    80004a88:	00e780a3          	sb	a4,1(a5)
    80004a8c:	00813403          	ld	s0,8(sp)
    80004a90:	01010113          	addi	sp,sp,16
    80004a94:	00008067          	ret

0000000080004a98 <uartputc>:
    80004a98:	00003797          	auipc	a5,0x3
    80004a9c:	b307a783          	lw	a5,-1232(a5) # 800075c8 <panicked>
    80004aa0:	00078463          	beqz	a5,80004aa8 <uartputc+0x10>
    80004aa4:	0000006f          	j	80004aa4 <uartputc+0xc>
    80004aa8:	fd010113          	addi	sp,sp,-48
    80004aac:	02813023          	sd	s0,32(sp)
    80004ab0:	00913c23          	sd	s1,24(sp)
    80004ab4:	01213823          	sd	s2,16(sp)
    80004ab8:	01313423          	sd	s3,8(sp)
    80004abc:	02113423          	sd	ra,40(sp)
    80004ac0:	03010413          	addi	s0,sp,48
    80004ac4:	00003917          	auipc	s2,0x3
    80004ac8:	b0c90913          	addi	s2,s2,-1268 # 800075d0 <uart_tx_r>
    80004acc:	00093783          	ld	a5,0(s2)
    80004ad0:	00003497          	auipc	s1,0x3
    80004ad4:	b0848493          	addi	s1,s1,-1272 # 800075d8 <uart_tx_w>
    80004ad8:	0004b703          	ld	a4,0(s1)
    80004adc:	02078693          	addi	a3,a5,32
    80004ae0:	00050993          	mv	s3,a0
    80004ae4:	02e69c63          	bne	a3,a4,80004b1c <uartputc+0x84>
    80004ae8:	00001097          	auipc	ra,0x1
    80004aec:	834080e7          	jalr	-1996(ra) # 8000531c <push_on>
    80004af0:	00093783          	ld	a5,0(s2)
    80004af4:	0004b703          	ld	a4,0(s1)
    80004af8:	02078793          	addi	a5,a5,32
    80004afc:	00e79463          	bne	a5,a4,80004b04 <uartputc+0x6c>
    80004b00:	0000006f          	j	80004b00 <uartputc+0x68>
    80004b04:	00001097          	auipc	ra,0x1
    80004b08:	88c080e7          	jalr	-1908(ra) # 80005390 <pop_on>
    80004b0c:	00093783          	ld	a5,0(s2)
    80004b10:	0004b703          	ld	a4,0(s1)
    80004b14:	02078693          	addi	a3,a5,32
    80004b18:	fce688e3          	beq	a3,a4,80004ae8 <uartputc+0x50>
    80004b1c:	01f77693          	andi	a3,a4,31
    80004b20:	00004597          	auipc	a1,0x4
    80004b24:	d5058593          	addi	a1,a1,-688 # 80008870 <uart_tx_buf>
    80004b28:	00d586b3          	add	a3,a1,a3
    80004b2c:	00170713          	addi	a4,a4,1
    80004b30:	01368023          	sb	s3,0(a3)
    80004b34:	00e4b023          	sd	a4,0(s1)
    80004b38:	10000637          	lui	a2,0x10000
    80004b3c:	02f71063          	bne	a4,a5,80004b5c <uartputc+0xc4>
    80004b40:	0340006f          	j	80004b74 <uartputc+0xdc>
    80004b44:	00074703          	lbu	a4,0(a4)
    80004b48:	00f93023          	sd	a5,0(s2)
    80004b4c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80004b50:	00093783          	ld	a5,0(s2)
    80004b54:	0004b703          	ld	a4,0(s1)
    80004b58:	00f70e63          	beq	a4,a5,80004b74 <uartputc+0xdc>
    80004b5c:	00564683          	lbu	a3,5(a2)
    80004b60:	01f7f713          	andi	a4,a5,31
    80004b64:	00e58733          	add	a4,a1,a4
    80004b68:	0206f693          	andi	a3,a3,32
    80004b6c:	00178793          	addi	a5,a5,1
    80004b70:	fc069ae3          	bnez	a3,80004b44 <uartputc+0xac>
    80004b74:	02813083          	ld	ra,40(sp)
    80004b78:	02013403          	ld	s0,32(sp)
    80004b7c:	01813483          	ld	s1,24(sp)
    80004b80:	01013903          	ld	s2,16(sp)
    80004b84:	00813983          	ld	s3,8(sp)
    80004b88:	03010113          	addi	sp,sp,48
    80004b8c:	00008067          	ret

0000000080004b90 <uartputc_sync>:
    80004b90:	ff010113          	addi	sp,sp,-16
    80004b94:	00813423          	sd	s0,8(sp)
    80004b98:	01010413          	addi	s0,sp,16
    80004b9c:	00003717          	auipc	a4,0x3
    80004ba0:	a2c72703          	lw	a4,-1492(a4) # 800075c8 <panicked>
    80004ba4:	02071663          	bnez	a4,80004bd0 <uartputc_sync+0x40>
    80004ba8:	00050793          	mv	a5,a0
    80004bac:	100006b7          	lui	a3,0x10000
    80004bb0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80004bb4:	02077713          	andi	a4,a4,32
    80004bb8:	fe070ce3          	beqz	a4,80004bb0 <uartputc_sync+0x20>
    80004bbc:	0ff7f793          	andi	a5,a5,255
    80004bc0:	00f68023          	sb	a5,0(a3)
    80004bc4:	00813403          	ld	s0,8(sp)
    80004bc8:	01010113          	addi	sp,sp,16
    80004bcc:	00008067          	ret
    80004bd0:	0000006f          	j	80004bd0 <uartputc_sync+0x40>

0000000080004bd4 <uartstart>:
    80004bd4:	ff010113          	addi	sp,sp,-16
    80004bd8:	00813423          	sd	s0,8(sp)
    80004bdc:	01010413          	addi	s0,sp,16
    80004be0:	00003617          	auipc	a2,0x3
    80004be4:	9f060613          	addi	a2,a2,-1552 # 800075d0 <uart_tx_r>
    80004be8:	00003517          	auipc	a0,0x3
    80004bec:	9f050513          	addi	a0,a0,-1552 # 800075d8 <uart_tx_w>
    80004bf0:	00063783          	ld	a5,0(a2)
    80004bf4:	00053703          	ld	a4,0(a0)
    80004bf8:	04f70263          	beq	a4,a5,80004c3c <uartstart+0x68>
    80004bfc:	100005b7          	lui	a1,0x10000
    80004c00:	00004817          	auipc	a6,0x4
    80004c04:	c7080813          	addi	a6,a6,-912 # 80008870 <uart_tx_buf>
    80004c08:	01c0006f          	j	80004c24 <uartstart+0x50>
    80004c0c:	0006c703          	lbu	a4,0(a3)
    80004c10:	00f63023          	sd	a5,0(a2)
    80004c14:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80004c18:	00063783          	ld	a5,0(a2)
    80004c1c:	00053703          	ld	a4,0(a0)
    80004c20:	00f70e63          	beq	a4,a5,80004c3c <uartstart+0x68>
    80004c24:	01f7f713          	andi	a4,a5,31
    80004c28:	00e806b3          	add	a3,a6,a4
    80004c2c:	0055c703          	lbu	a4,5(a1)
    80004c30:	00178793          	addi	a5,a5,1
    80004c34:	02077713          	andi	a4,a4,32
    80004c38:	fc071ae3          	bnez	a4,80004c0c <uartstart+0x38>
    80004c3c:	00813403          	ld	s0,8(sp)
    80004c40:	01010113          	addi	sp,sp,16
    80004c44:	00008067          	ret

0000000080004c48 <uartgetc>:
    80004c48:	ff010113          	addi	sp,sp,-16
    80004c4c:	00813423          	sd	s0,8(sp)
    80004c50:	01010413          	addi	s0,sp,16
    80004c54:	10000737          	lui	a4,0x10000
    80004c58:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80004c5c:	0017f793          	andi	a5,a5,1
    80004c60:	00078c63          	beqz	a5,80004c78 <uartgetc+0x30>
    80004c64:	00074503          	lbu	a0,0(a4)
    80004c68:	0ff57513          	andi	a0,a0,255
    80004c6c:	00813403          	ld	s0,8(sp)
    80004c70:	01010113          	addi	sp,sp,16
    80004c74:	00008067          	ret
    80004c78:	fff00513          	li	a0,-1
    80004c7c:	ff1ff06f          	j	80004c6c <uartgetc+0x24>

0000000080004c80 <uartintr>:
    80004c80:	100007b7          	lui	a5,0x10000
    80004c84:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80004c88:	0017f793          	andi	a5,a5,1
    80004c8c:	0a078463          	beqz	a5,80004d34 <uartintr+0xb4>
    80004c90:	fe010113          	addi	sp,sp,-32
    80004c94:	00813823          	sd	s0,16(sp)
    80004c98:	00913423          	sd	s1,8(sp)
    80004c9c:	00113c23          	sd	ra,24(sp)
    80004ca0:	02010413          	addi	s0,sp,32
    80004ca4:	100004b7          	lui	s1,0x10000
    80004ca8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    80004cac:	0ff57513          	andi	a0,a0,255
    80004cb0:	fffff097          	auipc	ra,0xfffff
    80004cb4:	534080e7          	jalr	1332(ra) # 800041e4 <consoleintr>
    80004cb8:	0054c783          	lbu	a5,5(s1)
    80004cbc:	0017f793          	andi	a5,a5,1
    80004cc0:	fe0794e3          	bnez	a5,80004ca8 <uartintr+0x28>
    80004cc4:	00003617          	auipc	a2,0x3
    80004cc8:	90c60613          	addi	a2,a2,-1780 # 800075d0 <uart_tx_r>
    80004ccc:	00003517          	auipc	a0,0x3
    80004cd0:	90c50513          	addi	a0,a0,-1780 # 800075d8 <uart_tx_w>
    80004cd4:	00063783          	ld	a5,0(a2)
    80004cd8:	00053703          	ld	a4,0(a0)
    80004cdc:	04f70263          	beq	a4,a5,80004d20 <uartintr+0xa0>
    80004ce0:	100005b7          	lui	a1,0x10000
    80004ce4:	00004817          	auipc	a6,0x4
    80004ce8:	b8c80813          	addi	a6,a6,-1140 # 80008870 <uart_tx_buf>
    80004cec:	01c0006f          	j	80004d08 <uartintr+0x88>
    80004cf0:	0006c703          	lbu	a4,0(a3)
    80004cf4:	00f63023          	sd	a5,0(a2)
    80004cf8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80004cfc:	00063783          	ld	a5,0(a2)
    80004d00:	00053703          	ld	a4,0(a0)
    80004d04:	00f70e63          	beq	a4,a5,80004d20 <uartintr+0xa0>
    80004d08:	01f7f713          	andi	a4,a5,31
    80004d0c:	00e806b3          	add	a3,a6,a4
    80004d10:	0055c703          	lbu	a4,5(a1)
    80004d14:	00178793          	addi	a5,a5,1
    80004d18:	02077713          	andi	a4,a4,32
    80004d1c:	fc071ae3          	bnez	a4,80004cf0 <uartintr+0x70>
    80004d20:	01813083          	ld	ra,24(sp)
    80004d24:	01013403          	ld	s0,16(sp)
    80004d28:	00813483          	ld	s1,8(sp)
    80004d2c:	02010113          	addi	sp,sp,32
    80004d30:	00008067          	ret
    80004d34:	00003617          	auipc	a2,0x3
    80004d38:	89c60613          	addi	a2,a2,-1892 # 800075d0 <uart_tx_r>
    80004d3c:	00003517          	auipc	a0,0x3
    80004d40:	89c50513          	addi	a0,a0,-1892 # 800075d8 <uart_tx_w>
    80004d44:	00063783          	ld	a5,0(a2)
    80004d48:	00053703          	ld	a4,0(a0)
    80004d4c:	04f70263          	beq	a4,a5,80004d90 <uartintr+0x110>
    80004d50:	100005b7          	lui	a1,0x10000
    80004d54:	00004817          	auipc	a6,0x4
    80004d58:	b1c80813          	addi	a6,a6,-1252 # 80008870 <uart_tx_buf>
    80004d5c:	01c0006f          	j	80004d78 <uartintr+0xf8>
    80004d60:	0006c703          	lbu	a4,0(a3)
    80004d64:	00f63023          	sd	a5,0(a2)
    80004d68:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80004d6c:	00063783          	ld	a5,0(a2)
    80004d70:	00053703          	ld	a4,0(a0)
    80004d74:	02f70063          	beq	a4,a5,80004d94 <uartintr+0x114>
    80004d78:	01f7f713          	andi	a4,a5,31
    80004d7c:	00e806b3          	add	a3,a6,a4
    80004d80:	0055c703          	lbu	a4,5(a1)
    80004d84:	00178793          	addi	a5,a5,1
    80004d88:	02077713          	andi	a4,a4,32
    80004d8c:	fc071ae3          	bnez	a4,80004d60 <uartintr+0xe0>
    80004d90:	00008067          	ret
    80004d94:	00008067          	ret

0000000080004d98 <kinit>:
    80004d98:	fc010113          	addi	sp,sp,-64
    80004d9c:	02913423          	sd	s1,40(sp)
    80004da0:	fffff7b7          	lui	a5,0xfffff
    80004da4:	00005497          	auipc	s1,0x5
    80004da8:	afb48493          	addi	s1,s1,-1285 # 8000989f <end+0xfff>
    80004dac:	02813823          	sd	s0,48(sp)
    80004db0:	01313c23          	sd	s3,24(sp)
    80004db4:	00f4f4b3          	and	s1,s1,a5
    80004db8:	02113c23          	sd	ra,56(sp)
    80004dbc:	03213023          	sd	s2,32(sp)
    80004dc0:	01413823          	sd	s4,16(sp)
    80004dc4:	01513423          	sd	s5,8(sp)
    80004dc8:	04010413          	addi	s0,sp,64
    80004dcc:	000017b7          	lui	a5,0x1
    80004dd0:	01100993          	li	s3,17
    80004dd4:	00f487b3          	add	a5,s1,a5
    80004dd8:	01b99993          	slli	s3,s3,0x1b
    80004ddc:	06f9e063          	bltu	s3,a5,80004e3c <kinit+0xa4>
    80004de0:	00004a97          	auipc	s5,0x4
    80004de4:	ac0a8a93          	addi	s5,s5,-1344 # 800088a0 <end>
    80004de8:	0754ec63          	bltu	s1,s5,80004e60 <kinit+0xc8>
    80004dec:	0734fa63          	bgeu	s1,s3,80004e60 <kinit+0xc8>
    80004df0:	00088a37          	lui	s4,0x88
    80004df4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80004df8:	00002917          	auipc	s2,0x2
    80004dfc:	7e890913          	addi	s2,s2,2024 # 800075e0 <kmem>
    80004e00:	00ca1a13          	slli	s4,s4,0xc
    80004e04:	0140006f          	j	80004e18 <kinit+0x80>
    80004e08:	000017b7          	lui	a5,0x1
    80004e0c:	00f484b3          	add	s1,s1,a5
    80004e10:	0554e863          	bltu	s1,s5,80004e60 <kinit+0xc8>
    80004e14:	0534f663          	bgeu	s1,s3,80004e60 <kinit+0xc8>
    80004e18:	00001637          	lui	a2,0x1
    80004e1c:	00100593          	li	a1,1
    80004e20:	00048513          	mv	a0,s1
    80004e24:	00000097          	auipc	ra,0x0
    80004e28:	5e4080e7          	jalr	1508(ra) # 80005408 <__memset>
    80004e2c:	00093783          	ld	a5,0(s2)
    80004e30:	00f4b023          	sd	a5,0(s1)
    80004e34:	00993023          	sd	s1,0(s2)
    80004e38:	fd4498e3          	bne	s1,s4,80004e08 <kinit+0x70>
    80004e3c:	03813083          	ld	ra,56(sp)
    80004e40:	03013403          	ld	s0,48(sp)
    80004e44:	02813483          	ld	s1,40(sp)
    80004e48:	02013903          	ld	s2,32(sp)
    80004e4c:	01813983          	ld	s3,24(sp)
    80004e50:	01013a03          	ld	s4,16(sp)
    80004e54:	00813a83          	ld	s5,8(sp)
    80004e58:	04010113          	addi	sp,sp,64
    80004e5c:	00008067          	ret
    80004e60:	00001517          	auipc	a0,0x1
    80004e64:	4b850513          	addi	a0,a0,1208 # 80006318 <digits+0x18>
    80004e68:	fffff097          	auipc	ra,0xfffff
    80004e6c:	4b4080e7          	jalr	1204(ra) # 8000431c <panic>

0000000080004e70 <freerange>:
    80004e70:	fc010113          	addi	sp,sp,-64
    80004e74:	000017b7          	lui	a5,0x1
    80004e78:	02913423          	sd	s1,40(sp)
    80004e7c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80004e80:	009504b3          	add	s1,a0,s1
    80004e84:	fffff537          	lui	a0,0xfffff
    80004e88:	02813823          	sd	s0,48(sp)
    80004e8c:	02113c23          	sd	ra,56(sp)
    80004e90:	03213023          	sd	s2,32(sp)
    80004e94:	01313c23          	sd	s3,24(sp)
    80004e98:	01413823          	sd	s4,16(sp)
    80004e9c:	01513423          	sd	s5,8(sp)
    80004ea0:	01613023          	sd	s6,0(sp)
    80004ea4:	04010413          	addi	s0,sp,64
    80004ea8:	00a4f4b3          	and	s1,s1,a0
    80004eac:	00f487b3          	add	a5,s1,a5
    80004eb0:	06f5e463          	bltu	a1,a5,80004f18 <freerange+0xa8>
    80004eb4:	00004a97          	auipc	s5,0x4
    80004eb8:	9eca8a93          	addi	s5,s5,-1556 # 800088a0 <end>
    80004ebc:	0954e263          	bltu	s1,s5,80004f40 <freerange+0xd0>
    80004ec0:	01100993          	li	s3,17
    80004ec4:	01b99993          	slli	s3,s3,0x1b
    80004ec8:	0734fc63          	bgeu	s1,s3,80004f40 <freerange+0xd0>
    80004ecc:	00058a13          	mv	s4,a1
    80004ed0:	00002917          	auipc	s2,0x2
    80004ed4:	71090913          	addi	s2,s2,1808 # 800075e0 <kmem>
    80004ed8:	00002b37          	lui	s6,0x2
    80004edc:	0140006f          	j	80004ef0 <freerange+0x80>
    80004ee0:	000017b7          	lui	a5,0x1
    80004ee4:	00f484b3          	add	s1,s1,a5
    80004ee8:	0554ec63          	bltu	s1,s5,80004f40 <freerange+0xd0>
    80004eec:	0534fa63          	bgeu	s1,s3,80004f40 <freerange+0xd0>
    80004ef0:	00001637          	lui	a2,0x1
    80004ef4:	00100593          	li	a1,1
    80004ef8:	00048513          	mv	a0,s1
    80004efc:	00000097          	auipc	ra,0x0
    80004f00:	50c080e7          	jalr	1292(ra) # 80005408 <__memset>
    80004f04:	00093703          	ld	a4,0(s2)
    80004f08:	016487b3          	add	a5,s1,s6
    80004f0c:	00e4b023          	sd	a4,0(s1)
    80004f10:	00993023          	sd	s1,0(s2)
    80004f14:	fcfa76e3          	bgeu	s4,a5,80004ee0 <freerange+0x70>
    80004f18:	03813083          	ld	ra,56(sp)
    80004f1c:	03013403          	ld	s0,48(sp)
    80004f20:	02813483          	ld	s1,40(sp)
    80004f24:	02013903          	ld	s2,32(sp)
    80004f28:	01813983          	ld	s3,24(sp)
    80004f2c:	01013a03          	ld	s4,16(sp)
    80004f30:	00813a83          	ld	s5,8(sp)
    80004f34:	00013b03          	ld	s6,0(sp)
    80004f38:	04010113          	addi	sp,sp,64
    80004f3c:	00008067          	ret
    80004f40:	00001517          	auipc	a0,0x1
    80004f44:	3d850513          	addi	a0,a0,984 # 80006318 <digits+0x18>
    80004f48:	fffff097          	auipc	ra,0xfffff
    80004f4c:	3d4080e7          	jalr	980(ra) # 8000431c <panic>

0000000080004f50 <kfree>:
    80004f50:	fe010113          	addi	sp,sp,-32
    80004f54:	00813823          	sd	s0,16(sp)
    80004f58:	00113c23          	sd	ra,24(sp)
    80004f5c:	00913423          	sd	s1,8(sp)
    80004f60:	02010413          	addi	s0,sp,32
    80004f64:	03451793          	slli	a5,a0,0x34
    80004f68:	04079c63          	bnez	a5,80004fc0 <kfree+0x70>
    80004f6c:	00004797          	auipc	a5,0x4
    80004f70:	93478793          	addi	a5,a5,-1740 # 800088a0 <end>
    80004f74:	00050493          	mv	s1,a0
    80004f78:	04f56463          	bltu	a0,a5,80004fc0 <kfree+0x70>
    80004f7c:	01100793          	li	a5,17
    80004f80:	01b79793          	slli	a5,a5,0x1b
    80004f84:	02f57e63          	bgeu	a0,a5,80004fc0 <kfree+0x70>
    80004f88:	00001637          	lui	a2,0x1
    80004f8c:	00100593          	li	a1,1
    80004f90:	00000097          	auipc	ra,0x0
    80004f94:	478080e7          	jalr	1144(ra) # 80005408 <__memset>
    80004f98:	00002797          	auipc	a5,0x2
    80004f9c:	64878793          	addi	a5,a5,1608 # 800075e0 <kmem>
    80004fa0:	0007b703          	ld	a4,0(a5)
    80004fa4:	01813083          	ld	ra,24(sp)
    80004fa8:	01013403          	ld	s0,16(sp)
    80004fac:	00e4b023          	sd	a4,0(s1)
    80004fb0:	0097b023          	sd	s1,0(a5)
    80004fb4:	00813483          	ld	s1,8(sp)
    80004fb8:	02010113          	addi	sp,sp,32
    80004fbc:	00008067          	ret
    80004fc0:	00001517          	auipc	a0,0x1
    80004fc4:	35850513          	addi	a0,a0,856 # 80006318 <digits+0x18>
    80004fc8:	fffff097          	auipc	ra,0xfffff
    80004fcc:	354080e7          	jalr	852(ra) # 8000431c <panic>

0000000080004fd0 <kalloc>:
    80004fd0:	fe010113          	addi	sp,sp,-32
    80004fd4:	00813823          	sd	s0,16(sp)
    80004fd8:	00913423          	sd	s1,8(sp)
    80004fdc:	00113c23          	sd	ra,24(sp)
    80004fe0:	02010413          	addi	s0,sp,32
    80004fe4:	00002797          	auipc	a5,0x2
    80004fe8:	5fc78793          	addi	a5,a5,1532 # 800075e0 <kmem>
    80004fec:	0007b483          	ld	s1,0(a5)
    80004ff0:	02048063          	beqz	s1,80005010 <kalloc+0x40>
    80004ff4:	0004b703          	ld	a4,0(s1)
    80004ff8:	00001637          	lui	a2,0x1
    80004ffc:	00500593          	li	a1,5
    80005000:	00048513          	mv	a0,s1
    80005004:	00e7b023          	sd	a4,0(a5)
    80005008:	00000097          	auipc	ra,0x0
    8000500c:	400080e7          	jalr	1024(ra) # 80005408 <__memset>
    80005010:	01813083          	ld	ra,24(sp)
    80005014:	01013403          	ld	s0,16(sp)
    80005018:	00048513          	mv	a0,s1
    8000501c:	00813483          	ld	s1,8(sp)
    80005020:	02010113          	addi	sp,sp,32
    80005024:	00008067          	ret

0000000080005028 <initlock>:
    80005028:	ff010113          	addi	sp,sp,-16
    8000502c:	00813423          	sd	s0,8(sp)
    80005030:	01010413          	addi	s0,sp,16
    80005034:	00813403          	ld	s0,8(sp)
    80005038:	00b53423          	sd	a1,8(a0)
    8000503c:	00052023          	sw	zero,0(a0)
    80005040:	00053823          	sd	zero,16(a0)
    80005044:	01010113          	addi	sp,sp,16
    80005048:	00008067          	ret

000000008000504c <acquire>:
    8000504c:	fe010113          	addi	sp,sp,-32
    80005050:	00813823          	sd	s0,16(sp)
    80005054:	00913423          	sd	s1,8(sp)
    80005058:	00113c23          	sd	ra,24(sp)
    8000505c:	01213023          	sd	s2,0(sp)
    80005060:	02010413          	addi	s0,sp,32
    80005064:	00050493          	mv	s1,a0
    80005068:	10002973          	csrr	s2,sstatus
    8000506c:	100027f3          	csrr	a5,sstatus
    80005070:	ffd7f793          	andi	a5,a5,-3
    80005074:	10079073          	csrw	sstatus,a5
    80005078:	fffff097          	auipc	ra,0xfffff
    8000507c:	8e0080e7          	jalr	-1824(ra) # 80003958 <mycpu>
    80005080:	07852783          	lw	a5,120(a0)
    80005084:	06078e63          	beqz	a5,80005100 <acquire+0xb4>
    80005088:	fffff097          	auipc	ra,0xfffff
    8000508c:	8d0080e7          	jalr	-1840(ra) # 80003958 <mycpu>
    80005090:	07852783          	lw	a5,120(a0)
    80005094:	0004a703          	lw	a4,0(s1)
    80005098:	0017879b          	addiw	a5,a5,1
    8000509c:	06f52c23          	sw	a5,120(a0)
    800050a0:	04071063          	bnez	a4,800050e0 <acquire+0x94>
    800050a4:	00100713          	li	a4,1
    800050a8:	00070793          	mv	a5,a4
    800050ac:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    800050b0:	0007879b          	sext.w	a5,a5
    800050b4:	fe079ae3          	bnez	a5,800050a8 <acquire+0x5c>
    800050b8:	0ff0000f          	fence
    800050bc:	fffff097          	auipc	ra,0xfffff
    800050c0:	89c080e7          	jalr	-1892(ra) # 80003958 <mycpu>
    800050c4:	01813083          	ld	ra,24(sp)
    800050c8:	01013403          	ld	s0,16(sp)
    800050cc:	00a4b823          	sd	a0,16(s1)
    800050d0:	00013903          	ld	s2,0(sp)
    800050d4:	00813483          	ld	s1,8(sp)
    800050d8:	02010113          	addi	sp,sp,32
    800050dc:	00008067          	ret
    800050e0:	0104b903          	ld	s2,16(s1)
    800050e4:	fffff097          	auipc	ra,0xfffff
    800050e8:	874080e7          	jalr	-1932(ra) # 80003958 <mycpu>
    800050ec:	faa91ce3          	bne	s2,a0,800050a4 <acquire+0x58>
    800050f0:	00001517          	auipc	a0,0x1
    800050f4:	23050513          	addi	a0,a0,560 # 80006320 <digits+0x20>
    800050f8:	fffff097          	auipc	ra,0xfffff
    800050fc:	224080e7          	jalr	548(ra) # 8000431c <panic>
    80005100:	00195913          	srli	s2,s2,0x1
    80005104:	fffff097          	auipc	ra,0xfffff
    80005108:	854080e7          	jalr	-1964(ra) # 80003958 <mycpu>
    8000510c:	00197913          	andi	s2,s2,1
    80005110:	07252e23          	sw	s2,124(a0)
    80005114:	f75ff06f          	j	80005088 <acquire+0x3c>

0000000080005118 <release>:
    80005118:	fe010113          	addi	sp,sp,-32
    8000511c:	00813823          	sd	s0,16(sp)
    80005120:	00113c23          	sd	ra,24(sp)
    80005124:	00913423          	sd	s1,8(sp)
    80005128:	01213023          	sd	s2,0(sp)
    8000512c:	02010413          	addi	s0,sp,32
    80005130:	00052783          	lw	a5,0(a0)
    80005134:	00079a63          	bnez	a5,80005148 <release+0x30>
    80005138:	00001517          	auipc	a0,0x1
    8000513c:	1f050513          	addi	a0,a0,496 # 80006328 <digits+0x28>
    80005140:	fffff097          	auipc	ra,0xfffff
    80005144:	1dc080e7          	jalr	476(ra) # 8000431c <panic>
    80005148:	01053903          	ld	s2,16(a0)
    8000514c:	00050493          	mv	s1,a0
    80005150:	fffff097          	auipc	ra,0xfffff
    80005154:	808080e7          	jalr	-2040(ra) # 80003958 <mycpu>
    80005158:	fea910e3          	bne	s2,a0,80005138 <release+0x20>
    8000515c:	0004b823          	sd	zero,16(s1)
    80005160:	0ff0000f          	fence
    80005164:	0f50000f          	fence	iorw,ow
    80005168:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000516c:	ffffe097          	auipc	ra,0xffffe
    80005170:	7ec080e7          	jalr	2028(ra) # 80003958 <mycpu>
    80005174:	100027f3          	csrr	a5,sstatus
    80005178:	0027f793          	andi	a5,a5,2
    8000517c:	04079a63          	bnez	a5,800051d0 <release+0xb8>
    80005180:	07852783          	lw	a5,120(a0)
    80005184:	02f05e63          	blez	a5,800051c0 <release+0xa8>
    80005188:	fff7871b          	addiw	a4,a5,-1
    8000518c:	06e52c23          	sw	a4,120(a0)
    80005190:	00071c63          	bnez	a4,800051a8 <release+0x90>
    80005194:	07c52783          	lw	a5,124(a0)
    80005198:	00078863          	beqz	a5,800051a8 <release+0x90>
    8000519c:	100027f3          	csrr	a5,sstatus
    800051a0:	0027e793          	ori	a5,a5,2
    800051a4:	10079073          	csrw	sstatus,a5
    800051a8:	01813083          	ld	ra,24(sp)
    800051ac:	01013403          	ld	s0,16(sp)
    800051b0:	00813483          	ld	s1,8(sp)
    800051b4:	00013903          	ld	s2,0(sp)
    800051b8:	02010113          	addi	sp,sp,32
    800051bc:	00008067          	ret
    800051c0:	00001517          	auipc	a0,0x1
    800051c4:	18850513          	addi	a0,a0,392 # 80006348 <digits+0x48>
    800051c8:	fffff097          	auipc	ra,0xfffff
    800051cc:	154080e7          	jalr	340(ra) # 8000431c <panic>
    800051d0:	00001517          	auipc	a0,0x1
    800051d4:	16050513          	addi	a0,a0,352 # 80006330 <digits+0x30>
    800051d8:	fffff097          	auipc	ra,0xfffff
    800051dc:	144080e7          	jalr	324(ra) # 8000431c <panic>

00000000800051e0 <holding>:
    800051e0:	00052783          	lw	a5,0(a0)
    800051e4:	00079663          	bnez	a5,800051f0 <holding+0x10>
    800051e8:	00000513          	li	a0,0
    800051ec:	00008067          	ret
    800051f0:	fe010113          	addi	sp,sp,-32
    800051f4:	00813823          	sd	s0,16(sp)
    800051f8:	00913423          	sd	s1,8(sp)
    800051fc:	00113c23          	sd	ra,24(sp)
    80005200:	02010413          	addi	s0,sp,32
    80005204:	01053483          	ld	s1,16(a0)
    80005208:	ffffe097          	auipc	ra,0xffffe
    8000520c:	750080e7          	jalr	1872(ra) # 80003958 <mycpu>
    80005210:	01813083          	ld	ra,24(sp)
    80005214:	01013403          	ld	s0,16(sp)
    80005218:	40a48533          	sub	a0,s1,a0
    8000521c:	00153513          	seqz	a0,a0
    80005220:	00813483          	ld	s1,8(sp)
    80005224:	02010113          	addi	sp,sp,32
    80005228:	00008067          	ret

000000008000522c <push_off>:
    8000522c:	fe010113          	addi	sp,sp,-32
    80005230:	00813823          	sd	s0,16(sp)
    80005234:	00113c23          	sd	ra,24(sp)
    80005238:	00913423          	sd	s1,8(sp)
    8000523c:	02010413          	addi	s0,sp,32
    80005240:	100024f3          	csrr	s1,sstatus
    80005244:	100027f3          	csrr	a5,sstatus
    80005248:	ffd7f793          	andi	a5,a5,-3
    8000524c:	10079073          	csrw	sstatus,a5
    80005250:	ffffe097          	auipc	ra,0xffffe
    80005254:	708080e7          	jalr	1800(ra) # 80003958 <mycpu>
    80005258:	07852783          	lw	a5,120(a0)
    8000525c:	02078663          	beqz	a5,80005288 <push_off+0x5c>
    80005260:	ffffe097          	auipc	ra,0xffffe
    80005264:	6f8080e7          	jalr	1784(ra) # 80003958 <mycpu>
    80005268:	07852783          	lw	a5,120(a0)
    8000526c:	01813083          	ld	ra,24(sp)
    80005270:	01013403          	ld	s0,16(sp)
    80005274:	0017879b          	addiw	a5,a5,1
    80005278:	06f52c23          	sw	a5,120(a0)
    8000527c:	00813483          	ld	s1,8(sp)
    80005280:	02010113          	addi	sp,sp,32
    80005284:	00008067          	ret
    80005288:	0014d493          	srli	s1,s1,0x1
    8000528c:	ffffe097          	auipc	ra,0xffffe
    80005290:	6cc080e7          	jalr	1740(ra) # 80003958 <mycpu>
    80005294:	0014f493          	andi	s1,s1,1
    80005298:	06952e23          	sw	s1,124(a0)
    8000529c:	fc5ff06f          	j	80005260 <push_off+0x34>

00000000800052a0 <pop_off>:
    800052a0:	ff010113          	addi	sp,sp,-16
    800052a4:	00813023          	sd	s0,0(sp)
    800052a8:	00113423          	sd	ra,8(sp)
    800052ac:	01010413          	addi	s0,sp,16
    800052b0:	ffffe097          	auipc	ra,0xffffe
    800052b4:	6a8080e7          	jalr	1704(ra) # 80003958 <mycpu>
    800052b8:	100027f3          	csrr	a5,sstatus
    800052bc:	0027f793          	andi	a5,a5,2
    800052c0:	04079663          	bnez	a5,8000530c <pop_off+0x6c>
    800052c4:	07852783          	lw	a5,120(a0)
    800052c8:	02f05a63          	blez	a5,800052fc <pop_off+0x5c>
    800052cc:	fff7871b          	addiw	a4,a5,-1
    800052d0:	06e52c23          	sw	a4,120(a0)
    800052d4:	00071c63          	bnez	a4,800052ec <pop_off+0x4c>
    800052d8:	07c52783          	lw	a5,124(a0)
    800052dc:	00078863          	beqz	a5,800052ec <pop_off+0x4c>
    800052e0:	100027f3          	csrr	a5,sstatus
    800052e4:	0027e793          	ori	a5,a5,2
    800052e8:	10079073          	csrw	sstatus,a5
    800052ec:	00813083          	ld	ra,8(sp)
    800052f0:	00013403          	ld	s0,0(sp)
    800052f4:	01010113          	addi	sp,sp,16
    800052f8:	00008067          	ret
    800052fc:	00001517          	auipc	a0,0x1
    80005300:	04c50513          	addi	a0,a0,76 # 80006348 <digits+0x48>
    80005304:	fffff097          	auipc	ra,0xfffff
    80005308:	018080e7          	jalr	24(ra) # 8000431c <panic>
    8000530c:	00001517          	auipc	a0,0x1
    80005310:	02450513          	addi	a0,a0,36 # 80006330 <digits+0x30>
    80005314:	fffff097          	auipc	ra,0xfffff
    80005318:	008080e7          	jalr	8(ra) # 8000431c <panic>

000000008000531c <push_on>:
    8000531c:	fe010113          	addi	sp,sp,-32
    80005320:	00813823          	sd	s0,16(sp)
    80005324:	00113c23          	sd	ra,24(sp)
    80005328:	00913423          	sd	s1,8(sp)
    8000532c:	02010413          	addi	s0,sp,32
    80005330:	100024f3          	csrr	s1,sstatus
    80005334:	100027f3          	csrr	a5,sstatus
    80005338:	0027e793          	ori	a5,a5,2
    8000533c:	10079073          	csrw	sstatus,a5
    80005340:	ffffe097          	auipc	ra,0xffffe
    80005344:	618080e7          	jalr	1560(ra) # 80003958 <mycpu>
    80005348:	07852783          	lw	a5,120(a0)
    8000534c:	02078663          	beqz	a5,80005378 <push_on+0x5c>
    80005350:	ffffe097          	auipc	ra,0xffffe
    80005354:	608080e7          	jalr	1544(ra) # 80003958 <mycpu>
    80005358:	07852783          	lw	a5,120(a0)
    8000535c:	01813083          	ld	ra,24(sp)
    80005360:	01013403          	ld	s0,16(sp)
    80005364:	0017879b          	addiw	a5,a5,1
    80005368:	06f52c23          	sw	a5,120(a0)
    8000536c:	00813483          	ld	s1,8(sp)
    80005370:	02010113          	addi	sp,sp,32
    80005374:	00008067          	ret
    80005378:	0014d493          	srli	s1,s1,0x1
    8000537c:	ffffe097          	auipc	ra,0xffffe
    80005380:	5dc080e7          	jalr	1500(ra) # 80003958 <mycpu>
    80005384:	0014f493          	andi	s1,s1,1
    80005388:	06952e23          	sw	s1,124(a0)
    8000538c:	fc5ff06f          	j	80005350 <push_on+0x34>

0000000080005390 <pop_on>:
    80005390:	ff010113          	addi	sp,sp,-16
    80005394:	00813023          	sd	s0,0(sp)
    80005398:	00113423          	sd	ra,8(sp)
    8000539c:	01010413          	addi	s0,sp,16
    800053a0:	ffffe097          	auipc	ra,0xffffe
    800053a4:	5b8080e7          	jalr	1464(ra) # 80003958 <mycpu>
    800053a8:	100027f3          	csrr	a5,sstatus
    800053ac:	0027f793          	andi	a5,a5,2
    800053b0:	04078463          	beqz	a5,800053f8 <pop_on+0x68>
    800053b4:	07852783          	lw	a5,120(a0)
    800053b8:	02f05863          	blez	a5,800053e8 <pop_on+0x58>
    800053bc:	fff7879b          	addiw	a5,a5,-1
    800053c0:	06f52c23          	sw	a5,120(a0)
    800053c4:	07853783          	ld	a5,120(a0)
    800053c8:	00079863          	bnez	a5,800053d8 <pop_on+0x48>
    800053cc:	100027f3          	csrr	a5,sstatus
    800053d0:	ffd7f793          	andi	a5,a5,-3
    800053d4:	10079073          	csrw	sstatus,a5
    800053d8:	00813083          	ld	ra,8(sp)
    800053dc:	00013403          	ld	s0,0(sp)
    800053e0:	01010113          	addi	sp,sp,16
    800053e4:	00008067          	ret
    800053e8:	00001517          	auipc	a0,0x1
    800053ec:	f8850513          	addi	a0,a0,-120 # 80006370 <digits+0x70>
    800053f0:	fffff097          	auipc	ra,0xfffff
    800053f4:	f2c080e7          	jalr	-212(ra) # 8000431c <panic>
    800053f8:	00001517          	auipc	a0,0x1
    800053fc:	f5850513          	addi	a0,a0,-168 # 80006350 <digits+0x50>
    80005400:	fffff097          	auipc	ra,0xfffff
    80005404:	f1c080e7          	jalr	-228(ra) # 8000431c <panic>

0000000080005408 <__memset>:
    80005408:	ff010113          	addi	sp,sp,-16
    8000540c:	00813423          	sd	s0,8(sp)
    80005410:	01010413          	addi	s0,sp,16
    80005414:	1a060e63          	beqz	a2,800055d0 <__memset+0x1c8>
    80005418:	40a007b3          	neg	a5,a0
    8000541c:	0077f793          	andi	a5,a5,7
    80005420:	00778693          	addi	a3,a5,7
    80005424:	00b00813          	li	a6,11
    80005428:	0ff5f593          	andi	a1,a1,255
    8000542c:	fff6071b          	addiw	a4,a2,-1
    80005430:	1b06e663          	bltu	a3,a6,800055dc <__memset+0x1d4>
    80005434:	1cd76463          	bltu	a4,a3,800055fc <__memset+0x1f4>
    80005438:	1a078e63          	beqz	a5,800055f4 <__memset+0x1ec>
    8000543c:	00b50023          	sb	a1,0(a0)
    80005440:	00100713          	li	a4,1
    80005444:	1ae78463          	beq	a5,a4,800055ec <__memset+0x1e4>
    80005448:	00b500a3          	sb	a1,1(a0)
    8000544c:	00200713          	li	a4,2
    80005450:	1ae78a63          	beq	a5,a4,80005604 <__memset+0x1fc>
    80005454:	00b50123          	sb	a1,2(a0)
    80005458:	00300713          	li	a4,3
    8000545c:	18e78463          	beq	a5,a4,800055e4 <__memset+0x1dc>
    80005460:	00b501a3          	sb	a1,3(a0)
    80005464:	00400713          	li	a4,4
    80005468:	1ae78263          	beq	a5,a4,8000560c <__memset+0x204>
    8000546c:	00b50223          	sb	a1,4(a0)
    80005470:	00500713          	li	a4,5
    80005474:	1ae78063          	beq	a5,a4,80005614 <__memset+0x20c>
    80005478:	00b502a3          	sb	a1,5(a0)
    8000547c:	00700713          	li	a4,7
    80005480:	18e79e63          	bne	a5,a4,8000561c <__memset+0x214>
    80005484:	00b50323          	sb	a1,6(a0)
    80005488:	00700e93          	li	t4,7
    8000548c:	00859713          	slli	a4,a1,0x8
    80005490:	00e5e733          	or	a4,a1,a4
    80005494:	01059e13          	slli	t3,a1,0x10
    80005498:	01c76e33          	or	t3,a4,t3
    8000549c:	01859313          	slli	t1,a1,0x18
    800054a0:	006e6333          	or	t1,t3,t1
    800054a4:	02059893          	slli	a7,a1,0x20
    800054a8:	40f60e3b          	subw	t3,a2,a5
    800054ac:	011368b3          	or	a7,t1,a7
    800054b0:	02859813          	slli	a6,a1,0x28
    800054b4:	0108e833          	or	a6,a7,a6
    800054b8:	03059693          	slli	a3,a1,0x30
    800054bc:	003e589b          	srliw	a7,t3,0x3
    800054c0:	00d866b3          	or	a3,a6,a3
    800054c4:	03859713          	slli	a4,a1,0x38
    800054c8:	00389813          	slli	a6,a7,0x3
    800054cc:	00f507b3          	add	a5,a0,a5
    800054d0:	00e6e733          	or	a4,a3,a4
    800054d4:	000e089b          	sext.w	a7,t3
    800054d8:	00f806b3          	add	a3,a6,a5
    800054dc:	00e7b023          	sd	a4,0(a5)
    800054e0:	00878793          	addi	a5,a5,8
    800054e4:	fed79ce3          	bne	a5,a3,800054dc <__memset+0xd4>
    800054e8:	ff8e7793          	andi	a5,t3,-8
    800054ec:	0007871b          	sext.w	a4,a5
    800054f0:	01d787bb          	addw	a5,a5,t4
    800054f4:	0ce88e63          	beq	a7,a4,800055d0 <__memset+0x1c8>
    800054f8:	00f50733          	add	a4,a0,a5
    800054fc:	00b70023          	sb	a1,0(a4)
    80005500:	0017871b          	addiw	a4,a5,1
    80005504:	0cc77663          	bgeu	a4,a2,800055d0 <__memset+0x1c8>
    80005508:	00e50733          	add	a4,a0,a4
    8000550c:	00b70023          	sb	a1,0(a4)
    80005510:	0027871b          	addiw	a4,a5,2
    80005514:	0ac77e63          	bgeu	a4,a2,800055d0 <__memset+0x1c8>
    80005518:	00e50733          	add	a4,a0,a4
    8000551c:	00b70023          	sb	a1,0(a4)
    80005520:	0037871b          	addiw	a4,a5,3
    80005524:	0ac77663          	bgeu	a4,a2,800055d0 <__memset+0x1c8>
    80005528:	00e50733          	add	a4,a0,a4
    8000552c:	00b70023          	sb	a1,0(a4)
    80005530:	0047871b          	addiw	a4,a5,4
    80005534:	08c77e63          	bgeu	a4,a2,800055d0 <__memset+0x1c8>
    80005538:	00e50733          	add	a4,a0,a4
    8000553c:	00b70023          	sb	a1,0(a4)
    80005540:	0057871b          	addiw	a4,a5,5
    80005544:	08c77663          	bgeu	a4,a2,800055d0 <__memset+0x1c8>
    80005548:	00e50733          	add	a4,a0,a4
    8000554c:	00b70023          	sb	a1,0(a4)
    80005550:	0067871b          	addiw	a4,a5,6
    80005554:	06c77e63          	bgeu	a4,a2,800055d0 <__memset+0x1c8>
    80005558:	00e50733          	add	a4,a0,a4
    8000555c:	00b70023          	sb	a1,0(a4)
    80005560:	0077871b          	addiw	a4,a5,7
    80005564:	06c77663          	bgeu	a4,a2,800055d0 <__memset+0x1c8>
    80005568:	00e50733          	add	a4,a0,a4
    8000556c:	00b70023          	sb	a1,0(a4)
    80005570:	0087871b          	addiw	a4,a5,8
    80005574:	04c77e63          	bgeu	a4,a2,800055d0 <__memset+0x1c8>
    80005578:	00e50733          	add	a4,a0,a4
    8000557c:	00b70023          	sb	a1,0(a4)
    80005580:	0097871b          	addiw	a4,a5,9
    80005584:	04c77663          	bgeu	a4,a2,800055d0 <__memset+0x1c8>
    80005588:	00e50733          	add	a4,a0,a4
    8000558c:	00b70023          	sb	a1,0(a4)
    80005590:	00a7871b          	addiw	a4,a5,10
    80005594:	02c77e63          	bgeu	a4,a2,800055d0 <__memset+0x1c8>
    80005598:	00e50733          	add	a4,a0,a4
    8000559c:	00b70023          	sb	a1,0(a4)
    800055a0:	00b7871b          	addiw	a4,a5,11
    800055a4:	02c77663          	bgeu	a4,a2,800055d0 <__memset+0x1c8>
    800055a8:	00e50733          	add	a4,a0,a4
    800055ac:	00b70023          	sb	a1,0(a4)
    800055b0:	00c7871b          	addiw	a4,a5,12
    800055b4:	00c77e63          	bgeu	a4,a2,800055d0 <__memset+0x1c8>
    800055b8:	00e50733          	add	a4,a0,a4
    800055bc:	00b70023          	sb	a1,0(a4)
    800055c0:	00d7879b          	addiw	a5,a5,13
    800055c4:	00c7f663          	bgeu	a5,a2,800055d0 <__memset+0x1c8>
    800055c8:	00f507b3          	add	a5,a0,a5
    800055cc:	00b78023          	sb	a1,0(a5)
    800055d0:	00813403          	ld	s0,8(sp)
    800055d4:	01010113          	addi	sp,sp,16
    800055d8:	00008067          	ret
    800055dc:	00b00693          	li	a3,11
    800055e0:	e55ff06f          	j	80005434 <__memset+0x2c>
    800055e4:	00300e93          	li	t4,3
    800055e8:	ea5ff06f          	j	8000548c <__memset+0x84>
    800055ec:	00100e93          	li	t4,1
    800055f0:	e9dff06f          	j	8000548c <__memset+0x84>
    800055f4:	00000e93          	li	t4,0
    800055f8:	e95ff06f          	j	8000548c <__memset+0x84>
    800055fc:	00000793          	li	a5,0
    80005600:	ef9ff06f          	j	800054f8 <__memset+0xf0>
    80005604:	00200e93          	li	t4,2
    80005608:	e85ff06f          	j	8000548c <__memset+0x84>
    8000560c:	00400e93          	li	t4,4
    80005610:	e7dff06f          	j	8000548c <__memset+0x84>
    80005614:	00500e93          	li	t4,5
    80005618:	e75ff06f          	j	8000548c <__memset+0x84>
    8000561c:	00600e93          	li	t4,6
    80005620:	e6dff06f          	j	8000548c <__memset+0x84>

0000000080005624 <__memmove>:
    80005624:	ff010113          	addi	sp,sp,-16
    80005628:	00813423          	sd	s0,8(sp)
    8000562c:	01010413          	addi	s0,sp,16
    80005630:	0e060863          	beqz	a2,80005720 <__memmove+0xfc>
    80005634:	fff6069b          	addiw	a3,a2,-1
    80005638:	0006881b          	sext.w	a6,a3
    8000563c:	0ea5e863          	bltu	a1,a0,8000572c <__memmove+0x108>
    80005640:	00758713          	addi	a4,a1,7
    80005644:	00a5e7b3          	or	a5,a1,a0
    80005648:	40a70733          	sub	a4,a4,a0
    8000564c:	0077f793          	andi	a5,a5,7
    80005650:	00f73713          	sltiu	a4,a4,15
    80005654:	00174713          	xori	a4,a4,1
    80005658:	0017b793          	seqz	a5,a5
    8000565c:	00e7f7b3          	and	a5,a5,a4
    80005660:	10078863          	beqz	a5,80005770 <__memmove+0x14c>
    80005664:	00900793          	li	a5,9
    80005668:	1107f463          	bgeu	a5,a6,80005770 <__memmove+0x14c>
    8000566c:	0036581b          	srliw	a6,a2,0x3
    80005670:	fff8081b          	addiw	a6,a6,-1
    80005674:	02081813          	slli	a6,a6,0x20
    80005678:	01d85893          	srli	a7,a6,0x1d
    8000567c:	00858813          	addi	a6,a1,8
    80005680:	00058793          	mv	a5,a1
    80005684:	00050713          	mv	a4,a0
    80005688:	01088833          	add	a6,a7,a6
    8000568c:	0007b883          	ld	a7,0(a5)
    80005690:	00878793          	addi	a5,a5,8
    80005694:	00870713          	addi	a4,a4,8
    80005698:	ff173c23          	sd	a7,-8(a4)
    8000569c:	ff0798e3          	bne	a5,a6,8000568c <__memmove+0x68>
    800056a0:	ff867713          	andi	a4,a2,-8
    800056a4:	02071793          	slli	a5,a4,0x20
    800056a8:	0207d793          	srli	a5,a5,0x20
    800056ac:	00f585b3          	add	a1,a1,a5
    800056b0:	40e686bb          	subw	a3,a3,a4
    800056b4:	00f507b3          	add	a5,a0,a5
    800056b8:	06e60463          	beq	a2,a4,80005720 <__memmove+0xfc>
    800056bc:	0005c703          	lbu	a4,0(a1)
    800056c0:	00e78023          	sb	a4,0(a5)
    800056c4:	04068e63          	beqz	a3,80005720 <__memmove+0xfc>
    800056c8:	0015c603          	lbu	a2,1(a1)
    800056cc:	00100713          	li	a4,1
    800056d0:	00c780a3          	sb	a2,1(a5)
    800056d4:	04e68663          	beq	a3,a4,80005720 <__memmove+0xfc>
    800056d8:	0025c603          	lbu	a2,2(a1)
    800056dc:	00200713          	li	a4,2
    800056e0:	00c78123          	sb	a2,2(a5)
    800056e4:	02e68e63          	beq	a3,a4,80005720 <__memmove+0xfc>
    800056e8:	0035c603          	lbu	a2,3(a1)
    800056ec:	00300713          	li	a4,3
    800056f0:	00c781a3          	sb	a2,3(a5)
    800056f4:	02e68663          	beq	a3,a4,80005720 <__memmove+0xfc>
    800056f8:	0045c603          	lbu	a2,4(a1)
    800056fc:	00400713          	li	a4,4
    80005700:	00c78223          	sb	a2,4(a5)
    80005704:	00e68e63          	beq	a3,a4,80005720 <__memmove+0xfc>
    80005708:	0055c603          	lbu	a2,5(a1)
    8000570c:	00500713          	li	a4,5
    80005710:	00c782a3          	sb	a2,5(a5)
    80005714:	00e68663          	beq	a3,a4,80005720 <__memmove+0xfc>
    80005718:	0065c703          	lbu	a4,6(a1)
    8000571c:	00e78323          	sb	a4,6(a5)
    80005720:	00813403          	ld	s0,8(sp)
    80005724:	01010113          	addi	sp,sp,16
    80005728:	00008067          	ret
    8000572c:	02061713          	slli	a4,a2,0x20
    80005730:	02075713          	srli	a4,a4,0x20
    80005734:	00e587b3          	add	a5,a1,a4
    80005738:	f0f574e3          	bgeu	a0,a5,80005640 <__memmove+0x1c>
    8000573c:	02069613          	slli	a2,a3,0x20
    80005740:	02065613          	srli	a2,a2,0x20
    80005744:	fff64613          	not	a2,a2
    80005748:	00e50733          	add	a4,a0,a4
    8000574c:	00c78633          	add	a2,a5,a2
    80005750:	fff7c683          	lbu	a3,-1(a5)
    80005754:	fff78793          	addi	a5,a5,-1
    80005758:	fff70713          	addi	a4,a4,-1
    8000575c:	00d70023          	sb	a3,0(a4)
    80005760:	fec798e3          	bne	a5,a2,80005750 <__memmove+0x12c>
    80005764:	00813403          	ld	s0,8(sp)
    80005768:	01010113          	addi	sp,sp,16
    8000576c:	00008067          	ret
    80005770:	02069713          	slli	a4,a3,0x20
    80005774:	02075713          	srli	a4,a4,0x20
    80005778:	00170713          	addi	a4,a4,1
    8000577c:	00e50733          	add	a4,a0,a4
    80005780:	00050793          	mv	a5,a0
    80005784:	0005c683          	lbu	a3,0(a1)
    80005788:	00178793          	addi	a5,a5,1
    8000578c:	00158593          	addi	a1,a1,1
    80005790:	fed78fa3          	sb	a3,-1(a5)
    80005794:	fee798e3          	bne	a5,a4,80005784 <__memmove+0x160>
    80005798:	f89ff06f          	j	80005720 <__memmove+0xfc>

000000008000579c <__mem_free>:
    8000579c:	ff010113          	addi	sp,sp,-16
    800057a0:	00813423          	sd	s0,8(sp)
    800057a4:	01010413          	addi	s0,sp,16
    800057a8:	00002597          	auipc	a1,0x2
    800057ac:	e4058593          	addi	a1,a1,-448 # 800075e8 <freep>
    800057b0:	0005b783          	ld	a5,0(a1)
    800057b4:	ff050693          	addi	a3,a0,-16
    800057b8:	0007b703          	ld	a4,0(a5)
    800057bc:	00d7fc63          	bgeu	a5,a3,800057d4 <__mem_free+0x38>
    800057c0:	00e6ee63          	bltu	a3,a4,800057dc <__mem_free+0x40>
    800057c4:	00e7fc63          	bgeu	a5,a4,800057dc <__mem_free+0x40>
    800057c8:	00070793          	mv	a5,a4
    800057cc:	0007b703          	ld	a4,0(a5)
    800057d0:	fed7e8e3          	bltu	a5,a3,800057c0 <__mem_free+0x24>
    800057d4:	fee7eae3          	bltu	a5,a4,800057c8 <__mem_free+0x2c>
    800057d8:	fee6f8e3          	bgeu	a3,a4,800057c8 <__mem_free+0x2c>
    800057dc:	ff852803          	lw	a6,-8(a0)
    800057e0:	02081613          	slli	a2,a6,0x20
    800057e4:	01c65613          	srli	a2,a2,0x1c
    800057e8:	00c68633          	add	a2,a3,a2
    800057ec:	02c70a63          	beq	a4,a2,80005820 <__mem_free+0x84>
    800057f0:	fee53823          	sd	a4,-16(a0)
    800057f4:	0087a503          	lw	a0,8(a5)
    800057f8:	02051613          	slli	a2,a0,0x20
    800057fc:	01c65613          	srli	a2,a2,0x1c
    80005800:	00c78633          	add	a2,a5,a2
    80005804:	04c68263          	beq	a3,a2,80005848 <__mem_free+0xac>
    80005808:	00813403          	ld	s0,8(sp)
    8000580c:	00d7b023          	sd	a3,0(a5)
    80005810:	00f5b023          	sd	a5,0(a1)
    80005814:	00000513          	li	a0,0
    80005818:	01010113          	addi	sp,sp,16
    8000581c:	00008067          	ret
    80005820:	00872603          	lw	a2,8(a4)
    80005824:	00073703          	ld	a4,0(a4)
    80005828:	0106083b          	addw	a6,a2,a6
    8000582c:	ff052c23          	sw	a6,-8(a0)
    80005830:	fee53823          	sd	a4,-16(a0)
    80005834:	0087a503          	lw	a0,8(a5)
    80005838:	02051613          	slli	a2,a0,0x20
    8000583c:	01c65613          	srli	a2,a2,0x1c
    80005840:	00c78633          	add	a2,a5,a2
    80005844:	fcc692e3          	bne	a3,a2,80005808 <__mem_free+0x6c>
    80005848:	00813403          	ld	s0,8(sp)
    8000584c:	0105053b          	addw	a0,a0,a6
    80005850:	00a7a423          	sw	a0,8(a5)
    80005854:	00e7b023          	sd	a4,0(a5)
    80005858:	00f5b023          	sd	a5,0(a1)
    8000585c:	00000513          	li	a0,0
    80005860:	01010113          	addi	sp,sp,16
    80005864:	00008067          	ret

0000000080005868 <__mem_alloc>:
    80005868:	fc010113          	addi	sp,sp,-64
    8000586c:	02813823          	sd	s0,48(sp)
    80005870:	02913423          	sd	s1,40(sp)
    80005874:	03213023          	sd	s2,32(sp)
    80005878:	01513423          	sd	s5,8(sp)
    8000587c:	02113c23          	sd	ra,56(sp)
    80005880:	01313c23          	sd	s3,24(sp)
    80005884:	01413823          	sd	s4,16(sp)
    80005888:	01613023          	sd	s6,0(sp)
    8000588c:	04010413          	addi	s0,sp,64
    80005890:	00002a97          	auipc	s5,0x2
    80005894:	d58a8a93          	addi	s5,s5,-680 # 800075e8 <freep>
    80005898:	00f50913          	addi	s2,a0,15
    8000589c:	000ab683          	ld	a3,0(s5)
    800058a0:	00495913          	srli	s2,s2,0x4
    800058a4:	0019049b          	addiw	s1,s2,1
    800058a8:	00048913          	mv	s2,s1
    800058ac:	0c068c63          	beqz	a3,80005984 <__mem_alloc+0x11c>
    800058b0:	0006b503          	ld	a0,0(a3)
    800058b4:	00852703          	lw	a4,8(a0)
    800058b8:	10977063          	bgeu	a4,s1,800059b8 <__mem_alloc+0x150>
    800058bc:	000017b7          	lui	a5,0x1
    800058c0:	0009099b          	sext.w	s3,s2
    800058c4:	0af4e863          	bltu	s1,a5,80005974 <__mem_alloc+0x10c>
    800058c8:	02099a13          	slli	s4,s3,0x20
    800058cc:	01ca5a13          	srli	s4,s4,0x1c
    800058d0:	fff00b13          	li	s6,-1
    800058d4:	0100006f          	j	800058e4 <__mem_alloc+0x7c>
    800058d8:	0007b503          	ld	a0,0(a5) # 1000 <_entry-0x7ffff000>
    800058dc:	00852703          	lw	a4,8(a0)
    800058e0:	04977463          	bgeu	a4,s1,80005928 <__mem_alloc+0xc0>
    800058e4:	00050793          	mv	a5,a0
    800058e8:	fea698e3          	bne	a3,a0,800058d8 <__mem_alloc+0x70>
    800058ec:	000a0513          	mv	a0,s4
    800058f0:	00000097          	auipc	ra,0x0
    800058f4:	1f0080e7          	jalr	496(ra) # 80005ae0 <kvmincrease>
    800058f8:	00050793          	mv	a5,a0
    800058fc:	01050513          	addi	a0,a0,16
    80005900:	07678e63          	beq	a5,s6,8000597c <__mem_alloc+0x114>
    80005904:	0137a423          	sw	s3,8(a5)
    80005908:	00000097          	auipc	ra,0x0
    8000590c:	e94080e7          	jalr	-364(ra) # 8000579c <__mem_free>
    80005910:	000ab783          	ld	a5,0(s5)
    80005914:	06078463          	beqz	a5,8000597c <__mem_alloc+0x114>
    80005918:	0007b503          	ld	a0,0(a5)
    8000591c:	00078693          	mv	a3,a5
    80005920:	00852703          	lw	a4,8(a0)
    80005924:	fc9760e3          	bltu	a4,s1,800058e4 <__mem_alloc+0x7c>
    80005928:	08e48263          	beq	s1,a4,800059ac <__mem_alloc+0x144>
    8000592c:	4127073b          	subw	a4,a4,s2
    80005930:	02071693          	slli	a3,a4,0x20
    80005934:	01c6d693          	srli	a3,a3,0x1c
    80005938:	00e52423          	sw	a4,8(a0)
    8000593c:	00d50533          	add	a0,a0,a3
    80005940:	01252423          	sw	s2,8(a0)
    80005944:	00fab023          	sd	a5,0(s5)
    80005948:	01050513          	addi	a0,a0,16
    8000594c:	03813083          	ld	ra,56(sp)
    80005950:	03013403          	ld	s0,48(sp)
    80005954:	02813483          	ld	s1,40(sp)
    80005958:	02013903          	ld	s2,32(sp)
    8000595c:	01813983          	ld	s3,24(sp)
    80005960:	01013a03          	ld	s4,16(sp)
    80005964:	00813a83          	ld	s5,8(sp)
    80005968:	00013b03          	ld	s6,0(sp)
    8000596c:	04010113          	addi	sp,sp,64
    80005970:	00008067          	ret
    80005974:	000019b7          	lui	s3,0x1
    80005978:	f51ff06f          	j	800058c8 <__mem_alloc+0x60>
    8000597c:	00000513          	li	a0,0
    80005980:	fcdff06f          	j	8000594c <__mem_alloc+0xe4>
    80005984:	00003797          	auipc	a5,0x3
    80005988:	f0c78793          	addi	a5,a5,-244 # 80008890 <base>
    8000598c:	00078513          	mv	a0,a5
    80005990:	00fab023          	sd	a5,0(s5)
    80005994:	00f7b023          	sd	a5,0(a5)
    80005998:	00000713          	li	a4,0
    8000599c:	00003797          	auipc	a5,0x3
    800059a0:	ee07ae23          	sw	zero,-260(a5) # 80008898 <base+0x8>
    800059a4:	00050693          	mv	a3,a0
    800059a8:	f11ff06f          	j	800058b8 <__mem_alloc+0x50>
    800059ac:	00053703          	ld	a4,0(a0)
    800059b0:	00e7b023          	sd	a4,0(a5)
    800059b4:	f91ff06f          	j	80005944 <__mem_alloc+0xdc>
    800059b8:	00068793          	mv	a5,a3
    800059bc:	f6dff06f          	j	80005928 <__mem_alloc+0xc0>

00000000800059c0 <__putc>:
    800059c0:	fe010113          	addi	sp,sp,-32
    800059c4:	00813823          	sd	s0,16(sp)
    800059c8:	00113c23          	sd	ra,24(sp)
    800059cc:	02010413          	addi	s0,sp,32
    800059d0:	00050793          	mv	a5,a0
    800059d4:	fef40593          	addi	a1,s0,-17
    800059d8:	00100613          	li	a2,1
    800059dc:	00000513          	li	a0,0
    800059e0:	fef407a3          	sb	a5,-17(s0)
    800059e4:	fffff097          	auipc	ra,0xfffff
    800059e8:	918080e7          	jalr	-1768(ra) # 800042fc <console_write>
    800059ec:	01813083          	ld	ra,24(sp)
    800059f0:	01013403          	ld	s0,16(sp)
    800059f4:	02010113          	addi	sp,sp,32
    800059f8:	00008067          	ret

00000000800059fc <__getc>:
    800059fc:	fe010113          	addi	sp,sp,-32
    80005a00:	00813823          	sd	s0,16(sp)
    80005a04:	00113c23          	sd	ra,24(sp)
    80005a08:	02010413          	addi	s0,sp,32
    80005a0c:	fe840593          	addi	a1,s0,-24
    80005a10:	00100613          	li	a2,1
    80005a14:	00000513          	li	a0,0
    80005a18:	fffff097          	auipc	ra,0xfffff
    80005a1c:	8c4080e7          	jalr	-1852(ra) # 800042dc <console_read>
    80005a20:	fe844503          	lbu	a0,-24(s0)
    80005a24:	01813083          	ld	ra,24(sp)
    80005a28:	01013403          	ld	s0,16(sp)
    80005a2c:	02010113          	addi	sp,sp,32
    80005a30:	00008067          	ret

0000000080005a34 <console_handler>:
    80005a34:	fe010113          	addi	sp,sp,-32
    80005a38:	00813823          	sd	s0,16(sp)
    80005a3c:	00113c23          	sd	ra,24(sp)
    80005a40:	00913423          	sd	s1,8(sp)
    80005a44:	02010413          	addi	s0,sp,32
    80005a48:	14202773          	csrr	a4,scause
    80005a4c:	100027f3          	csrr	a5,sstatus
    80005a50:	0027f793          	andi	a5,a5,2
    80005a54:	06079e63          	bnez	a5,80005ad0 <console_handler+0x9c>
    80005a58:	00074c63          	bltz	a4,80005a70 <console_handler+0x3c>
    80005a5c:	01813083          	ld	ra,24(sp)
    80005a60:	01013403          	ld	s0,16(sp)
    80005a64:	00813483          	ld	s1,8(sp)
    80005a68:	02010113          	addi	sp,sp,32
    80005a6c:	00008067          	ret
    80005a70:	0ff77713          	andi	a4,a4,255
    80005a74:	00900793          	li	a5,9
    80005a78:	fef712e3          	bne	a4,a5,80005a5c <console_handler+0x28>
    80005a7c:	ffffe097          	auipc	ra,0xffffe
    80005a80:	4b8080e7          	jalr	1208(ra) # 80003f34 <plic_claim>
    80005a84:	00a00793          	li	a5,10
    80005a88:	00050493          	mv	s1,a0
    80005a8c:	02f50c63          	beq	a0,a5,80005ac4 <console_handler+0x90>
    80005a90:	fc0506e3          	beqz	a0,80005a5c <console_handler+0x28>
    80005a94:	00050593          	mv	a1,a0
    80005a98:	00000517          	auipc	a0,0x0
    80005a9c:	7e050513          	addi	a0,a0,2016 # 80006278 <kvmincrease+0x798>
    80005aa0:	fffff097          	auipc	ra,0xfffff
    80005aa4:	8d8080e7          	jalr	-1832(ra) # 80004378 <__printf>
    80005aa8:	01013403          	ld	s0,16(sp)
    80005aac:	01813083          	ld	ra,24(sp)
    80005ab0:	00048513          	mv	a0,s1
    80005ab4:	00813483          	ld	s1,8(sp)
    80005ab8:	02010113          	addi	sp,sp,32
    80005abc:	ffffe317          	auipc	t1,0xffffe
    80005ac0:	4b030067          	jr	1200(t1) # 80003f6c <plic_complete>
    80005ac4:	fffff097          	auipc	ra,0xfffff
    80005ac8:	1bc080e7          	jalr	444(ra) # 80004c80 <uartintr>
    80005acc:	fddff06f          	j	80005aa8 <console_handler+0x74>
    80005ad0:	00001517          	auipc	a0,0x1
    80005ad4:	8a850513          	addi	a0,a0,-1880 # 80006378 <digits+0x78>
    80005ad8:	fffff097          	auipc	ra,0xfffff
    80005adc:	844080e7          	jalr	-1980(ra) # 8000431c <panic>

0000000080005ae0 <kvmincrease>:
    80005ae0:	fe010113          	addi	sp,sp,-32
    80005ae4:	01213023          	sd	s2,0(sp)
    80005ae8:	00001937          	lui	s2,0x1
    80005aec:	fff90913          	addi	s2,s2,-1 # fff <_entry-0x7ffff001>
    80005af0:	00813823          	sd	s0,16(sp)
    80005af4:	00113c23          	sd	ra,24(sp)
    80005af8:	00913423          	sd	s1,8(sp)
    80005afc:	02010413          	addi	s0,sp,32
    80005b00:	01250933          	add	s2,a0,s2
    80005b04:	00c95913          	srli	s2,s2,0xc
    80005b08:	02090863          	beqz	s2,80005b38 <kvmincrease+0x58>
    80005b0c:	00000493          	li	s1,0
    80005b10:	00148493          	addi	s1,s1,1
    80005b14:	fffff097          	auipc	ra,0xfffff
    80005b18:	4bc080e7          	jalr	1212(ra) # 80004fd0 <kalloc>
    80005b1c:	fe991ae3          	bne	s2,s1,80005b10 <kvmincrease+0x30>
    80005b20:	01813083          	ld	ra,24(sp)
    80005b24:	01013403          	ld	s0,16(sp)
    80005b28:	00813483          	ld	s1,8(sp)
    80005b2c:	00013903          	ld	s2,0(sp)
    80005b30:	02010113          	addi	sp,sp,32
    80005b34:	00008067          	ret
    80005b38:	01813083          	ld	ra,24(sp)
    80005b3c:	01013403          	ld	s0,16(sp)
    80005b40:	00813483          	ld	s1,8(sp)
    80005b44:	00013903          	ld	s2,0(sp)
    80005b48:	00000513          	li	a0,0
    80005b4c:	02010113          	addi	sp,sp,32
    80005b50:	00008067          	ret
	...
