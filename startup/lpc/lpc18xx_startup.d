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
@exc extern(C) void DAC_IRQHandler();
@exc extern(C) void DMA_IRQHandler();
@exc extern(C) void ETH_IRQHandler();
@exc extern(C) void SDIO_IRQHandler();
@exc extern(C) void LCD_IRQHandler();
@exc extern(C) void USB0_IRQHandler();
@exc extern(C) void USB1_IRQHandler();
@exc extern(C) void SCT_IRQHandler();
@exc extern(C) void RIT_IRQHandler();
@exc extern(C) void TIMER0_IRQHandler();
@exc extern(C) void TIMER1_IRQHandler();
@exc extern(C) void TIMER2_IRQHandler();
@exc extern(C) void TIMER3_IRQHandler();
@exc extern(C) void MCPWM_IRQHandler();
@exc extern(C) void ADC0_IRQHandler();
@exc extern(C) void I2C0_IRQHandler();
@exc extern(C) void I2C1_IRQHandler();
@exc extern(C) void ADC1_IRQHandler();
@exc extern(C) void SSP0_IRQHandler();
@exc extern(C) void SSP1_IRQHandler();
@exc extern(C) void UART0_IRQHandler();
@exc extern(C) void UART1_IRQHandler();
@exc extern(C) void UART2_IRQHandler();
@exc extern(C) void UART3_IRQHandler();
@exc extern(C) void I2S0_IRQHandler();
@exc extern(C) void I2S1_IRQHandler();
@exc extern(C) void SPIFI_IRQHandler();
@exc extern(C) void SGPIO_IRQHandler();
@exc extern(C) void GPIO0_IRQHandler();
@exc extern(C) void GPIO1_IRQHandler();
@exc extern(C) void GPIO2_IRQHandler();
@exc extern(C) void GPIO3_IRQHandler();
@exc extern(C) void GPIO4_IRQHandler();
@exc extern(C) void GPIO5_IRQHandler();
@exc extern(C) void GPIO6_IRQHandler();
@exc extern(C) void GPIO7_IRQHandler();
@exc extern(C) void GINT0_IRQHandler();
@exc extern(C) void GINT1_IRQHandler();
@exc extern(C) void EVRT_IRQHandler();
@exc extern(C) void CAN1_IRQHandler();
@exc extern(C) void VADC_IRQHandler();
@exc extern(C) void ATIMER_IRQHandler();
@exc extern(C) void RTC_IRQHandler();
@exc extern(C) void WDT_IRQHandler();
@exc extern(C) void CAN0_IRQHandler();
@exc extern(C) void QEI_IRQHandler();

@isr_vector VectorFunc[69] g_pfnVectors = [
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
	&DebugMon_Handler,																/*  -4 $0030 Reserved */
	cast(VectorFunc)0,																/*  -3 $0034 Reserved */
	&PendSV_Handler,																/*  -2 $0038 Pending SuperVisor Vector */
	&SysTick_Handler,																/*  -1 $003c System Tick Vector */

	&DAC_IRQHandler,																/*   0 $0040 D/A Converter */
	cast(VectorFunc)0,																/*   1 $0044 Event Router */
	&DMA_IRQHandler,																/*   2 $0048 General Purpose DMA */
	cast(VectorFunc)0,																/*   3 $004c Reserved */
	cast(VectorFunc)0,																/*   4 $0050 Reserved */
	&ETH_IRQHandler,																/*   5 $0054 Ethernet */
	&SDIO_IRQHandler,																/*   6 $0058 SD/MMC */
	&LCD_IRQHandler,																/*   7 $005c LCD */
	&USB0_IRQHandler,																/*   8 $0060 USB0 */
	&USB1_IRQHandler,																/*   9 $0064 USB1 */
	&SCT_IRQHandler,																/*  10 $0068 State Configurable Timer */
	&RIT_IRQHandler,																/*  11 $006c Repetitive Interrupt Timer */
	&TIMER0_IRQHandler,																/*  12 $0070 Timer0 */
	&TIMER1_IRQHandler,																/*  13 $0074 Timer1 */
	&TIMER2_IRQHandler,																/*  14 $0078 Timer2 */
	&TIMER3_IRQHandler,																/*  15 $007c Timer3 */
	&MCPWM_IRQHandler,																/*  16 $0080 Motor Control PWM */
	&ADC0_IRQHandler,																/*  17 $0084 A/D Converter 0 */
	&I2C0_IRQHandler,																/*  18 $0088 I2C0 */
	&I2C1_IRQHandler,																/*  19 $008c I2C1 */
	cast(VectorFunc)0,																/*  20 $0090 Reserved */
	&ADC1_IRQHandler,																/*  21 $0094 A/D Converter 1 */
	&SSP0_IRQHandler,																/*  22 $0098 SSP0 */
	&SSP1_IRQHandler,																/*  23 $009c SSP1 */
	&UART0_IRQHandler,																/*  24 $00a0 UART0 */
	&UART1_IRQHandler,																/*  25 $00a4 UART1 */
	&UART2_IRQHandler,																/*  26 $00a8 UART2 */
	&UART3_IRQHandler,																/*  27 $00ac UART3 */
	&I2S0_IRQHandler,																/*  28 $00b0 I2S */
	&I2S1_IRQHandler,																/*  29 $00b4 AES Engine */
	&SPIFI_IRQHandler,																/*  30 $00b8 SPI Flash Interface */
	&SGPIO_IRQHandler,																/*  31 $00bc SGPIO */
	&GPIO0_IRQHandler,																/*  32 $00c0 GPIO0 */
	&GPIO1_IRQHandler,																/*  33 $00c4 GPIO1 */
	&GPIO2_IRQHandler,																/*  34 $00c8 GPIO2 */
	&GPIO3_IRQHandler,																/*  35 $00cc GPIO3 */
	&GPIO4_IRQHandler,																/*  36 $00d0 GPIO4 */
	&GPIO5_IRQHandler,																/*  37 $00d4 GPIO5 */
	&GPIO6_IRQHandler,																/*  38 $00d8 GPIO6 */
	&GPIO7_IRQHandler,																/*  39 $00dc GPIO7 */
	&GINT0_IRQHandler,																/*  40 $00e0 GINT0 */
	&GINT1_IRQHandler,																/*  41 $00e4 GINT1 */
	&EVRT_IRQHandler,																/*  42 $00e8 Event Router */
	&CAN1_IRQHandler,																/*  43 $00ec C_CAN1 */
	cast(VectorFunc)0,																/*  44 $00f0 Reserved */
	&VADC_IRQHandler,																/*  45 $00f4 VADC */
	&ATIMER_IRQHandler,																/*  46 $00f8 ATIMER */
	&RTC_IRQHandler,																/*  47 $00fc RTC */
	cast(VectorFunc)0,																/*  48 $0100 Reserved */
	&WDT_IRQHandler,																/*  49 $0104 WDT */
	cast(VectorFunc)0,																/*  50 $0108 M0s */
	&CAN0_IRQHandler,																/*  51 $010c C_CAN0 */
	&QEI_IRQHandler,																/*  52 $0110 QEI */
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
