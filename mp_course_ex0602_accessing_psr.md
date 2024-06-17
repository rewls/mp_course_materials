# mp_course_ex0602_accessing_psr_stm32vldisco_baremetal_qemu

## Source

- The Definitive Guide to ARM<sup>®</sup> Cortex<sup>®</sup>-M3 and Cortex<sup>®</sup>-M4 Processors > Chapter 4. Architecture

## Debug

```as
24          subs    r0, r1, r2  @ 1 - 1 = 0 (N=0, Z=1, C=1, V=0)
(gdb) p/x $xpsr
$1 = 0x1000000
(gdb) n
25          mov     r0, #0
(gdb) p/x $xpsr
$2 = 0x61000000
```

```as
26          mrs     r0, psr
(gdb) n
27          mov     r0, #0
(gdb) p/x $r0
$3 = 0x60000000
```

```as
28          mrs     r0, apsr
(gdb) n
29          mov     r0, #0
(gdb) p/x $r0
$4 = 0x60000000
```

```as
30          mrs     r0, ipsr
(gdb) n
32          bx      lr
(gdb) p/x $r0
$5 = 0x0
```
