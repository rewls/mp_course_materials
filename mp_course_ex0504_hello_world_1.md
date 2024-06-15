# mp_course_ex0504_hello_world_1

## Debug

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
(gdb) x/12i appmain
   0x80001e0 <appmain>: push    {r7, lr}
   0x80001e2 <appmain+2>:       sub     sp, #8
   0x80001e4 <appmain+4>:       add     r7, sp, #0
   0x80001e6 <appmain+6>:       str     r0, [r7, #4]
   0x80001e8 <appmain+8>:       str     r1, [r7, #0]
=> 0x80001ea <appmain+10>:      ldr     r0, [pc, #16]   ; (0x80001fc <appmain+28>)
   0x80001ec <appmain+12>:      bl      0x8002294 <printf>
   0x80001f0 <appmain+16>:      movs    r3, #0
   0x80001f2 <appmain+18>:      mov     r0, r3
   0x80001f4 <appmain+20>:      adds    r7, #8
   0x80001f6 <appmain+22>:      mov     sp, r7
   0x80001f8 <appmain+24>:      pop     {r7, pc}
(gdb) p msgstr
$1 = "Hello World!\n"
(gdb) p &msgstr
$2 = (char (*)[14]) 0x20000180 <msgstr>
```
