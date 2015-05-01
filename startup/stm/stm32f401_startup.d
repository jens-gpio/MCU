module startup;

version(GNU)
{
	static import gcc.attribute;					// we need this to get the section, weak and alias attributes
	void wfi(){ version(ALLOW_WFI){ asm{ "wfi"; } } }
}
else version(LDC)
{
	import ldc.llvmasm;
	void wfi(){ version(ALLOW_WFI){ __asm("wfi"); } }
}

import core.stdc.config;							// we need this for c_ulong, so we can get symbols from the linker-script
import core.stdc.stdint;							// these are the types normally used on microcontrollers

// Create convenience enums and aliases for the weak and alias attributes:
enum isr_vector = gcc.attribute.attribute("section",".isr_vector.ro");
enum naked = gcc.attribute.attribute("naked");
enum weak = gcc.attribute.attribute("weak");
alias Tuple(A...) = A;
alias rst = Tuple!(weak, gcc.attribute.attribute("alias", "defaultResetHandler"));
alias exc = Tuple!(weak, gcc.attribute.attribute("alias", "defaultExceptionHandler"));

// The following symbols are provided by our linker-script:
extern(C) extern __gshared c_ulong _stack;			// initial stack address
extern(C) extern __gshared c_ulong _siccmram;		// pointer to read-only data that needs to be copied to CCMRAM
extern(C) extern __gshared c_ulong _sccmram;		// start address of .ccmram section (somewhere within CCMRAM)
extern(C) extern __gshared c_ulong _eccmram;		// end address of .ccmram section (somewhere within CCMRAM)
extern(C) extern __gshared c_ulong _sirelocated;	// pointer to read-only data that needs to be copied to normal SRAM
extern(C) extern __gshared c_ulong _srelocated;		// start address of .relocated section (somewhere within SRAM)
extern(C) extern __gshared c_ulong _erelocated;		// end address of .relocated section (somewhere within SRAM)
extern(C) extern __gshared c_ulong _szeroed;		// start address of .zeroed section (somewhere within SRAM or CCMRAM)
extern(C) extern __gshared c_ulong _ezeroed;		// end address of .zeroed section (somewhere within SRAM or CCMRAM)

// Create a convenience alias for our vector functions:
//alias extern(C) const void function() VectorFunc;	// currently, this won't work for me
alias extern(C) const void *VectorFunc;				// so I'm using a void* instead.

