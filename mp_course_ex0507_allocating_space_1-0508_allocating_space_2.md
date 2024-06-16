# mp_course_ex0507_allocating_space_1-0508_allocating_space_2

## mp_course_ex0507_allocating_space_1_stm32vldisco_baremetal_qemu

### Source

- 실행 결과

    ```
    VNC server running on ::1:5900
    0
    1
    Hello
    B
    2
    0.500000
    0.250000
    305419896
    4660
    18
    ```

### Debug

- `output/mp_course_ex0507_allocating_space_1_stm32vldisco_baremetal_qemu/app.s`

    ```as
    080001e0 <appmain>:
    appmain():
    /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0507_allocating_space_1/appmain.c:30
     80001e0:	b580      	push	{r7, lr}
     80001e2:	b082      	sub	sp, #8
     80001e4:	af00      	add	r7, sp, #0
     80001e6:	6078      	str	r0, [r7, #4]
     80001e8:	6039      	str	r1, [r7, #0]
    /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0507_allocating_space_1/appmain.c:31
     80001ea:	4b21      	ldr	r3, [pc, #132]	; (8000270 <appmain+0x90>)
     80001ec:	681b      	ldr	r3, [r3, #0]
     80001ee:	4619      	mov	r1, r3
     80001f0:	4820      	ldr	r0, [pc, #128]	; (8000274 <appmain+0x94>)
     80001f2:	f002 fa63 	bl	80026bc <iprintf>
    /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0507_allocating_space_1/appmain.c:32
     80001f6:	4b20      	ldr	r3, [pc, #128]	; (8000278 <appmain+0x98>)
     80001f8:	681b      	ldr	r3, [r3, #0]
     80001fa:	4619      	mov	r1, r3
     80001fc:	481d      	ldr	r0, [pc, #116]	; (8000274 <appmain+0x94>)
     80001fe:	f002 fa5d 	bl	80026bc <iprintf>
    /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0507_allocating_space_1/appmain.c:33
     8000202:	491e      	ldr	r1, [pc, #120]	; (800027c <appmain+0x9c>)
     8000204:	481e      	ldr	r0, [pc, #120]	; (8000280 <appmain+0xa0>)
     8000206:	f002 fa59 	bl	80026bc <iprintf>
    /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0507_allocating_space_1/appmain.c:34
     800020a:	4b1e      	ldr	r3, [pc, #120]	; (8000284 <appmain+0xa4>)
     800020c:	785b      	ldrb	r3, [r3, #1]
     800020e:	4619      	mov	r1, r3
     8000210:	481d      	ldr	r0, [pc, #116]	; (8000288 <appmain+0xa8>)
     8000212:	f002 fa53 	bl	80026bc <iprintf>
    /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0507_allocating_space_1/appmain.c:35
     8000216:	4b1d      	ldr	r3, [pc, #116]	; (800028c <appmain+0xac>)
     8000218:	689b      	ldr	r3, [r3, #8]
     800021a:	4619      	mov	r1, r3
     800021c:	4815      	ldr	r0, [pc, #84]	; (8000274 <appmain+0x94>)
     800021e:	f002 fa4d 	bl	80026bc <iprintf>
    /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0507_allocating_space_1/appmain.c:36
     8000222:	4b1b      	ldr	r3, [pc, #108]	; (8000290 <appmain+0xb0>)
     8000224:	681b      	ldr	r3, [r3, #0]
     8000226:	4618      	mov	r0, r3
     8000228:	f001 f968 	bl	80014fc <__aeabi_f2d>
     800022c:	4602      	mov	r2, r0
     800022e:	460b      	mov	r3, r1
     8000230:	4818      	ldr	r0, [pc, #96]	; (8000294 <appmain+0xb4>)
     8000232:	f002 fa43 	bl	80026bc <iprintf>
    /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0507_allocating_space_1/appmain.c:37
     8000236:	4b18      	ldr	r3, [pc, #96]	; (8000298 <appmain+0xb8>)
     8000238:	e9d3 2300 	ldrd	r2, r3, [r3]
     800023c:	4815      	ldr	r0, [pc, #84]	; (8000294 <appmain+0xb4>)
     800023e:	f002 fa3d 	bl	80026bc <iprintf>
    /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0507_allocating_space_1/appmain.c:39
     8000242:	4b16      	ldr	r3, [pc, #88]	; (800029c <appmain+0xbc>)
     8000244:	681b      	ldr	r3, [r3, #0]
     8000246:	4619      	mov	r1, r3
     8000248:	480a      	ldr	r0, [pc, #40]	; (8000274 <appmain+0x94>)
     800024a:	f002 fa37 	bl	80026bc <iprintf>
    /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0507_allocating_space_1/appmain.c:40
     800024e:	4b14      	ldr	r3, [pc, #80]	; (80002a0 <appmain+0xc0>)
     8000250:	881b      	ldrh	r3, [r3, #0]
     8000252:	4619      	mov	r1, r3
     8000254:	4807      	ldr	r0, [pc, #28]	; (8000274 <appmain+0x94>)
     8000256:	f002 fa31 	bl	80026bc <iprintf>
    /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0507_allocating_space_1/appmain.c:41
     800025a:	4b12      	ldr	r3, [pc, #72]	; (80002a4 <appmain+0xc4>)
     800025c:	781b      	ldrb	r3, [r3, #0]
     800025e:	4619      	mov	r1, r3
     8000260:	4804      	ldr	r0, [pc, #16]	; (8000274 <appmain+0x94>)
     8000262:	f002 fa2b 	bl	80026bc <iprintf>
    /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0507_allocating_space_1/appmain.c:43
     8000266:	2300      	movs	r3, #0
    /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0507_allocating_space_1/appmain.c:44
     8000268:	4618      	mov	r0, r3
     800026a:	3708      	adds	r7, #8
     800026c:	46bd      	mov	sp, r7
     800026e:	bd80      	pop	{r7, pc}
     8000270:	200003c8 	.word	0x200003c8
     8000274:	200001b0 	.word	0x200001b0
     8000278:	20000180 	.word	0x20000180
     800027c:	20000184 	.word	0x20000184
     8000280:	200001b4 	.word	0x200001b4
     8000284:	2000018c 	.word	0x2000018c
     8000288:	200001b8 	.word	0x200001b8
     800028c:	20000190 	.word	0x20000190
     8000290:	200001a0 	.word	0x200001a0
     8000294:	200001bc 	.word	0x200001bc
     8000298:	200001a8 	.word	0x200001a8
     800029c:	200001c0 	.word	0x200001c0
     80002a0:	200001c4 	.word	0x200001c4
     80002a4:	200001c8 	.word	0x200001c8
    ```

