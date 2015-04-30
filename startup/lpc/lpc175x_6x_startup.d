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
@exc extern(C) void WDT_IRQHandler();
@exc extern(C) void TIMER0_IRQHandler();
@exc extern(C) void TIMER1_IRQHandler();
@exc extern(C) void TIMER2_IRQHandler();
@exc extern(C) void TIMER3_IRQHandler();
@exc extern(C) void UART0_IRQHandler();
@exc extern(C) void UART1_IRQHandler();
@exc extern(C) void UART2_IRQHandler();
@exc extern(C) void UART3_IRQHandler();
@exc extern(C) void PWM1_IRQHandler();
@exc extern(C) void I2C0_IRQHandler();
@exc extern(C) void I2C1_IRQHandler();
@exc extern(C) void I2C2_IRQHandler();
@exc extern(C) void SPI_IRQHandler();
@exc extern(C) void SSP0_IRQHandler();
@exc extern(C) void SSP1_IRQHandler();
@exc extern(C) void PLL0_IRQHandler();
@exc extern(C) void RTC_IRQHandler();
@exc extern(C) void EINT0_IRQHandler();
@exc extern(C) void EINT1_IRQHandler();
@exc extern(C) void EINT2_IRQHandler();
@exc extern(C) void EINT3_IRQHandler();
@exc extern(C) void ADC_IRQHandler();
@exc extern(C) void BOD_IRQHandler();
@exc extern(C) void USB_IRQHandler();
@exc extern(C) void CAN_IRQHandler();
@exc extern(C) void DMA_IRQHandler();
@exc extern(C) void I2S_IRQHandler();
@exc extern(C) void ENET_IRQHandler();
@exc extern(C) void RIT_IRQHandler();
@exc extern(C) void MCPWM_IRQHandler();
@exc extern(C) void QEI_IRQHandler();
@exc extern(C) void PLL1_IRQHandler();
@exc extern(C) void USBActivity_IRQHandler();
@exc extern(C) void CANActivity_IRQHandler();

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

	&WDT_IRQHandler,																/*   0 $0040 Watchdog Timer */
	&TIMER0_IRQHandler,																/*   1 $0044 Timer0 */
	&TIMER1_IRQHandler,																/*   2 $0048 Timer1 */
	&TIMER2_IRQHandler,																/*   3 $004c Timer2 */
	&TIMER3_IRQHandler,																/*   4 $0050 Timer3 */
	&UART0_IRQHandler,																/*   5 $0054 UART0 */
	&UART1_IRQHandler,																/*   6 $0058 UART1 */
	&UART2_IRQHandler,																/*   7 $005c UART2 */
	&UART3_IRQHandler,																/*   8 $0060 UART3 */
	&PWM1_IRQHandler,																/*   9 $0064 PWM1 */
	&I2C0_IRQHandler,																/*  10 $0068 I2C0 */
	&I2C1_IRQHandler,																/*  11 $006c I2C1 */
	&I2C2_IRQHandler,																/*  12 $0070 I2C2 */
	&SPI_IRQHandler,																/*  13 $0074 SPI */
	&SSP0_IRQHandler,																/*  14 $0078 SSP0 */
	&SSP1_IRQHandler,																/*  15 $007c SSP1 */
	&PLL0_IRQHandler,																/*  16 $0080 PLL0 Lock (Main PLL) */
	&RTC_IRQHandler,																/*  17 $0084 Real Time Clock */
	&EINT0_IRQHandler,																/*  18 $0088 External Interrupt 0 */
	&EINT1_IRQHandler,																/*  19 $008c External Interrupt 1 */
	&EINT2_IRQHandler,																/*  20 $0090 External Interrupt 2 */
	&EINT3_IRQHandler,																/*  21 $0094 External Interrupt 3 */
	&ADC_IRQHandler,																/*  22 $0098 A/D Converter */
	&BOD_IRQHandler,																/*  23 $009c Brown-Out Detect */
	&USB_IRQHandler,																/*  24 $00a0 USB */
	&CAN_IRQHandler,																/*  25 $00a4 CAN */
	&DMA_IRQHandler,																/*  26 $00a8 General Purpose DMA */
	&I2S_IRQHandler,																/*  27 $00ac I2S */
	&ENET_IRQHandler,																/*  28 $00b0 Ethernet */
	&RIT_IRQHandler,																/*  29 $00b4 Repetitive Interrupt Timer */
	&MCPWM_IRQHandler,																/*  30 $00b8 Motor Control PWM */
	&QEI_IRQHandler,																/*  31 $00bc Quadrature Encoder Interface */
	&PLL1_IRQHandler,																/*  32 $00c0 PLL1 Lock (USB PLL) */
	&USBActivity_IRQHandler,														/*  33 $00c4 USB Activity */
	&CANActivity_IRQHandler,														/*  34 $00c8 CAN Activity */
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