@rst extern(C) void Reset_Handler();
@exc extern(C) void NMI_Handler();
@exc extern(C) void HardFault_Handler();
@exc extern(C) void MemManage_Handler();
@exc extern(C) void BusFault_Handler();
@exc extern(C) void UsageFault_Handler();
@exc extern(C) void SVC_Handler();
@exc extern(C) void DebugMon_Handler();
@exc extern(C) void PendSV_Handler();
@exc extern(C) void SysTick_Handler();
@exc extern(C) void WWDG_IRQHandler();
@exc extern(C) void PVD_IRQHandler();
@exc extern(C) void TAMP_STAMP_IRQHandler();
@exc extern(C) void RTC_WKUP_IRQHandler();
@exc extern(C) void FLASH_IRQHandler();
@exc extern(C) void RCC_IRQHandler();
@exc extern(C) void EXTI0_IRQHandler();
@exc extern(C) void EXTI1_IRQHandler();
@exc extern(C) void EXTI2_IRQHandler();
@exc extern(C) void EXTI3_IRQHandler();
@exc extern(C) void EXTI4_IRQHandler();
@exc extern(C) void DMA1_Stream0_IRQHandler();
@exc extern(C) void DMA1_Stream1_IRQHandler();
@exc extern(C) void DMA1_Stream2_IRQHandler();
@exc extern(C) void DMA1_Stream3_IRQHandler();
@exc extern(C) void DMA1_Stream4_IRQHandler();
@exc extern(C) void DMA1_Stream5_IRQHandler();
@exc extern(C) void DMA1_Stream6_IRQHandler();
@exc extern(C) void ADC_IRQHandler();
@exc extern(C) void EXTI9_5_IRQHandler();
@exc extern(C) void TIM1_BRK_TIM9_IRQHandler();
@exc extern(C) void TIM1_UP_TIM10_IRQHandler();
@exc extern(C) void TIM1_TRG_COM_TIM11_IRQHandler();
@exc extern(C) void TIM1_CC_IRQHandler();
@exc extern(C) void TIM2_IRQHandler();
@exc extern(C) void TIM3_IRQHandler();
@exc extern(C) void TIM4_IRQHandler();
@exc extern(C) void I2C1_EV_IRQHandler();
@exc extern(C) void I2C1_ER_IRQHandler();
@exc extern(C) void I2C2_EV_IRQHandler();
@exc extern(C) void I2C2_ER_IRQHandler();
@exc extern(C) void SPI1_IRQHandler();
@exc extern(C) void SPI2_IRQHandler();
@exc extern(C) void USART1_IRQHandler();
@exc extern(C) void USART2_IRQHandler();
@exc extern(C) void EXTI15_10_IRQHandler();
@exc extern(C) void RTC_Alarm_IRQHandler();
@exc extern(C) void OTG_FS_WKUP_IRQHandler();
@exc extern(C) void DMA1_Stream7_IRQHandler();
@exc extern(C) void SDIO_IRQHandler();
@exc extern(C) void TIM5_IRQHandler();
@exc extern(C) void SPI3_IRQHandler();
@exc extern(C) void DMA2_Stream0_IRQHandler();
@exc extern(C) void DMA2_Stream1_IRQHandler();
@exc extern(C) void DMA2_Stream2_IRQHandler();
@exc extern(C) void DMA2_Stream3_IRQHandler();
@exc extern(C) void DMA2_Stream4_IRQHandler();
@exc extern(C) void OTG_FS_IRQHandler();
@exc extern(C) void DMA2_Stream5_IRQHandler();
@exc extern(C) void DMA2_Stream6_IRQHandler();
@exc extern(C) void DMA2_Stream7_IRQHandler();
@exc extern(C) void USART6_IRQHandler();
@exc extern(C) void I2C3_EV_IRQHandler();
@exc extern(C) void I2C3_ER_IRQHandler();
@exc extern(C) void FPU_IRQHandler();
@exc extern(C) void SPI4_IRQHandler();

