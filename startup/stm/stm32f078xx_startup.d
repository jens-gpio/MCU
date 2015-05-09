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
@exc extern(C) void SVC_Handler();
@exc extern(C) void PendSV_Handler();
@exc extern(C) void SysTick_Handler();
@exc extern(C) void WWDG_IRQHandler();
@exc extern(C) void VDDIO2_IRQHandler();
@exc extern(C) void RTC_IRQHandler();
@exc extern(C) void FLASH_IRQHandler();
@exc extern(C) void RCC_CRS_IRQHandler();
@exc extern(C) void EXTI0_1_IRQHandler();
@exc extern(C) void EXTI2_3_IRQHandler();
@exc extern(C) void EXTI4_15_IRQHandler();
@exc extern(C) void TSC_IRQHandler();
@exc extern(C) void DMA1_Channel1_IRQHandler();
@exc extern(C) void DMA1_Channel2_3_IRQHandler();
@exc extern(C) void DMA1_Channel4_5_6_7_IRQHandler();
@exc extern(C) void ADC1_COMP_IRQHandler();
@exc extern(C) void TIM1_BRK_UP_TRG_COM_IRQHandler();
@exc extern(C) void TIM1_CC_IRQHandler();
@exc extern(C) void TIM2_IRQHandler();
@exc extern(C) void TIM3_IRQHandler();
@exc extern(C) void TIM6_DAC_IRQHandler();
@exc extern(C) void TIM7_IRQHandler();
@exc extern(C) void TIM14_IRQHandler();
@exc extern(C) void TIM15_IRQHandler();
@exc extern(C) void TIM16_IRQHandler();
@exc extern(C) void TIM17_IRQHandler();
@exc extern(C) void I2C1_IRQHandler();
@exc extern(C) void I2C2_IRQHandler();
@exc extern(C) void SPI1_IRQHandler();
@exc extern(C) void SPI2_IRQHandler();
@exc extern(C) void USART1_IRQHandler();
@exc extern(C) void USART2_IRQHandler();
@exc extern(C) void USART3_4_IRQHandler();
@exc extern(C) void CEC_CAN_IRQHandler();
@exc extern(C) void USB_IRQHandler();

@isr_vector VectorFunc[48] g_pfnVectors = [
	cast(VectorFunc)&_stack,														/* -16 $0000 Initial Stack Pointer */
	&Reset_Handler,																	/* -15 $0004 Reset Vector */
	&NMI_Handler,																	/* -14 $0008 Non Maskable Interrupt Vector */
	&HardFault_Handler,																/* -13 $000c Hard Fault Vector */
	cast(VectorFunc)0,																/* -12 $0010 Reserved */
	cast(VectorFunc)0,																/* -11 $0014 Reserved */
	cast(VectorFunc)0,																/* -10 $0018 Reserved */
	cast(VectorFunc)0,																/*  -9 $001c Reserved */
	cast(VectorFunc)0,																/*  -8 $0020 Reserved */
	cast(VectorFunc)0,																/*  -7 $0024 Reserved */
	cast(VectorFunc)0,																/*  -6 $0028 Reserved */
	&SVC_Handler,																	/*  -5 $002c SuperVisor Call Vector */
	cast(VectorFunc)0,																/*  -4 $0030 Reserved */
	cast(VectorFunc)0,																/*  -3 $0034 Reserved */
	&PendSV_Handler,																/*  -2 $0038 Pending SuperVisor Vector */
	&SysTick_Handler,																/*  -1 $003c System Tick Vector */

	&WWDG_IRQHandler,																/*   0 $0040 Windowed WatchDog */
	&VDDIO2_IRQHandler,																/*   1 $0044 VDDIO2 Monitor through EXTI Line 31 */
	&RTC_IRQHandler,																/*   2 $0048 RTC through the EXTI line */
	&FLASH_IRQHandler,																/*   3 $004c FLASH */
	&RCC_CRS_IRQHandler,															/*   4 $0050 RCC and CRS */
	&EXTI0_1_IRQHandler,															/*   5 $0054 EXTI Line 0 and 1 */
	&EXTI2_3_IRQHandler,															/*   6 $0058 EXTI Line 2 and 3 */
	&EXTI4_15_IRQHandler,															/*   7 $005c EXTI Line 4 to 15 */
	&TSC_IRQHandler,																/*   8 $0060 TSC */
	&DMA1_Channel1_IRQHandler,														/*   9 $0064 DMA1 Channel 1 */
	&DMA1_Channel2_3_IRQHandler,													/*  10 $0068 DMA1 Channel 2 and Channel 3 */
	&DMA1_Channel4_5_6_7_IRQHandler,												/*  11 $006c DMA1 Channel 4, Channel 5, Channel 6 and Channel 7 */
	&ADC1_COMP_IRQHandler,															/*  12 $0070 ADC1, COMP1 and COMP2 */
	&TIM1_BRK_UP_TRG_COM_IRQHandler,												/*  13 $0074 TIM1 Break, Update, Trigger and Commutation */
	&TIM1_CC_IRQHandler,															/*  14 $0078 TIM1 Capture Compare */
	&TIM2_IRQHandler,																/*  15 $007c TIM2 */
	&TIM3_IRQHandler,																/*  16 $0080 TIM3 */
	&TIM6_DAC_IRQHandler,															/*  17 $0084 TIM6 and DAC */
	&TIM7_IRQHandler,																/*  18 $0088 TIM7 */
	&TIM14_IRQHandler,																/*  19 $008c TIM14 */
	&TIM15_IRQHandler,																/*  20 $0090 TIM15 */
	&TIM16_IRQHandler,																/*  21 $0094 TIM16 */
	&TIM17_IRQHandler,																/*  22 $0098 TIM17 */
	&I2C1_IRQHandler,																/*  23 $009c I2C1 */
	&I2C2_IRQHandler,																/*  24 $00a0 I2C2 */
	&SPI1_IRQHandler,																/*  25 $00a4 SPI1 */
	&SPI2_IRQHandler,																/*  26 $00a8 SPI2 */
	&USART1_IRQHandler,																/*  27 $00ac USART1 */
	&USART2_IRQHandler,																/*  28 $00b0 USART2 */
	&USART3_4_IRQHandler,															/*  29 $00b4 USART3 and USART4 */
	&CEC_CAN_IRQHandler,															/*  30 $00b8 CEC and CAN */
	&USB_IRQHandler,																/*  31 $00bc USB */
	];

@weak extern(C) void LowLevelInit();
@weak extern(C) void SystemInit();
@weak extern(C) void __libc_init_array();
@weak extern(C) extern __gshared c_ulong SystemCoreClock;
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
	uint32_t	saveFreq;

	LowLevelInit();
	SystemInit();

	saveFreq = SystemCoreClock;
	copyBlock(&_siccmram, &_sccmram, &_eccmram);
	copyBlock(&_sirelocated, &_srelocated, &_erelocated);
	zeroBlock(&_szeroed, &_ezeroed);
	__libc_init_array();
	if(&SystemCoreClock) SystemCoreClock = saveFreq;

	main();
	defaultExceptionHandler();
}

@naked extern(C) void defaultExceptionHandler()
{
	while(true)
	{
		wfi();
	}
}
