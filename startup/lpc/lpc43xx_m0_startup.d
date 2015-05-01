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

@rst extern(C) void M0_Reset_Handler();
@exc extern(C) void M0_NMI_Handler();
@exc extern(C) void M0_HardFault_Handler();
@exc extern(C) void M0_SVC_Handler();
@exc extern(C) void M0_DebugMon_Handler();
@exc extern(C) void M0_PendSV_Handler();
@exc extern(C) void M0_SysTick_Handler();
@exc extern(C) void M0_RTC_IRQHandler();
@exc extern(C) void M0_M4CORE_IRQHandler();
@exc extern(C) void M0_DMA_IRQHandler();
@exc extern(C) void M0_ETH_IRQHandler();
@exc extern(C) void M0_SDIO_IRQHandler();
@exc extern(C) void M0_LCD_IRQHandler();
@exc extern(C) void M0_USB0_IRQHandler();
@exc extern(C) void M0_USB1_IRQHandler();
@exc extern(C) void M0_SCT_IRQHandler();
@exc extern(C) void M0_RIT_OR_WWDT_IRQHandler();
@exc extern(C) void M0_TIMER0_IRQHandler();
@exc extern(C) void M0_GINT1_IRQHandler();
@exc extern(C) void M0_TIMER3_IRQHandler();
@exc extern(C) void M0_MCPWM_IRQHandler();
@exc extern(C) void M0_ADC0_IRQHandler();
@exc extern(C) void M0_I2C0_OR_I2C1_IRQHandler();
@exc extern(C) void M0_SGPIO_IRQHandler();
@exc extern(C) void M0_SPI_OR_DAC_IRQHandler();
@exc extern(C) void M0_ADC1_IRQHandler();
@exc extern(C) void M0_SSP0_OR_SSP1_IRQHandler();
@exc extern(C) void M0_EVENTROUTER_IRQHandler();
@exc extern(C) void M0_USART0_IRQHandler();
@exc extern(C) void M0_USART2_OR_C_CAN1_IRQHandler();
@exc extern(C) void M0_USART3_IRQHandler();
@exc extern(C) void M0_I2S0_OR_I2S1_OR_QEI_IRQHandler();
@exc extern(C) void M0_C_CAN0_IRQHandler();

@isr_vector VectorFunc[46] g_pfnVectors = [
	cast(VectorFunc)&_stack,														/* -16 $0000 Initial Stack Pointer */
	&M0_Reset_Handler,																/* -15 $0004 Reset Vector */
	&M0_NMI_Handler,																/* -14 $0008 Non Maskable Interrupt Vector */
	&M0_HardFault_Handler,															/* -13 $000c Hard Fault Vector */
	cast(VectorFunc)0,																/* -12 $0010 Memory Protection Unit Fault Vector */
	cast(VectorFunc)0,																/* -11 $0014 Bus Fault Vector */
	cast(VectorFunc)0,																/* -10 $0018 Usage Fault Vector */
	cast(VectorFunc)0,																/*  -9 $001c Reserved */
	cast(VectorFunc)0,																/*  -8 $0020 Reserved */
	cast(VectorFunc)0,																/*  -7 $0024 Reserved */
	cast(VectorFunc)0,																/*  -6 $0028 Reserved */
	&M0_SVC_Handler,																/*  -5 $002c SuperVisor Call Vector */
	&M0_DebugMon_Handler,															/*  -4 $0030 Reserved */
	cast(VectorFunc)0,																/*  -3 $0034 Reserved */
	&M0_PendSV_Handler,																/*  -2 $0038 Pending SuperVisor Vector */
	&M0_SysTick_Handler,															/*  -1 $003c System Tick Vector (this is not implemented on the LPC43xx!) */

	&M0_RTC_IRQHandler,																/*   0 $0040 RTC */
	&M0_M4CORE_IRQHandler,															/*   1 $0044 M4 Core */
	&M0_DMA_IRQHandler,																/*   2 $0048 General Purpose DMA */
	cast(VectorFunc)0,																/*   3 $004c Reserved */
	cast(VectorFunc)0,																/*   4 $0050 Reserved */
	&M0_ETH_IRQHandler,																/*   5 $0054 Ethernet */
	&M0_SDIO_IRQHandler,															/*   6 $0058 SD/MMC */
	&M0_LCD_IRQHandler,																/*   7 $005c LCD */
	&M0_USB0_IRQHandler,															/*   8 $0060 USB0 */
	&M0_USB1_IRQHandler,															/*   9 $0064 USB1 */
	&M0_SCT_IRQHandler,																/*  10 $0068 State Configurable Timer */
	&M0_RIT_OR_WWDT_IRQHandler,														/*  11 $006c Repetitive Interrupt Timer */
	&M0_TIMER0_IRQHandler,															/*  12 $0070 Timer0 */
	&M0_GINT1_IRQHandler,															/*  13 $0074 GINT1 */
	&M0_TIMER3_IRQHandler,															/*  14 $0078 Timer3 */
	cast(VectorFunc)0,																/*  15 $007c Reserved */
	cast(VectorFunc)0,																/*  16 $0080 Reserved */
	&M0_MCPWM_IRQHandler,															/*  17 $0084 Motor Control PWM */
	&M0_ADC0_IRQHandler,															/*  18 $0088 ADC0 */
	&M0_I2C0_OR_I2C1_IRQHandler,													/*  19 $008c I2C0 or I2C1 */
	&M0_SGPIO_IRQHandler,															/*  20 $0090 Serial GPIO */
	&M0_SPI_OR_DAC_IRQHandler,														/*  21 $0094 SPI or DAC */
	&M0_ADC1_IRQHandler,															/*  22 $0098 ADC1 */
	&M0_SSP0_OR_SSP1_IRQHandler,													/*  23 $009c SSP0 or SSP1 */
	&M0_EVENTROUTER_IRQHandler,														/*  24 $00a0 Event Router */
	&M0_USART0_IRQHandler,															/*  25 $00a4 USART0 */
	&M0_USART2_OR_C_CAN1_IRQHandler,												/*  26 $00a8 USART2 or C CAN1 */
	&M0_USART3_IRQHandler,															/*  27 $00ac USART3 */
	&M0_I2S0_OR_I2S1_OR_QEI_IRQHandler,												/*  28 $00b0 I2S0 or I2S1 or QEI */
	&M0_C_CAN0_IRQHandler,															/*  29 $00b4 C CAN0 */
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

	copyBlock(&_siccmram, &_sccmram, &_eccmram);
	copyBlock(&_sirelocated, &_srelocated, &_erelocated);
	zeroBlock(&_szeroed, &_ezeroed);
	__libc_init_array();
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
