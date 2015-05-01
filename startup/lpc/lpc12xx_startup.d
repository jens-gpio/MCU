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
@exc extern(C) void WAKEUP0_IRQHandler();
@exc extern(C) void WAKEUP1_IRQHandler();
@exc extern(C) void WAKEUP2_IRQHandler();
@exc extern(C) void WAKEUP3_IRQHandler();
@exc extern(C) void WAKEUP4_IRQHandler();
@exc extern(C) void WAKEUP5_IRQHandler();
@exc extern(C) void WAKEUP6_IRQHandler();
@exc extern(C) void WAKEUP7_IRQHandler();
@exc extern(C) void WAKEUP8_IRQHandler();
@exc extern(C) void WAKEUP9_IRQHandler();
@exc extern(C) void WAKEUP10_IRQHandler();
@exc extern(C) void WAKEUP11_IRQHandler();
@exc extern(C) void I2C_IRQHandler();
@exc extern(C) void TIMER16_0_IRQHandler();
@exc extern(C) void TIMER16_1_IRQHandler();
@exc extern(C) void TIMER32_0_IRQHandler();
@exc extern(C) void TIMER32_1_IRQHandler();
@exc extern(C) void SSP_IRQHandler();
@exc extern(C) void UART0_IRQHandler();
@exc extern(C) void UART1_IRQHandler();
@exc extern(C) void COMP_IRQHandler();
@exc extern(C) void ADC_IRQHandler();
@exc extern(C) void WDT_IRQHandler();
@exc extern(C) void BOD_IRQHandler();
@exc extern(C) void PIOINT0_IRQHandler();
@exc extern(C) void PIOINT1_IRQHandler();
@exc extern(C) void PIOINT2_IRQHandler();
@exc extern(C) void DMA_IRQHandler();
@exc extern(C) void RTC_IRQHandler();

@isr_vector VectorFunc[47] g_pfnVectors = [
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

	&WAKEUP0_IRQHandler,															/*   0 $0040 Wakeup PIO0.0 */
	&WAKEUP1_IRQHandler,															/*   1 $0044 Wakeup PIO0.1 */
	&WAKEUP2_IRQHandler,															/*   2 $0048 Wakeup PIO0.2 */
	&WAKEUP3_IRQHandler,															/*   3 $004c Wakeup PIO0.3 */
	&WAKEUP4_IRQHandler,															/*   4 $0050 Wakeup PIO0.4 */
	&WAKEUP5_IRQHandler,															/*   5 $0054 Wakeup PIO0.5 */
	&WAKEUP6_IRQHandler,															/*   6 $0058 Wakeup PIO0.6 */
	&WAKEUP7_IRQHandler,															/*   7 $005c Wakeup PIO0.7 */
	&WAKEUP8_IRQHandler,															/*   8 $0060 Wakeup PIO0.8 */
	&WAKEUP9_IRQHandler,															/*   9 $0064 Wakeup PIO0.9 */
	&WAKEUP10_IRQHandler,															/*  10 $0068 Wakeup PIO0.10 */
	&WAKEUP11_IRQHandler,															/*  11 $006c Wakeup PIO0.11 */
	&I2C_IRQHandler,																/*  12 $0070 I2C */
	&TIMER16_0_IRQHandler,															/*  13 $0074 16-bit Timer0 */
	&TIMER16_1_IRQHandler,															/*  14 $0078 16-bit Timer1 */
	&TIMER32_0_IRQHandler,															/*  15 $007c 32-bit Timer0 */
	&TIMER32_1_IRQHandler,															/*  16 $0080 32-bit Timer1 */
	&SSP_IRQHandler,																/*  17 $0084 SSP */
	&UART0_IRQHandler,																/*  18 $0088 UART0 */
	&UART1_IRQHandler,																/*  19 $008c UART1 */
	&COMP_IRQHandler,																/*  20 $0090 Comparator */
	&ADC_IRQHandler,																/*  21 $0094 A/D Converter */
	&WDT_IRQHandler,																/*  22 $0098 Watchdog timer */
	&BOD_IRQHandler,																/*  23 $009c Brown Out Detect */
	cast(VectorFunc)0,																/*  24 $00a0 Reserved */
	&PIOINT0_IRQHandler,															/*  25 $00a4 PIO INT0 */
	&PIOINT1_IRQHandler,															/*  26 $00a8 PIO INT1 */
	&PIOINT2_IRQHandler,															/*  27 $00ac PIO INT2 */
	cast(VectorFunc)0,																/*  28 $00b0 Reserved */
	&DMA_IRQHandler,																/*  29 $00b4 DMA */
	&RTC_IRQHandler,																/*  30 $00b8 RTC */
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
