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
@exc extern(C) void PIN_INT0_IRQHandler();
@exc extern(C) void PIN_INT1_IRQHandler();
@exc extern(C) void PIN_INT2_IRQHandler();
@exc extern(C) void PIN_INT3_IRQHandler();
@exc extern(C) void PIN_INT4_IRQHandler();
@exc extern(C) void PIN_INT5_IRQHandler();
@exc extern(C) void PIN_INT6_IRQHandler();
@exc extern(C) void PIN_INT7_IRQHandler();
@exc extern(C) void GINT0_IRQHandler();
@exc extern(C) void GINT1_IRQHandler();
@exc extern(C) void Reserved10_IRQHandler();
@exc extern(C) void Reserved11_IRQHandler();
@exc extern(C) void Reserved12_IRQHandler();
@exc extern(C) void Reserved13_IRQHandler();
@exc extern(C) void SSP1_IRQHandler();
@exc extern(C) void I2C0_IRQHandler();
@exc extern(C) void TIMER_16_0_IRQHandler();
@exc extern(C) void TIMER_16_1_IRQHandler();
@exc extern(C) void TIMER_32_0_IRQHandler();
@exc extern(C) void TIMER_32_1_IRQHandler();
@exc extern(C) void SSP0_IRQHandler();
@exc extern(C) void UART0_IRQHandler();
@exc extern(C) void Reserved22_IRQHandler();
@exc extern(C) void Reserved23_IRQHandler();
@exc extern(C) void ADC_IRQHandler();
@exc extern(C) void WDT_IRQHandler();
@exc extern(C) void BOD_IRQHandler();
@exc extern(C) void FMC_IRQHandler();
@exc extern(C) void RESERVED28_IRQHandler();
@exc extern(C) void RESERVED29_IRQHandler();
@exc extern(C) void RESERVED30_IRQHandler();
@exc extern(C) void RESERVED31_IRQHandler();

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

	&PIN_INT0_IRQHandler,															/*   0 $0040 Pin Interrupt 0 */
	&PIN_INT1_IRQHandler,															/*   1 $0044 Pin Interrupt 1 */
	&PIN_INT2_IRQHandler,															/*   2 $0048 Pin Interrupt 2 */
	&PIN_INT3_IRQHandler,															/*   3 $004c Pin Interrupt 3 */
	&PIN_INT4_IRQHandler,															/*   4 $0050 Pin Interrupt 4 */
	&PIN_INT5_IRQHandler,															/*   5 $0054 Pin Interrupt 5 */
	&PIN_INT6_IRQHandler,															/*   6 $0058 Pin Interrupt 6 */
	&PIN_INT7_IRQHandler,															/*   7 $005c Pin Interrupt 7 */
	&GINT0_IRQHandler,																/*   8 $0060 GPIO GROUP 0 interrupt */
	&GINT1_IRQHandler,																/*   9 $0064 GPIO GROUP 1 interrupt */
	&Reserved10_IRQHandler,															/*  10 $0068 Reserved Interrupt */
	&Reserved11_IRQHandler,															/*  11 $006c  */
	&Reserved12_IRQHandler,															/*  12 $0070  */
	&Reserved13_IRQHandler,															/*  13 $0074  */
	&SSP1_IRQHandler,																/*  14 $0078 SSP1 Interrupt */
	&I2C0_IRQHandler,																/*  15 $007c I2C Interrupt */
	&TIMER_16_0_IRQHandler,															/*  16 $0080 16-bit Timer0 Interrupt */
	&TIMER_16_1_IRQHandler,															/*  17 $0084 16-bit Timer1 Interrupt */
	&TIMER_32_0_IRQHandler,															/*  18 $0088 32-bit Timer0 Interrupt */
	&TIMER_32_1_IRQHandler,															/*  19 $008c 32-bit Timer1 Interrupt */
	&SSP0_IRQHandler,																/*  20 $0090 SSP0 Interrupt */
	&UART0_IRQHandler,																/*  21 $0094 UART Interrupt */
	&Reserved22_IRQHandler,															/*  22 $0098  */
	&Reserved23_IRQHandler,															/*  23 $009c  */
	&ADC_IRQHandler,																/*  24 $00a0 A/D Converter Interrupt */
	&WDT_IRQHandler,																/*  25 $00a4 Watchdog timer Interrupt */
	&BOD_IRQHandler,																/*  26 $00a8 Brown Out Detect(BOD) Interrupt */
	&FMC_IRQHandler,																/*  27 $00ac Flash Memory Controller Interrupt */
	&RESERVED28_IRQHandler,															/*  28 $00b0  */
	&RESERVED29_IRQHandler,															/*  29 $00b4  */
	&RESERVED30_IRQHandler,															/*  30 $00b8  */
	&RESERVED31_IRQHandler,															/*  31 $00bc  */
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
