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
@exc extern(C) void WAKEUP12_IRQHandler();
@exc extern(C) void WAKEUP13_IRQHandler();
@exc extern(C) void WAKEUP14_IRQHandler();
@exc extern(C) void WAKEUP15_IRQHandler();
@exc extern(C) void WAKEUP16_IRQHandler();
@exc extern(C) void WAKEUP17_IRQHandler();
@exc extern(C) void WAKEUP18_IRQHandler();
@exc extern(C) void WAKEUP19_IRQHandler();
@exc extern(C) void WAKEUP20_IRQHandler();
@exc extern(C) void WAKEUP21_IRQHandler();
@exc extern(C) void WAKEUP22_IRQHandler();
@exc extern(C) void WAKEUP23_IRQHandler();
@exc extern(C) void WAKEUP24_IRQHandler();
@exc extern(C) void WAKEUP25_IRQHandler();
@exc extern(C) void WAKEUP26_IRQHandler();
@exc extern(C) void WAKEUP27_IRQHandler();
@exc extern(C) void WAKEUP28_IRQHandler();
@exc extern(C) void WAKEUP29_IRQHandler();
@exc extern(C) void WAKEUP30_IRQHandler();
@exc extern(C) void WAKEUP31_IRQHandler();
@exc extern(C) void WAKEUP32_IRQHandler();
@exc extern(C) void WAKEUP33_IRQHandler();
@exc extern(C) void WAKEUP34_IRQHandler();
@exc extern(C) void WAKEUP35_IRQHandler();
@exc extern(C) void WAKEUP36_IRQHandler();
@exc extern(C) void WAKEUP37_IRQHandler();
@exc extern(C) void WAKEUP38_IRQHandler();
@exc extern(C) void WAKEUP39_IRQHandler();
@exc extern(C) void I2C0_IRQHandler();
@exc extern(C) void TIMER_16_0_IRQHandler();
@exc extern(C) void TIMER_16_1_IRQHandler();
@exc extern(C) void TIMER_32_0_IRQHandler();
@exc extern(C) void TIMER_32_1_IRQHandler();
@exc extern(C) void SSP0_IRQHandler();
@exc extern(C) void UART0_IRQHandler();
@exc extern(C) void USB0_IRQHandler();
@exc extern(C) void USB0_FIQ_IRQHandler();
@exc extern(C) void ADC_IRQHandler();
@exc extern(C) void WDT_IRQHandler();
@exc extern(C) void BOD_IRQHandler();
@exc extern(C) void EINT3_IRQHandler();
@exc extern(C) void EINT2_IRQHandler();
@exc extern(C) void EINT1_IRQHandler();
@exc extern(C) void EINT0_IRQHandler();
@exc extern(C) void SSP1_IRQHandler();

@isr_vector VectorFunc[73] g_pfnVectors = [
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

	&WAKEUP0_IRQHandler,															/*   0 $0040  */
	&WAKEUP1_IRQHandler,															/*   1 $0044  */
	&WAKEUP2_IRQHandler,															/*   2 $0048  */
	&WAKEUP3_IRQHandler,															/*   3 $004c  */
	&WAKEUP4_IRQHandler,															/*   4 $0050  */
	&WAKEUP5_IRQHandler,															/*   5 $0054  */
	&WAKEUP6_IRQHandler,															/*   6 $0058  */
	&WAKEUP7_IRQHandler,															/*   7 $005c  */
	&WAKEUP8_IRQHandler,															/*   8 $0060  */
	&WAKEUP9_IRQHandler,															/*   9 $0064  */
	&WAKEUP10_IRQHandler,															/*  10 $0068  */
	&WAKEUP11_IRQHandler,															/*  11 $006c  */
	&WAKEUP12_IRQHandler,															/*  12 $0070  */
	&WAKEUP13_IRQHandler,															/*  13 $0074  */
	&WAKEUP14_IRQHandler,															/*  14 $0078  */
	&WAKEUP15_IRQHandler,															/*  15 $007c  */
	&WAKEUP16_IRQHandler,															/*  16 $0080  */
	&WAKEUP17_IRQHandler,															/*  17 $0084  */
	&WAKEUP18_IRQHandler,															/*  18 $0088  */
	&WAKEUP19_IRQHandler,															/*  19 $008c  */
	&WAKEUP20_IRQHandler,															/*  20 $0090  */
	&WAKEUP21_IRQHandler,															/*  21 $0094  */
	&WAKEUP22_IRQHandler,															/*  22 $0098  */
	&WAKEUP23_IRQHandler,															/*  23 $009c  */
	&WAKEUP24_IRQHandler,															/*  24 $00a0  */
	&WAKEUP25_IRQHandler,															/*  25 $00a4  */
	&WAKEUP26_IRQHandler,															/*  26 $00a8  */
	&WAKEUP27_IRQHandler,															/*  27 $00ac  */
	&WAKEUP28_IRQHandler,															/*  28 $00b0  */
	&WAKEUP29_IRQHandler,															/*  29 $00b4  */
	&WAKEUP30_IRQHandler,															/*  30 $00b8  */
	&WAKEUP31_IRQHandler,															/*  31 $00bc  */
	&WAKEUP32_IRQHandler,															/*  32 $00c0  */
	&WAKEUP33_IRQHandler,															/*  33 $00c4  */
	&WAKEUP34_IRQHandler,															/*  34 $00c8  */
	&WAKEUP35_IRQHandler,															/*  35 $00cc  */
	&WAKEUP36_IRQHandler,															/*  36 $00d0  */
	&WAKEUP37_IRQHandler,															/*  37 $00d4  */
	&WAKEUP38_IRQHandler,															/*  38 $00d8  */
	&WAKEUP39_IRQHandler,															/*  39 $00dc  */

	&I2C0_IRQHandler,																/*  40 $00e0 I2C Interrupt */
	&TIMER_16_0_IRQHandler,															/*  41 $00e4 16-bit Timer0 Interrupt */
	&TIMER_16_1_IRQHandler,															/*  42 $00e8 16-bit Timer1 Interrupt */
	&TIMER_32_0_IRQHandler,															/*  43 $00ec 32-bit Timer0 Interrupt */
	&TIMER_32_1_IRQHandler,															/*  44 $00f0 32-bit Timer1 Interrupt */
	&SSP0_IRQHandler,																/*  45 $00f4 SSP Interrupt */
	&UART0_IRQHandler,																/*  46 $00f8 UART Interrupt */
	&USB0_IRQHandler,																/*  47 $00fc USB Regular Interrupt */
	&USB0_FIQ_IRQHandler,															/*  48 $0100 USB Fast Interrupt */
	&ADC_IRQHandler,																/*  49 $0104 A/D Converter Interrupt */
	&WDT_IRQHandler,																/*  50 $0108 Watchdog timer Interrupt */
	&BOD_IRQHandler,																/*  51 $010c Brown Out Detect(BOD) Interrupt */
	&EINT3_IRQHandler,																/*  52 $0110 External Interrupt 3 Interrupt */
	&EINT2_IRQHandler,																/*  53 $0114 External Interrupt 2 Interrupt */
	&EINT1_IRQHandler,																/*  54 $0118 External Interrupt 1 Interrupt */
	&EINT0_IRQHandler,																/*  55 $011c External Interrupt 0 Interrupt */
	&SSP1_IRQHandler,																/*  56 $0120 SSP1 Interrupt */
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