```c
(gdb) p &int_data
$1 = (int *) 0x200003c8 <int_data>
(gdb) p &int_data2
$2 = (int *) 0x20000180 <int_data2>
(gdb) p &string_data
$3 = (char (*)[6]) 0x20000184 <string_data>
(gdb) p &char_array
$4 = (char (*)[3]) 0x2000018c <char_array>
(gdb) p &int_array
$5 = (int (*)[4]) 0x20000190 <int_array>
(gdb) p &float_data
$6 = (float *) 0x200001a0 <float_data>
(gdb) p &double_data
$7 = (double *) 0x200001a8 <double_data>
(gdb) p &format_int
$8 = (char (*)[4]) 0x200001b0 <format_int>
(gdb) p &format_string
$9 = (char (*)[4]) 0x200001b4 <format_string>
(gdb) p &format_char
$10 = (char (*)[4]) 0x200001b8 <format_char>
(gdb) p &endian_test_word
$11 = (uint32_t (*)[1]) 0x200001c0 <endian_test_word>
(gdb) p &endian_test_hword
$12 = (uint16_t (*)[2]) 0x200001c4 <endian_test_hword>
(gdb) p &endian_test_byte
$13 = (uint8_t (*)[4]) 0x200001c8 <endian_test_byte>
(gdb) info symbol &int_data
int_data in section .bss
(gdb) info symbol &int_data2
int_data2 in section .data
(gdb) info symbol &string_data
string_data in section .data
(gdb) info symbol &char_array
char_array in section .data
(gdb) info symbol &int_array
int_array in section .data
(gdb) info symbol &float_data
float_data in section .data
(gdb) info symbol &double_data
double_data in section .data
(gdb) info symbol &format_int
format_int in section .data
(gdb) info symbol &format_string
format_string in section .data
(gdb) info symbol &format_char
format_char in section .data
(gdb) info symbol &endian_test_word
endian_test_word in section .data
(gdb) info symbol &endian_test_hword
endian_test_hword in section .data
(gdb) info symbol &endian_test_byte
endian_test_byte in section .data
```

