# mp_course_ex0401_stm32vldisco_baremetal_qemu

## Source

```c
SCnSCB_Type * _g_scnscb = SCnSCB;
SCB_Type * _g_scb = SCB;
SysTick_Type * _g_systick = SysTick;
NVIC_Type * _g_nvic = NVIC;
ITM_Type * _g_itm = ITM;
DWT_Type * _g_dwt = DWT;
TPI_Type * _g_tpi = TPI;
CoreDebug_Type * _g_coredebug = CoreDebug;
```

- CMSIS-Core (Cortex-M) > Data Structures

```c
void GPIO_reset(GPIO_TypeDef* GPIOx)
{
    // Set all pins as analog input mode
    GPIOx->CRL = 0; // Bit 0 to 7, all set as analog input
    GPIOx->CRH = 0; // Bit 8 to 15, all set as analog input
    GPIOx->ODR = 0; // Default output value is 0
    return;
}
```

- CMSIS device

- The Definitive Guide to ARM<sup>®</sup> Cortex<sup>®</sup>-M3 and Cortex<sup>®</sup>-M4 Processors > 2.7 Inputs, outputs, and peripherals accesses

```c
int appmain(int argc, char * argv[])
```

- ubinos > Files > bsp.h

    - 응용 코드 시작 함수, 시스템 시작시 BSP 컴포넌트의 main 함수에서 자동적으로 호출

```c
    uint32_t fpu_type = SCB_GetFPUType();
```

- CMSIS-Core (Cortex-M) > Reference > FPU Functions > SCB_GetFPUType

```c
        bsp_busywaitms(5000);
```

- ubinos > Files > bsp.h

    - CPU를 점유한 채로 기다리는 함수, ms 단위

## Debug

```c
40          GPIO_reset(GPIOA); /* Reset GPIO A */
(gdb) ptype/o GPIOA
type = struct {
/*    0      |     4 */    volatile uint32_t CRL;
/*    4      |     4 */    volatile uint32_t CRH;
/*    8      |     4 */    volatile uint32_t IDR;
/*   12      |     4 */    volatile uint32_t ODR;
/*   16      |     4 */    volatile uint32_t BSRR;
/*   20      |     4 */    volatile uint32_t BRR;
/*   24      |     4 */    volatile uint32_t LCKR;

                           /* total size (bytes):   28 */
                         } *
(gdb) x/7xw GPIOA
0x40010800:     0x00000000      0x00000000      0x00000000      0x00000000
0x40010810:     0x00000000      0x00000000      0x00000000
(gdb) n
42          uint32_t fpu_type = SCB_GetFPUType();
(gdb) x/7xw GPIOA
0x40010800:     0x00000000      0x00000000      0x00000000      0x00000000
0x40010810:     0x00000000      0x00000000      0x00000000
```

```c
47              bsp_busywaitms(5000);
(gdb) s
bsp_busywaitms (timems=5000) at /home/rewls/git/ubiworks/library/ubinos/source/ubinos/bsp/arch/arm/cortexm/bsp.c:118
118         count = bsp_timemstobwc(timems);
(gdb)
bsp_timemstobwc (timems=5000) at /home/rewls/git/ubiworks/library/ubinos/source/ubinos/bsp/arch/arm/cortexm/bsp.c:108
108         return (timems * UBINOS__BSP__BUSYWAITCOUNT_PER_MS);
(gdb)
109     }
(gdb)
bsp_busywaitms (timems=5000) at /home/rewls/git/ubiworks/library/ubinos/source/ubinos/bsp/arch/arm/cortexm/bsp.c:119
119         if (count < timems) {
(gdb)
123         bsp_busywait(count);
(gdb)
bsp_busywait (count=39875000) at /home/rewls/git/ubiworks/library/ubinos/source/ubinos/bsp/arch/arm/cortexm/bsp.c:40
40          __asm__ __volatile__ (
(gdb) l
35              return 0;
36          }
37      }
38
39      void bsp_busywait(unsigned int count) {
40          __asm__ __volatile__ (
41                  "cmp    r0, #0                                      \n\t"
42                  "beq    2f                                          \n\t"
43                  "nop                                                \n\t"
44                  "nop                                                \n\t"
(gdb) l
45                  "1:                                                 \n\t"
46                  "subs   r0, r0, #1                                  \n\t"
47                  "bne    1b                                          \n\t"
48                  "2:                                                 \n\t"
49          );
50      }
51
52      void bsp_abortsystem(void) {
53          if (!_bsp_aborted)
54          {
(gdb) fin
Run till exit from #0  bsp_busywait (count=39875000) at /home/rewls/git/ubiworks/library/ubinos/source/ubinos/bsp/arch/arm/cortexm/bsp.c:40
bsp_busywaitms (timems=5000) at /home/rewls/git/ubiworks/library/ubinos/source/ubinos/bsp/arch/arm/cortexm/bsp.c:124
124     }
```

- 기다리는 시간 불일치
