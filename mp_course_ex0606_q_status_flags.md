# mp_course_ex0606_q_status_flags_stm32vldisco_baremetal_qemu

## Debug

```as
26          ssat    r0, #16, r1     @ Q = 1, r0 = 0x 0000 7fff (32767)
(gdb) p/x $r1
$1 = 0x20000
(gdb) n
28          mov     r0, #0
(gdb) p/x $r0
$2 = 0x7fff
(gdb) p/x $xpsr
$3 = 0x9000000
```

```as
31          ssat    r0, #16, r1     @ Q = 1, r0 = 0x 0000 7fff (32767)
(gdb) p/x $r1
$4 = 0x8000
(gdb) n
33          mov     r0, #0
(gdb) p/x $r0
$5 = 0x7fff
(gdb) p/x $xpsr
$6 = 0x9000000
```

```as
36          ssat    r0, #16, r1     @ Q = 0, r0 = 0x 0000 7fff (32767)
(gdb) p/x $r1
$7 = 0x7fff
(gdb) n
38          mov     r0, #0
(gdb) p/x $r0
$8 = 0x7fff
(gdb) p/x $xpsr
$9 = 0x1000000
```

```as
41          ssat    r0, #16, r1     @ Q = 0, r0 = 0x ffff 8000 (-32768)
(gdb) p/x $r1
$10 = 0xffff8000
(gdb) n
43          mov     r0, #0
(gdb) p/x $r0
$11 = 0xffff8000
(gdb) p/x $xpsr
$12 = 0x1000000
```

```as
46          ssat    r0, #16, r1     @ Q = 1, r0 = 0x ffff 8000 (-32768)
(gdb) p/x $r1
$13 = 0xffff7fff
(gdb) n
48          mov     r0, #0
(gdb) p/x $r0
$14 = 0xffff8000
(gdb) p/x $xpsr
$15 = 0x9000000
```

```as
51          ssat    r0, #16, r1     @ Q = 1, r0 = 0x ffff 8000 (-32768)
(gdb) p/x $r1
$16 = 0xfffe0000
(gdb) n
55          mov     r0, #0
(gdb) p/x $r0
$17 = 0xffff8000
(gdb) p/x $xpsr
$18 = 0x9000000
```

```as
58          usat    r0, #16, r1     @ Q = 1, r0 = 0x 0000 ffff (65535)
(gdb) p/x $r1
$19 = 0x20000
(gdb) n
60          mov     r0, #0
(gdb) p/x $r0
$20 = 0xffff
(gdb) p/x $xpsr
$21 = 0x9000000
```

```as
63          usat    r0, #16, r1     @ Q = 0, r0 = 0x 0000 ffff (65535)
(gdb) p/x $r1
$22 = 0xffff
(gdb) n
65          mov     r0, #0
(gdb) p/x $r0
$23 = 0xffff
(gdb) p/x $xpsr
$24 = 0x1000000
```

```as
68          usat    r0, #16, r1     @ Q = 0, r0 = 0x 0000 0000 (0)
(gdb) p/x $r1
$25 = 0x0
(gdb) n
70          mov     r0, #0
(gdb) p/x $r0
$26 = 0x0
(gdb) p/x $xpsr
$27 = 0x1000000
```

```as
73          usat    r0, #16, r1     @ Q = 1, r0 = 0x 0000 0000 (0)
(gdb) p/x $r1
$28 = 0xffffffff
(gdb) n
75          mov     r0, #0
(gdb) p/x $r0
$29 = 0x0
(gdb) p/x $xpsr
$30 = 0x9000000
```

```as
78          usat    r0, #16, r1     @ Q = 1, r0 = 0x 0000 0000 (0)
(gdb) p/x $r1
$31 = 0xfffe0000
(gdb) n
81          bx      lr
(gdb) p/x $r0
$32 = 0x0
(gdb) p/x $xpsr
$33 = 0x9000000
```
