.extern _ZN5Riscv20handleSupervisorTrapEv       #i za ovo vazi name mangling

.align 4        #objasnjava na 14:00 min zasto mora da bude poravnata na 4, poslusaj opet
.global _ZN5Riscv14supervisorTrapEv
.type _ZN5Riscv14supervisorTrapEv, @function
#ovaj trap cemo morati da prijavimo masini da je to trap koji treba da bude pozivan prilikom obrade izuzetaka i to povlaci sa sobom upis u registar stvec(supervisor trap vector)
_ZN5Riscv14supervisorTrapEv:        #N je od namespace, a v je od void jer supervisorTrap nema parametre
    # push all registers to stack
    #s obzirom da se radi o prekidu koji dolazi asinhrono u bilo kom trenutku treba da obezbedimo u prekidnoj rutini da se sacuva kontekst procesora
    #koji je postojao neposredno pre trenutka prihvatanja ovog exceptiona.
    #s obzirom da se ovde radi o prekidnoj rutini nama je bitno da sacuvamo vrednosti svih registara
    addi sp, sp, -256
    .irp index, 0,1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr

    #da ne bismo pisali samu obradu prekida u asembleru nego da pisemo u c/c++ ovde pozivamo jednu fju i nju deklarisemo kao privatnu staticku fju u riscv.hpp
    call _ZN5Riscv20handleSupervisorTrapEv

    # pop all registers from stack
    .irp index, 0,1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    addi sp, sp, 256

    sret

#razlika izmedju trapa i obicne fje je sto se iz fje vracamo pseudo instrukcijom ret dok se iz trapa vracamo masinskom instrukcijom sret koja
#menja rezim privilegije u kojoj se kod izvrsava(iz statusnog registra sstatus se uzima informacija o tome u kom se rezimu privilegije izvrsavao
#kod pre nego sto se uslo u prekidnu rutinu i onda se sret instrukcijom vracamo u taj prethodni rezim i ono sto se jos gleda
#je da li su prekidi bili omoguceni ili ne pa se i to kao stanje restaurira i onda se vracamo na onu lokaciju iz koje smo usli u prekidnu rutinu
#i ta inf se nalazi u sepc registru tako da sret ne uzima ra reg i njega upisuje u pc vec uzima sepc reg