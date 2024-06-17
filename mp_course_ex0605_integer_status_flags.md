# mp_course_ex0605_integer_status_flags_stm32vldisco_baremetal_qemu

## Debug

```as
43          subs    r0, r1, r2  @ 1 - 2 = -1 (N=1, Z=0, C=0, V=0)
(gdb) n
44          adds    r0, r1, r2  @ 1 + 2 =  3 (N=0, Z=0, C=0, V=0)
(gdb) p/x $xpsr
$1 = 0x81000000
(gdb) n
49          mov     r0, #0
(gdb) p/x $xpsr
$2 = 0x1000000
```

```as
54          subs    r0, r1, r2  @ 2 - 2 = 0 (N=0, Z=1, C=1, V=0)
(gdb) n
55          subs    r0, r1, r3  @ 2 - 1 = 1 (N=0, Z=0, C=1, V=0)
(gdb) p/x $xpsr
$3 = 0x61000000
(gdb) n
61          mov     r0, #0
(gdb) p/x $xpsr
$4 = 0x21000000
(gdb)
```

```as
67          adds    r0, r1, r2   @ 4294967294 (0x ffff fffe) + 3 (0x 0000 0003) = 4294967297 (0x 1 0000 0001) (N=0, Z=0, C=1, V=0) (carry (unsigned overflow))
(gdb) n
68          adds    r0, r1, r3   @ 4294967294 (0x ffff fffe) + 1 (0x 0000 0001) = 4294967295 (0x   ffff ffff) (N=1, Z=0, C=0, V=0) (no carry (not unsigned overflow))
(gdb) p/x $xpsr
$5 = 0x21000000
(gdb) n
71          mov     r0, #0
(gdb) p/x $xpsr
$6 = 0x81000000
```

```as
75          subs    r0, r1, r2  @ 2 (0x   0000 0002) + -1 (0x ffff ffff) =  1 (0x 1 0000 0001) (N=0, Z=0, C=1, V=0) (not borrow (not unsigned underflow))
(gdb) n
76          subs    r0, r2, r1  @ 1 (0x   0000 0001) + -2 (0x ffff fffe) = -1 (0x   ffff ffff) (N=1, Z=0, C=0, V=0) (borrow (unsigned underflow))
(gdb) p/x $xpsr
$7 = 0x21000000
(gdb) n
80          mov     r0, #0
(gdb) p/x $xpsr
$8 = 0x81000000
```

```as
84          movs    r0, r1, lsl #4 @ 0x 1234 5678 << 4 = 0x 1 2345 6780 (N=0, Z=0, C=1, V=0)
(gdb) n
90          mov     r0, #0
(gdb) p/x $xpsr
$9 = 0x21000000
```

```as
96          adds    r0, r1, r2 @ -2147483648 (0x 8000 0000) + -2 (0x ffff fffe) = 2147483646 (0x 1 7fff fffe) (N=0, Z=0, C=1, V=1)
(gdb) n
99          mov     r0, #0
(gdb) p/x $xpsr
$10 = 0x31000000
```

```as
104         adds    r0, r1, r2 @ 2147483647 (0x 7fff ffff) + 2 (0x 0000 0002) =  -2147483647 (0x 8000 0001) (N=1, Z=0, C=0, V=1)
(gdb) n
108         mov     r0, #0
(gdb) p/x $xpsr
$11 = 0x91000000
```

```as
113         subs    r0, r1, r2 @ -2147483648 (0x 8000 0000) + -2 (0x ffff fffe) = 2147483646 (0x 1 7fff fffe) (N=0, Z=0, C=1, V=1)
(gdb) n
116         mov     r0, #0
(gdb) p/x $xpsr
$12 = 0x31000000
```

```as
122         subs    r0, r1, r2 @ 2147483647 (0x 7fff ffff) + --2 (0x 0000 0002) = -2147483647 (0x 8000 0001) (N=1, Z=0, C=0, V=1)
(gdb) n
124         bx      lr
(gdb) p/x $xpsr
$13 = 0x91000000
```
