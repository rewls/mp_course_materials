# mp_course_ex0501_main_1-0503_main_3

## mp_course_ex0501_main_1_stm32vldisco_baremetal_qemu

### source

```c
int appmain(int argc, char * argv[])
{
    return 0;
}
```

### Debug

```c
(gdb) l
78      #endif
79
80          appmain(argc, argv);
81
82          for (;;) {
83          }
84
85          return 0;
86      }
87
(gdb) b 80
Breakpoint 2 at 0x80005e6: file /home/rewls/git/ubiworks/library/ubinos/source/ubinos/bsp/arch/arm/init.c, line 80.
(gdb) c
Continuing.

Breakpoint 2, main () at /home/rewls/git/ubiworks/library/ubinos/source/ubinos/bsp/arch/arm/init.c:80
80          appmain(argc, argv);
(gdb) info r
r0             0x0                 0
r1             0x200003c0          536871872
r2             0x0                 0
r3             0x0                 0
r4             0x0                 0
r5             0x0                 0
r6             0x0                 0
r7             0x20001fe8          536879080
r8             0x0                 0
r9             0x0                 0
r10            0x1fff2000          536813568
r11            0x0                 0
r12            0x0                 0
sp             0x20001fe8          0x20001fe8
lr             0x800074b           134219595
pc             0x80005e6           0x80005e6 <main+70>
xpsr           0x61000000          1627389952
msp            0x20001fe8          536879080
psp            0x0                 0
primask        0x0                 0
control        0x0                 0
basepri        0x0                 0
faultmask      0x0                 0
(gdb) s
appmain (argc=1, argv=0x20001fec) at /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0501_main_1/appmain.c:11
11          return 0;
(gdb) info r
r0             0x1                 1
r1             0x20001fec          536879084
r2             0x0                 0
r3             0x20001fec          536879084
r4             0x0                 0
r5             0x0                 0
r6             0x0                 0
r7             0x20001fd8          536879064
r8             0x0                 0
r9             0x0                 0
r10            0x1fff2000          536813568
r11            0x0                 0
r12            0x0                 0
sp             0x20001fd8          0x20001fd8
lr             0x80005f1           134219249
pc             0x80001ea           0x80001ea <appmain+10>
xpsr           0x1000000           16777216
msp            0x20001fd8          536879064
psp            0x0                 0
primask        0x0                 0
control        0x0                 0
basepri        0x0                 0
faultmask      0x0                 0
(gdb) x/11i appmain
   0x80001e0 <appmain>: push    {r7}
   0x80001e2 <appmain+2>:       sub     sp, #12
   0x80001e4 <appmain+4>:       add     r7, sp, #0
   0x80001e6 <appmain+6>:       str     r0, [r7, #4]
   0x80001e8 <appmain+8>:       str     r1, [r7, #0]
=> 0x80001ea <appmain+10>:      movs    r3, #0
   0x80001ec <appmain+12>:      mov     r0, r3
   0x80001ee <appmain+14>:      adds    r7, #12
   0x80001f0 <appmain+16>:      mov     sp, r7
   0x80001f2 <appmain+18>:      pop     {r7}
   0x80001f4 <appmain+20>:      bx      lr
(gdb) n
12      }
(gdb) info r
r0             0x1                 1
r1             0x20001fec          536879084
r2             0x0                 0
r3             0x0                 0
r4             0x0                 0
r5             0x0                 0
r6             0x0                 0
r7             0x20001fd8          536879064
r8             0x0                 0
r9             0x0                 0
r10            0x1fff2000          536813568
r11            0x0                 0
r12            0x0                 0
sp             0x20001fd8          0x20001fd8
lr             0x80005f1           134219249
pc             0x80001ec           0x80001ec <appmain+12>
xpsr           0x41000000          1090519040
msp            0x20001fd8          536879064
psp            0x0                 0
primask        0x0                 0
control        0x0                 0
basepri        0x0                 0
faultmask      0x0                 0
(gdb) x/11i appmain
   0x80001e0 <appmain>: push    {r7}
   0x80001e2 <appmain+2>:       sub     sp, #12
   0x80001e4 <appmain+4>:       add     r7, sp, #0
   0x80001e6 <appmain+6>:       str     r0, [r7, #4]
   0x80001e8 <appmain+8>:       str     r1, [r7, #0]
   0x80001ea <appmain+10>:      movs    r3, #0
=> 0x80001ec <appmain+12>:      mov     r0, r3
   0x80001ee <appmain+14>:      adds    r7, #12
   0x80001f0 <appmain+16>:      mov     sp, r7
   0x80001f2 <appmain+18>:      pop     {r7}
   0x80001f4 <appmain+20>:      bx      lr
(gdb)
main () at /home/rewls/git/ubiworks/library/ubinos/source/ubinos/bsp/arch/arm/init.c:82
82          for (;;) {
(gdb) info r
r0             0x0                 0
r1             0x20001fec          536879084
r2             0x0                 0
r3             0x0                 0
r4             0x0                 0
r5             0x0                 0
r6             0x0                 0
r7             0x20001fe8          536879080
r8             0x0                 0
r9             0x0                 0
r10            0x1fff2000          536813568
r11            0x0                 0
r12            0x0                 0
sp             0x20001fe8          0x20001fe8
lr             0x80005f1           134219249
pc             0x80005f0           0x80005f0 <main+80>
xpsr           0x1000000           16777216
msp            0x20001fe8          536879080
psp            0x0                 0
primask        0x0                 0
control        0x0                 0
basepri        0x0                 0
faultmask      0x0                 0
```