@isr_vector VectorFunc[101] g_pfnVectors = [
	cast(VectorFunc)&_stack,														/* -16 $0000 Initial Stack Pointer */
	&Reset_Handler,																	/* -15 $0004 Reset Vector */
	&NMI_Handler,																	/* -14 $0008 Non Maskable Interrupt Vector */
	&HardFault_Handler,																/* -13 $000c Hard Fault Vector */
	&MemManage_Handler,																/* -12 $0010 Memory Protection Unit Fault Vector */
	&BusFault_Handler,																/* -11 $0014 Bus Fault Vector */
	&UsageFault_Handler,															/* -10 $0018 Usage Fault Vector */
	cast(VectorFunc)0,																/*  -9 $001c Reserved */
	cast(VectorFunc)0,																/*  -8 $0020 Reserved */
	cast(VectorFunc)0,																/*  -7 $0024 Reserved */
	cast(VectorFunc)0,																/*  -6 $0028 Reserved */
	&SVC_Handler,																	/*  -5 $002c SuperVisor Call Vector */
	&DebugMon_Handler,																/*  -4 $0030 Debug Monitor Vector */
	cast(VectorFunc)0,																/*  -3 $0034 Reserved */
	&PendSV_Handler,																/*  -2 $0038 Pending SuperVisor Vector */
	&SysTick_Handler,																/*  -1 $003c System Tick Vector */

	&WWDG_IRQHandler,																/*   0 $0040 Windowed WatchDog */
	&PVD_IRQHandler,																/*   1 $0044 PVD through EXTI Line detection */
	&TAMP_STAMP_IRQHandler,															/*   2 $0048 Tamper and TimeStamps through the EXTI line */
	&RTC_WKUP_IRQHandler,															/*   3 $004c RTC Wakeup through the EXTI line */
	&FLASH_IRQHandler,																/*   4 $0050 FLASH */
	&RCC_IRQHandler,																/*   5 $0054 RCC */
	&EXTI0_IRQHandler,																/*   6 $0058 EXTI Line0 */
	&EXTI1_IRQHandler,																/*   7 $005c EXTI Line1 */
	&EXTI2_IRQHandler,																/*   8 $0060 EXTI Line2 */
	&EXTI3_IRQHandler,																/*   9 $0064 EXTI Line3 */
	&EXTI4_IRQHandler,																/*  10 $0068 EXTI Line4 */
	&DMA1_Stream0_IRQHandler,														/*  11 $006c DMA1 Stream 0 */
	&DMA1_Stream1_IRQHandler,														/*  12 $0070 DMA1 Stream 1 */
	&DMA1_Stream2_IRQHandler,														/*  13 $0074 DMA1 Stream 2 */
	&DMA1_Stream3_IRQHandler,														/*  14 $0078 DMA1 Stream 3 */
	&DMA1_Stream4_IRQHandler,														/*  15 $007c DMA1 Stream 4 */
	&DMA1_Stream5_IRQHandler,														/*  16 $0080 DMA1 Stream 5 */
	&DMA1_Stream6_IRQHandler,														/*  17 $0084 DMA1 Stream 6 */
	&ADC_IRQHandler,																/*  18 $0088 ADC1, ADC2 and ADC3s */
	cast(VectorFunc)0,																/*  19 $008c Reserved */
	cast(VectorFunc)0,																/*  20 $0090 Reserved */
	cast(VectorFunc)0,																/*  21 $0094 Reserved */
	cast(VectorFunc)0,																/*  22 $0098 Reserved */
	&EXTI9_5_IRQHandler,															/*  23 $009c External Line[9:5]s */
	&TIM1_BRK_TIM9_IRQHandler,														/*  24 $00a0 TIM1 Break and TIM9 */
	&TIM1_UP_TIM10_IRQHandler,														/*  25 $00a4 TIM1 Update and TIM10 */
	&TIM1_TRG_COM_TIM11_IRQHandler,													/*  26 $00a8 TIM1 Trigger and Commutation and TIM11 */
	&TIM1_CC_IRQHandler,															/*  27 $00ac TIM1 Capture Compare */
	&TIM2_IRQHandler,																/*  28 $00b0 TIM2 */
	&TIM3_IRQHandler,																/*  29 $00b4 TIM3 */
	&TIM4_IRQHandler,																/*  30 $00b8 TIM4 */
	&I2C1_EV_IRQHandler,															/*  31 $00bc I2C1 Event */
	&I2C1_ER_IRQHandler,															/*  32 $00c0 I2C1 Error */
	&I2C2_EV_IRQHandler,															/*  33 $00c4 I2C2 Event */
	&I2C2_ER_IRQHandler,															/*  34 $00c8 I2C2 Error */
	&SPI1_IRQHandler,																/*  35 $00cc SPI1 */
	&SPI2_IRQHandler,																/*  36 $00d0 SPI2 */
	&USART1_IRQHandler,																/*  37 $00d4 USART1 */
	&USART2_IRQHandler,																/*  38 $00d8 USART2 */
	cast(VectorFunc)0,																/*  39 $00dc Reserved */
	&EXTI15_10_IRQHandler,															/*  40 $00e0 External Line[15:10]s */
	&RTC_Alarm_IRQHandler,															/*  41 $00e4 RTC Alarm (A and B) through EXTI Line */
	&OTG_FS_WKUP_IRQHandler,														/*  42 $00e8 USB OTG FS Wakeup through EXTI line */
	cast(VectorFunc)0,																/*  43 $00ec Reserved */
	cast(VectorFunc)0,																/*  44 $00f0 Reserved */
	cast(VectorFunc)0,																/*  45 $00f4 Reserved */
	cast(VectorFunc)0,																/*  46 $00f8 Reserved */
	&DMA1_Stream7_IRQHandler,														/*  47 $00fc DMA1 Stream7 */
	cast(VectorFunc)0,																/*  48 $0100 Reserved */
	&SDIO_IRQHandler,																/*  49 $0104 SDIO */
	&TIM5_IRQHandler,																/*  50 $0108 TIM5 */
	&SPI3_IRQHandler,																/*  51 $010c SPI3 */
	cast(VectorFunc)0,																/*  52 $0110 Reserved */
	cast(VectorFunc)0,																/*  53 $0114 Reserved */
	cast(VectorFunc)0,																/*  54 $0118 Reserved */
	cast(VectorFunc)0,																/*  55 $011c Reserved */
	&DMA2_Stream0_IRQHandler,														/*  56 $0120 DMA2 Stream 0 */
	&DMA2_Stream1_IRQHandler,														/*  57 $0124 DMA2 Stream 1 */
	&DMA2_Stream2_IRQHandler,														/*  58 $0128 DMA2 Stream 2 */
	&DMA2_Stream3_IRQHandler,														/*  59 $012c DMA2 Stream 3 */
	&DMA2_Stream4_IRQHandler,														/*  60 $0130 DMA2 Stream 4 */
	cast(VectorFunc)0,																/*  61 $0134 Reserved */
	cast(VectorFunc)0,																/*  62 $0138 Reserved */
	cast(VectorFunc)0,																/*  63 $013c Reserved */
	cast(VectorFunc)0,																/*  64 $0140 Reserved */
	cast(VectorFunc)0,																/*  65 $0144 Reserved */
	cast(VectorFunc)0,																/*  66 $0148 Reserved */
	&OTG_FS_IRQHandler,																/*  67 $014c USB OTG FS */
	&DMA2_Stream5_IRQHandler,														/*  68 $0150 DMA2 Stream 5 */
	&DMA2_Stream6_IRQHandler,														/*  69 $0154 DMA2 Stream 6 */
	&DMA2_Stream7_IRQHandler,														/*  70 $0158 DMA2 Stream 7 */
	&USART6_IRQHandler,																/*  71 $015c USART6 */
	&I2C3_EV_IRQHandler,															/*  72 $0160 I2C3 event */
	&I2C3_ER_IRQHandler,															/*  73 $0164 I2C3 error */
	cast(VectorFunc)0,																/*  74 $0168 Reserved */
	cast(VectorFunc)0,																/*  75 $016c Reserved */
	cast(VectorFunc)0,																/*  76 $0170 Reserved */
	cast(VectorFunc)0,																/*  77 $0174 Reserved */
	cast(VectorFunc)0,																/*  78 $0178 Reserved */
	cast(VectorFunc)0,																/*  79 $017c Reserved */
	cast(VectorFunc)0,																/*  80 $0180 Reserved */
	&FPU_IRQHandler,																/*  81 $0184 FPU */

	cast(VectorFunc)0,																/*  82 $0188 Reserved */
	cast(VectorFunc)0,																/*  83 $018c Reserved */
	&SPI4_IRQHandler,																/*  84 $0190 SPI4 */
	];

