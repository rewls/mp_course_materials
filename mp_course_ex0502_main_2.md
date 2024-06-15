# mp_course_ex0502_main_2

## Source

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

- The Definitive Guide to ARM® Cortex<sup>®</sup>-M3 and Cortex<sup>®</sup>-M4 Processors > Chapter 5 Instruction Set

## Debug

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
```