## mp_course_ex0502_main_2_stm32vldisco_baremetal_qemu

### Source

```as
    .syntax unified
    .arch   armv7-m
```

- Using as > 9 Machine Dependent Features

```as
    .text
```

- Modern Assembly Language Programming with the ARM Processor > Chapter 2 GNU Assembly Syntax

```as
    .thumb
    .thumb_func
```

- Using as > 9 Machine Dependent Features

```as
    .align  1
    .globl  appmain
```

- Modern Assembly Language Programming with the ARM Processor > Chapter 2 GNU Assembly Syntax

```as
    .type   appmain, %function
```

- Modern Assembly Language Programming with the ARM Processor > Chapter 7 Assembler Directives

```as
appmain:
```

- Modern Assembly Language Programming with the ARM Processor > Chapter 2 GNU Assembly Syntax

```as
    push    {r7}
    sub     sp, #12
    add     r7, sp, #0
 
    str     r0, [r7, #4]
    str     r1, [r7, #0]
 
    movs    r3, #0
    mov     r0, r3
 
    adds    r7, #12
    mov     sp, r7
    pop     {r7}
    bx      lr
```

- The Definitive Guide to ARM<sup>®</sup> Cortex<sup>®</sup>-M3 and Cortex<sup>®</sup>-M4 Processors > Chapter 5 Instruction Set

### Debug

```as
(gdb) b 80
Breakpoint 2 at 0x80005e6: file /home/rewls/git/ubiworks/library/ubinos/source/ubinos/bsp/arch/arm/init.c, line 80.
(gdb) c
Continuing.

Breakpoint 2, main () at /home/rewls/git/ubiworks/library/ubinos/source/ubinos/bsp/arch/arm/init.c:80
80          appmain(argc, argv);
(gdb) info r
r0             0x0                 0
r1             0x200003c0          536871872
r2             0x0                 0
r3             0x0                 0
r4             0x0                 0
r5             0x0                 0
r6             0x0                 0
r7             0x20001fe8          536879080
r8             0x0                 0
r9             0x0                 0
r10            0x1fff2000          536813568
r11            0x0                 0
r12            0x0                 0
sp             0x20001fe8          0x20001fe8
lr             0x800074b           134219595
pc             0x80005e6           0x80005e6 <main+70>
xpsr           0x61000000          1627389952
msp            0x20001fe8          536879080
psp            0x0                 0
primask        0x0                 0
control        0x0                 0
basepri        0x0                 0
faultmask      0x0                 0
```