@weak extern(C) void LowLevelInit();
@weak extern(C) void SystemInit();
@weak extern(C) void __libc_init_array();
extern(C) void main();

void copyBlock(const(void) *aSource, void *aDestination, void *aDestinationEnd)
{
	const(uint32_t)	*s = cast(const(uint32_t) *)aSource;
	uint32_t		*d = cast(uint32_t *)aDestination;
	uint32_t		*e = cast(uint32_t *)aDestinationEnd;

	while(d < e)
	{
		*d++ = *s++;
	}
}

void zeroBlock(void *aDestination, void *aDestinationEnd)
{
	uint32_t	*d = cast(uint32_t *)aDestination;
	uint32_t	*e = cast(uint32_t *)aDestinationEnd;

	while(d < e)
	{
		*d++ = 0;
	}
}

@naked extern(C) void defaultResetHandler()											/* we can mark this naked, as it never returns and should never save any registers on the stack */
{
	LowLevelInit();
	SystemInit();
	__libc_init_array();

	copyBlock(&_siccmram, &_sccmram, &_eccmram);
	copyBlock(&_sirelocated, &_srelocated, &_erelocated);
	zeroBlock(&_szeroed, &_ezeroed);
	main();
	while(true)
	{
		wfi();
	}
}

@naked extern(C) void defaultExceptionHandler()
{
	while(true)
	{
		wfi();
	}
}
