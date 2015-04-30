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
@exc extern(C) void SPI0_IRQHandler();
@exc extern(C) void SPI1_IRQHandler();
@exc extern(C) void UART0_IRQHandler();
@exc extern(C) void UART1_IRQHandler();
@exc extern(C) void UART2_IRQHandler();
@exc extern(C) void I2C0_IRQHandler();
@exc extern(C) void SCT_IRQHandler();
@exc extern(C) void MRT_IRQHandler();
@exc extern(C) void CMP_IRQHandler();
@exc extern(C) void WDT_IRQHandler();
@exc extern(C) void BOD_IRQHandler();
@exc extern(C) void FLASH_IRQHandler();
@exc extern(C) void WKT_IRQHandler();
@exc extern(C) void PIN_INT0_IRQHandler();
@exc extern(C) void PIN_INT1_IRQHandler();
@exc extern(C) void PIN_INT2_IRQHandler();
@exc extern(C) void PIN_INT3_IRQHandler();
@exc extern(C) void PIN_INT4_IRQHandler();
@exc extern(C) void PIN_INT5_IRQHandler();
@exc extern(C) void PIN_INT6_IRQHandler();
@exc extern(C) void PIN_INT7_IRQHandler();

@isr_vector VectorFunc[] g_pfnVectors = [
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

	&SPI0_IRQHandler,																/*   0 $0040 SPI0 */
	&SPI1_IRQHandler,																/*   1 $0044 SPI1 */
	cast(VectorFunc)0,																/*   2 $0048 Reserved */
	&UART0_IRQHandler,																/*   3 $004c UART0 */
	&UART1_IRQHandler,																/*   4 $0050 UART1 */
	&UART2_IRQHandler,																/*   5 $0054 UART2 */
	cast(VectorFunc)0,																/*   6 $0058 Reserved */
	cast(VectorFunc)0,																/*   7 $005c Reserved */
	&I2C0_IRQHandler,																/*   8 $0060 I2C0 */
	&SCT_IRQHandler,																/*   9 $0064 SCT */
	&MRT_IRQHandler,																/*  10 $0068 MRT */
	&CMP_IRQHandler,																/*  11 $006c CMP */
	&WDT_IRQHandler,																/*  12 $0070 WDT */
	&BOD_IRQHandler,																/*  13 $0074 BOD */
	&FLASH_IRQHandler,																/*  14 $0078 Flash Interrupt */
	&WKT_IRQHandler,																/*  15 $007c WKT Interrupt */
	cast(VectorFunc)0,																/*  16 $0080 Reserved */
	cast(VectorFunc)0,																/*  17 $0084 Reserved */
	cast(VectorFunc)0,																/*  18 $0088 Reserved */
	cast(VectorFunc)0,																/*  19 $008c Reserved */
	cast(VectorFunc)0,																/*  20 $0090 Reserved */
	cast(VectorFunc)0,																/*  21 $0094 Reserved */
	cast(VectorFunc)0,																/*  22 $0098 Reserved */
	cast(VectorFunc)0,																/*  23 $009c Reserved */
	&PIN_INT0_IRQHandler,															/*  24 $00a0 External Interrupt 0 */
	&PIN_INT1_IRQHandler,															/*  25 $00a4 External Interrupt 1 */
	&PIN_INT2_IRQHandler,															/*  26 $00a8 External Interrupt 2 */
	&PIN_INT3_IRQHandler,															/*  27 $00ac External Interrupt 3 */
	&PIN_INT4_IRQHandler,															/*  28 $00b0 External Interrupt 4 */
	&PIN_INT5_IRQHandler,															/*  29 $00b4 External Interrupt 5 */
	&PIN_INT6_IRQHandler,															/*  30 $00b8 External Interrupt 6 */
	&PIN_INT7_IRQHandler,															/*  31 $00bc External Interrupt 7 */
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