```as
20          push    {r7}
(gdb) p/x $r7
$1 = 0x20001fe8
(gdb) p/x $sp
$2 = 0x20001fe8
(gdb) x/x $sp
0x20001fe8:     0x08000145
(gdb) n
21          sub     sp, #12
(gdb) p/x $sp
$3 = 0x20001fe4
(gdb) x/x $sp
0x20001fe4:     0x20001fe8
(gdb) n
22          add     r7, sp, #0
(gdb) p/x $sp
$4 = 0x20001fd8
(gdb) n
24          str     r0, [r7, #4]
(gdb) p/x $r7
$5 = 0x20001fd8
(gdb) p/x $r0
$6 = 0x1
(gdb) n
25          str     r1, [r7, #0]
(gdb) x/x $r7+4
0x20001fdc:     0x00000001
(gdb) p/x $r1
$7 = 0x20001fec
(gdb) n
27          movs    r3, #0
(gdb) x/x $r7
0x20001fd8:     0x20001fec
(gdb) p/x $r3
$8 = 0x20001fec
(gdb) n
28          mov     r0, r3
(gdb) p/x $r3
$9 = 0x0
(gdb) p/x $r0
$10 = 0x1
(gdb) n
30          adds    r7, #12
(gdb) p/x $r0
$11 = 0x0
(gdb) p/x $r7
$12 = 0x20001fd8
(gdb) n
31          mov     sp, r7
(gdb) p/x $r7
$13 = 0x20001fe4
(gdb) p/x $sp
$14 = 0x20001fd8
(gdb) n
appmain () at /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0502_main_2/appmain.S:32
32          pop     {r7}
(gdb) p/x $sp
$15 = 0x20001fe4
(gdb) x/x $sp
0x20001fe4:     0x20001fe8
(gdb) n
appmain () at /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0502_main_2/appmain.S:33
33          bx      lr
(gdb) p/x $r7
$16 = 0x20001fe8
(gdb) p/x $sp
$17 = 0x20001fe8
(gdb) p/x $lr
$18 = 0x80005d1
(gdb) n
main () at /home/rewls/git/ubiworks/library/ubinos/source/ubinos/bsp/arch/arm/init.c:82
82          for (;;) {
(gdb) p/x $pc
$19 = 0x80005d0
```

## mp_course_ex0503_main_3_stm32vldisco_baremetal_qemu

### Source

```as
appmain:
    movs    r0, #0
 
    bx      lr
```

### Debug

```as
(gdb) b 80
Breakpoint 2 at 0x80005c6: file /home/rewls/git/ubiworks/library/ubinos/source/ubinos/bsp/arch/arm/init.c, line 80.
(gdb) c
Continuing.

Breakpoint 2, main () at /home/rewls/git/ubiworks/library/ubinos/source/ubinos/bsp/arch/arm/init.c:80
80          appmain(argc, argv);
(gdb) info r
r0             0x0                 0
r1             0x200003c0          536871872
r2             0x0                 0
r3             0x0                 0
r4             0x0                 0
r5             0x0                 0
r6             0x0                 0
r7             0x20001fe8          536879080
r8             0x0                 0
r9             0x0                 0
r10            0x1fff2000          536813568
r11            0x0                 0
r12            0x0                 0
sp             0x20001fe8          0x20001fe8
lr             0x800072b           134219563
pc             0x80005c6           0x80005c6 <main+70>
xpsr           0x61000000          1627389952
msp            0x20001fe8          536879080
psp            0x0                 0
primask        0x0                 0
control        0x0                 0
basepri        0x0                 0
faultmask      0x0                 0
```
