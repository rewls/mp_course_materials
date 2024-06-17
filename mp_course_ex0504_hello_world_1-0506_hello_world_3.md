# mp_course_ex0504_hello_world_1-0506_hello_world_3

## mp_course_ex0504_hello_world_1_stmvldisco_baremetal_qemu

### Debug

- `output/mp_course_ex0504_hello_world_1_stm32vldisco_baremetal_qemu/app.s`

```as
080001e0 <appmain>:
appmain():
/home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0504_hello_world_1/appmain.c:14
 80001e0:	b580      	push	{r7, lr}
 80001e2:	b082      	sub	sp, #8
 80001e4:	af00      	add	r7, sp, #0
 80001e6:	6078      	str	r0, [r7, #4]
 80001e8:	6039      	str	r1, [r7, #0]
/home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0504_hello_world_1/appmain.c:15
 80001ea:	4804      	ldr	r0, [pc, #16]	; (80001fc <appmain+0x1c>)
 80001ec:	f002 f852 	bl	8002294 <iprintf>
/home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0504_hello_world_1/appmain.c:17
 80001f0:	2300      	movs	r3, #0
/home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0504_hello_world_1/appmain.c:18
 80001f2:	4618      	mov	r0, r3
 80001f4:	3708      	adds	r7, #8
 80001f6:	46bd      	mov	sp, r7
 80001f8:	bd80      	pop	{r7, pc}
 80001fa:	bf00      	nop
 80001fc:	20000180 	.word	0x20000180
```

```c
Breakpoint 2, appmain (argc=1, argv=0x20001fec) at /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0504_hello_world_1/appmain.c:15
15          printf(msgstr);
(gdb) l
10
11      static char msgstr[] = "Hello World!\n"; // Define a null-terminated string
12
13      int appmain(int argc, char * argv[])
14      {
15          printf(msgstr);
16
17          return 0;
18      }
19
(gdb) x/wx appmain+0x1c
0x80001fc <appmain+28>: 0x20000180
(gdb) x/s 0x20000180
0x20000180 <msgstr>:    "Hello World!\n"
(gdb) p msgstr
$1 = "Hello World!\n"
```

## mp_course_ex0505_hello_world_2_stmvldisco_baremetal_qemu

### Source

```as
msgstr:
    .asciz "Hello World!\n" @ Define a null-terminated string
```

- Modern Assembly Language Programming with the ARM Processor > Chapter 2 GNU Assembly Syntax

```as
$ arm-none-eabi-as mp_course_ex0505_hello_world_2/appmain.S -al
ARM GAS  mp_course_ex0505_hello_world_2/appmain.S                       page 1


...
  12                        .data
  13
  14                        .align 2
  15                    msgstr:
  16 0000 48656C6C          .asciz "Hello World!\n" @ Define a null-terminated string
  16      6F20576F
  16      726C6421
  16      0A00
  17
  18                        .text
  19                        .thumb
  20
  21                        .thumb_func
  22                        .align  1
...
```

```as
appmain:
    push    {r7, lr}
    sub     sp, #8
    add     r7, sp, #0
    str     r0, [r7, #4]
    str     r1, [r7, #0]

    ldr     r0, =msgstr
    bl      printf

    movs    r3, #0
    mov     r0, r3

    adds    r7, #8
    mov     sp, r7
    pop     {r7, pc}
```

### Debug

```as
26          push    {r7, lr}
(gdb) p/x $r7
$1 = 0x20001fe8
(gdb) p/x $lr
$2 = 0x80005f1
(gdb) x/2x $sp
0x20001fe0:     0x20001fe8      0x080005f1
```

```as
32          ldr     r0, =msgstr
(gdb) p msgstr
'msgstr' has unknown type; cast it to its declared type
(gdb) p (char)msgstr
$3 = 72 'H'
(gdb) p (char *)&msgstr
$4 = 0x20000180 "Hello World!\n"
(gdb) n
33          bl      printf
(gdb) p/x $r0
$5 = 0x20000180
(gdb) p printf
$6 = {<text variable, no debug info>} 0x8002294 <printf>
(gdb) x/19i printf
   0x8002294 <printf>:  push    {r0, r1, r2, r3}
   0x8002296 <printf+2>:        ldr     r3, [pc, #40]   ; (0x80022c0 <printf+44>)
   0x8002298 <printf+4>:        push    {r0, r1, r4, lr}
   0x800229a <printf+6>:        ldr     r4, [r3, #0]
   0x800229c <printf+8>:        cbz     r4, 0x80022a8 <printf+20>
   0x800229e <printf+10>:       ldr     r3, [r4, #24]
   0x80022a0 <printf+12>:       cbnz    r3, 0x80022a8 <printf+20>
   0x80022a2 <printf+14>:       mov     r0, r4
   0x80022a4 <printf+16>:       bl      0x800125c <__sinit>
   0x80022a8 <printf+20>:       add     r3, sp, #20
   0x80022aa <printf+22>:       mov     r0, r4
   0x80022ac <printf+24>:       ldr     r2, [sp, #16]
   0x80022ae <printf+26>:       ldr     r1, [r4, #8]
   0x80022b0 <printf+28>:       str     r3, [sp, #4]
   0x80022b2 <printf+30>:       bl      0x80053b0 <_vfprintf_r>
   0x80022b6 <printf+34>:       add     sp, #8
   0x80022b8 <printf+36>:       ldmia.w sp!, {r4, lr}
   0x80022bc <printf+40>:       add     sp, #16
   0x80022be <printf+42>:       bx      lr
```

## mp_course_ex0506_hello_world_3_stmvldisco_baremetal_qemu

### Source

```as
appmain:
    push    {lr}        @ push return address onto stack

    ldr     r0, =msgstr @ load pointer to format string
    bl      printf      @ printf("Hello World!\n");

    movs    r0, #0      @ move return code into r0

    pop     {pc}        @ return from appmain
```
