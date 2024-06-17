# mp_course_ex0603_interrupt_masking_stm32vldisco_baremetal_qemu

## Debug

```as
34          cpsid   i
(gdb) p $primask
$1 = 0
(gdb) n
35          mov     r0, #0
(gdb) p $primask
$2 = 1
```

```as
37          cpsie   i
(gdb) n
38          mov     r0, #0
(gdb) p $primask
$3 = 0
```

```as
41          cpsid   f
(gdb) p $faultmask
$1 = 0
(gdb) n
42          mov     r0, #0
(gdb) p $faultmask
$2 = 1
```

```as
44          cpsie   f
(gdb) n
45          mov     r0, #0
(gdb) p $faultmask
$3 = 0
```
