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

BootRAM = 0xF108F85F;

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
@exc extern(C) void TAMPER_IRQHandler();
@exc extern(C) void RTC_IRQHandler();
@exc extern(C) void FLASH_IRQHandler();
@exc extern(C) void RCC_IRQHandler();
@exc extern(C) void EXTI0_IRQHandler();
@exc extern(C) void EXTI1_IRQHandler();
@exc extern(C) void EXTI2_IRQHandler();
@exc extern(C) void EXTI3_IRQHandler();
@exc extern(C) void EXTI4_IRQHandler();
@exc extern(C) void DMA1_Channel1_IRQHandler();
@exc extern(C) void DMA1_Channel2_IRQHandler();
@exc extern(C) void DMA1_Channel3_IRQHandler();
@exc extern(C) void DMA1_Channel4_IRQHandler();
@exc extern(C) void DMA1_Channel5_IRQHandler();
@exc extern(C) void DMA1_Channel6_IRQHandler();
@exc extern(C) void DMA1_Channel7_IRQHandler();
@exc extern(C) void ADC1_2_IRQHandler();
@exc extern(C) void USB_HP_CAN1_TX_IRQHandler();
@exc extern(C) void USB_LP_CAN1_RX0_IRQHandler();
@exc extern(C) void CAN1_RX1_IRQHandler();
@exc extern(C) void CAN1_SCE_IRQHandler();
@exc extern(C) void EXTI9_5_IRQHandler();
@exc extern(C) void TIM1_BRK_IRQHandler();
@exc extern(C) void TIM1_UP_IRQHandler();
@exc extern(C) void TIM1_TRG_COM_IRQHandler();
@exc extern(C) void TIM1_CC_IRQHandler();
@exc extern(C) void TIM2_IRQHandler();
@exc extern(C) void TIM3_IRQHandler();
@exc extern(C) void I2C1_EV_IRQHandler();
@exc extern(C) void I2C1_ER_IRQHandler();
@exc extern(C) void SPI1_IRQHandler();
@exc extern(C) void USART1_IRQHandler();
@exc extern(C) void USART2_IRQHandler();
@exc extern(C) void EXTI15_10_IRQHandler();
@exc extern(C) void RTC_Alarm_IRQHandler();
@exc extern(C) void USBWakeUp_IRQHandler();

@isr_vector VectorFunc[] g_pfnVectors = [
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
	&TAMPER_IRQHandler,																/*   2 $0048 Tamper */
	&RTC_IRQHandler,																/*   3 $004c RTC */
	&FLASH_IRQHandler,																/*   4 $0050 FLASH */
	&RCC_IRQHandler,																/*   5 $0054 RCC */
	&EXTI0_IRQHandler,																/*   6 $0058 EXTI Line0 */
	&EXTI1_IRQHandler,																/*   7 $005c EXTI Line1 */
	&EXTI2_IRQHandler,																/*   8 $0060 EXTI Line2 */
	&EXTI3_IRQHandler,																/*   9 $0064 EXTI Line3 */
	&EXTI4_IRQHandler,																/*  10 $0068 EXTI Line4 */
	&DMA1_Channel1_IRQHandler,														/*  11 $006c DMA1 Channel 1 */
	&DMA1_Channel2_IRQHandler,														/*  12 $0070 DMA1 Channel 2 */
	&DMA1_Channel3_IRQHandler,														/*  13 $0074 DMA1 Channel 3 */
	&DMA1_Channel4_IRQHandler,														/*  14 $0078 DMA1 Channel 4 */
	&DMA1_Channel5_IRQHandler,														/*  15 $007c DMA1 Channel 5 */
	&DMA1_Channel6_IRQHandler,														/*  16 $0080 DMA1 Channel 6 */
	&DMA1_Channel7_IRQHandler,														/*  17 $0084 DMA1 Channel 7 */
	&ADC1_2_IRQHandler,																/*  18 $0088 ADC1 and ADC2 */
	&USB_HP_CAN1_TX_IRQHandler,														/*  19 $008c USB High Priority + CAN1 TX */
	&USB_LP_CAN1_RX0_IRQHandler,													/*  20 $0090 USB Low Priority + CAN1 RX0 */
	&CAN1_RX1_IRQHandler,															/*  21 $0094 CAN1 RX1 */
	&CAN1_SCE_IRQHandler,															/*  22 $0098 CAN1 SCE */
	&EXTI9_5_IRQHandler,															/*  23 $009c External Line[9:5]s */
	&TIM1_BRK_IRQHandler,															/*  24 $00a0 TIM1 Break */
	&TIM1_UP_IRQHandler,															/*  25 $00a4 TIM1 Update */
	&TIM1_TRG_COM_IRQHandler,														/*  26 $00a8 TIM1 Trigger and Commutation */
	&TIM1_CC_IRQHandler,															/*  27 $00ac TIM1 Capture Compare */
	&TIM2_IRQHandler,																/*  28 $00b0 TIM2 */
	&TIM3_IRQHandler,																/*  29 $00b4 TIM3 */
	cast(VectorFunc)0,																/*  30 $00b8 Reserved */
	&I2C1_EV_IRQHandler,															/*  31 $00bc I2C1 Event */
	&I2C1_ER_IRQHandler,															/*  32 $00c0 I2C1 Error */
	cast(VectorFunc)0,																/*  33 $00c4 Reserved */
	cast(VectorFunc)0,																/*  34 $00c8 Reserved */
	&SPI1_IRQHandler,																/*  35 $00cc SPI1 */
	cast(VectorFunc)0,																/*  36 $00d0 Reserved */
	&USART1_IRQHandler,																/*  37 $00d4 USART1 */
	&USART2_IRQHandler,																/*  38 $00d8 USART2 */
	cast(VectorFunc)0,																/*  39 $00dc Reserved */
	&EXTI15_10_IRQHandler,															/*  40 $00e0 External Line[15:10]s */
	&RTC_Alarm_IRQHandler,															/*  41 $00e4 RTC Alarm (A and B) through EXTI Line */
	&USBWakeUp_IRQHandler,															/*  42 $00e8 USB Wakeup through EXTI line */
	cast(VectorFunc)0,																/*  43 $00ec Reserved */
	cast(VectorFunc)0,																/*  44 $00f0 Reserved */
	cast(VectorFunc)0,																/*  45 $00f4 Reserved */
	cast(VectorFunc)0,																/*  46 $00f8 Reserved */
	cast(VectorFunc)0,																/*  47 $00fc Reserved */
	cast(VectorFunc)0,																/*  48 $0100 Reserved */
	cast(VectorFunc)0,																/*  49 $0104 Reserved */
	cast(VectorFunc)BootRAM,														/*  50 $0108  */
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