```as
(gdb) info variables
...
Non-debugging symbols:
0x00000000  __flash2_start__
0x00000000  __ram2_start__
0x00000000  __start_ot_flash_data
0x00000000  __stop_ot_flash_data
0x00006c20  CodeFlashUsed
0x08000000  __flash_start__
0x08006c20  __etext
0x08006c20  __exidx_end
0x08006c20  __text_end__
0x20000000  __ram_start__
0x20000180  __data_start__
0x200001d4  impure_data
0x20000234  numempty
0x20000238  __global_locale
0x200003a4  __frame_dummy_init_array_entry
0x200003a4  __init_array_start
0x200003a4  __preinit_array_end
0x200003a4  __preinit_array_start
0x200003a8  __do_global_dtors_aux_fini_array_entry
0x200003a8  __init_array_end
0x200003ac  __bss_start__
0x200003ac  __data_end__
0x200003ac  completed
0x200003b0  object
0x20000428  __malloc_free_list
0x2000042c  __malloc_sbrk_start
0x20000430  errno
0x20000434  __bss_end__
0x20000434  __end__
0x20000434  end
0x20002000  __StackTopTemp
```

## mp_course_ex0508_allocating_space_2_stm32vldisco_baremetal_qemu

### Debug

```as
$ arm-none-eabi-as mp_course_ex0508_allocating_space_2/appmain.S -al
ARM GAS  mp_course_ex0508_allocating_space_2/appmain.S                  page 1

...
  22                        .align 2
  23                    string_data:
  24 0008 48656C6C          .asciz  "Hello"
  24      6F00
  25
  26 000e 0000              .align 2
  27                    char_array:
  28 0010 414243            .byte   'A', 'B', 'C'
  29
  30 0013 00                .align 2
...
ARM GAS  mp_course_ex0508_allocating_space_2/appmain.S                        page 2

...
  69                    align_test_1:
  70                        .align 4
  71 0050 78563412          .word   0x12345678
  72                        .align 2
  73 0054 3412              .hword  0x1234
  74 0056 0000              .align 2
  75 0058 7856              .hword  0x5678
  76 005a 0000              .align 2
  77 005c 12                .byte   0x12
  78 005d 000000            .align 2
  79 0060 34                .byte   0x34
  80 0061 000000            .align 2
  81 0064 56                .byte   0x56
  82 0065 000000            .align 2
  83 0068 78                .byte   0x78
  84 0069 000000            .align 2
  85 006c F0F0F0F0          .word   0xf0f0f0f0
  86
  87                    align_test_2:
  88                        .align 4
  89 0070 78563412          .word   0x12345678
  90                        .align 2, 0xab
  91 0074 3412              .hword  0x1234
  92 0076 ABAB              .align 2, 0xab
  93 0078 7856              .hword  0x5678
  94 007a ABAB              .align 2, 0xab
  95 007c 12                .byte   0x12
  96 007d ABABAB            .align 2, 0xab
  97 0080 34                .byte   0x34
  98 0081 ABABAB            .align 2, 0xab
  99 0084 56                .byte   0x56
 100 0085 ABABAB            .align 2, 0xab
 101 0088 78                .byte   0x78
 102 0089 ABABAB            .align 2, 0xab
 103 008c F0F0F0F0          .word   0xf0f0f0f0
 104
 105                    align_test_3:
 106                        .align 4
 107 0090 78563412          .word   0x12345678
 108                        .align 2, , 2
 109 0094 3412              .hword  0x1234
ARM GAS  mp_course_ex0508_allocating_space_2/appmain.S                        page 3


 110 0096 0000              .align 2, , 2
 111 0098 7856              .hword  0x5678
 112 009a 0000              .align 2, , 2
 113 009c 12                .byte   0x12
 114                        .align 2, , 2
 115 009d 34                .byte   0x34
 116 009e 0000              .align 2, , 2
 117 00a0 56                .byte   0x56
 118                        .align 2, , 2
 119 00a1 78                .byte   0x78
 120 00a2 0000              .align 2, , 2
 121 00a4 F0F0F0F0          .word   0xf0f0f0f0
...
```
