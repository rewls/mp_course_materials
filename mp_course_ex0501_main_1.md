# mp_course_ex0501_main_1

> mp_course_ex0501_main_1_netduinoplus2_baremetal_qume

## source

```c
int appmain(int argc, char * argv[])
{
    return 0;
}
```

## Debug

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
Breakpoint 2 at 0x80004d6: file /home/rewls/git/ubiworks/library/ubinos/source/ubinos/bsp/arch/arm/init.c, line 80.
(gdb) c
Continuing.

Breakpoint 2, main () at /home/rewls/git/ubiworks/library/ubinos/source/ubinos/bsp/arch/arm/init.c:80
80          appmain(argc, argv);
(gdb) info r
r0             0x0                 0
r1             0x20000440          536872000
r2             0x0                 0
r3             0x0                 0
r4             0x0                 0
r5             0x0                 0
r6             0x0                 0
r7             0x2001ffe8          537001960
r8             0x0                 0
r9             0x0                 0
r10            0x20010000          536936448
r11            0x0                 0
r12            0x0                 0
sp             0x2001ffe8          0x2001ffe8
lr             0x800063b           134219323
pc             0x80004d6           0x80004d6 <main+70>
xpsr           0x61000000          1627389952
fpscr          0x0                 0
msp            0x2001ffe8          537001960
psp            0x0                 0
primask        0x0                 0
control        0x0                 0
basepri        0x0                 0
faultmask      0x0                 0
(gdb) s
appmain (argc=1, argv=0x2001ffec) at /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0501_main_1/appmain.c:11
11          return 0;
(gdb) info r
r0             0x1                 1
r1             0x2001ffec          537001964
r2             0x0                 0
r3             0x2001ffec          537001964
r4             0x0                 0
r5             0x0                 0
r6             0x0                 0
r7             0x2001ffd8          537001944
r8             0x0                 0
r9             0x0                 0
r10            0x20010000          536936448
r11            0x0                 0
r12            0x0                 0
sp             0x2001ffd8          0x2001ffd8
lr             0x80004e1           134218977
pc             0x800025a           0x800025a <appmain+10>
xpsr           0x1000000           16777216
fpscr          0x0                 0
msp            0x2001ffd8          537001944
psp            0x0                 0
primask        0x0                 0
control        0x0                 0
basepri        0x0                 0
faultmask      0x0                 0
(gdb) x/11i appmain
   0x8000250 <appmain>: push    {r7}
   0x8000252 <appmain+2>:       sub     sp, #12
   0x8000254 <appmain+4>:       add     r7, sp, #0
   0x8000256 <appmain+6>:       str     r0, [r7, #4]
   0x8000258 <appmain+8>:       str     r1, [r7, #0]
=> 0x800025a <appmain+10>:      movs    r3, #0
   0x800025c <appmain+12>:      mov     r0, r3
   0x800025e <appmain+14>:      adds    r7, #12
   0x8000260 <appmain+16>:      mov     sp, r7
   0x8000262 <appmain+18>:      ldr.w   r7, [sp], #4
   0x8000266 <appmain+22>:      bx      lr
(gdb) n
12      }
(gdb)
main () at /home/rewls/git/ubiworks/library/ubinos/source/ubinos/bsp/arch/arm/init.c:82
82          for (;;) {
(gdb) info r
r0             0x0                 0
r1             0x2001ffec          537001964
r2             0x0                 0
r3             0x0                 0
r4             0x0                 0
r5             0x0                 0
r6             0x0                 0
r7             0x2001ffe8          537001960
r8             0x0                 0
r9             0x0                 0
r10            0x20010000          536936448
r11            0x0                 0
r12            0x0                 0
sp             0x2001ffe8          0x2001ffe8
lr             0x80004e1           134218977
pc             0x80004e0           0x80004e0 <main+80>
xpsr           0x1000000           16777216
fpscr          0x0                 0
msp            0x2001ffe8          537001960
psp            0x0                 0
primask        0x0                 0
control        0x0                 0
basepri        0x0                 0
faultmask      0x0                 0
```
