	Reset_Handler,							/* Reset Vector */
	NMI_Handler,							/* Non Maskable Interrupt Vector */
	HardFault_Handler,						/* Hard Fault Vector */
	,										/* Reserved */
	,										/* Reserved */
	,										/* Reserved */
	,										/* Reserved */
	,										/* Reserved */
	,										/* Reserved */
	,										/* Reserved */
	SVC_Handler,							/* SuperVisor Call Vector */
	,										/* Reserved */
	,										/* Reserved */
	PendSV_Handler,							/* Pending SuperVisor Vector */
	SysTick_Handler,						/* System Tick Vector */

	WAKEUP0_IRQHandler,						/* Wakeup PIO0.0 */
	WAKEUP1_IRQHandler,						/* Wakeup PIO0.1 */
	WAKEUP2_IRQHandler,						/* Wakeup PIO0.2 */
	WAKEUP3_IRQHandler,						/* Wakeup PIO0.3 */
	WAKEUP4_IRQHandler,						/* Wakeup PIO0.4 */
	WAKEUP5_IRQHandler,						/* Wakeup PIO0.5 */
	WAKEUP6_IRQHandler,						/* Wakeup PIO0.6 */
	WAKEUP7_IRQHandler,						/* Wakeup PIO0.7 */
	WAKEUP8_IRQHandler,						/* Wakeup PIO0.8 */
	WAKEUP9_IRQHandler,						/* Wakeup PIO0.9 */
	WAKEUP10_IRQHandler,					/* Wakeup PIO0.10 */
	WAKEUP11_IRQHandler,					/* Wakeup PIO0.11 */
	I2C_IRQHandler,							/* I2C */
	TIMER16_0_IRQHandler,					/* 16-bit Timer0 */
	TIMER16_1_IRQHandler,					/* 16-bit Timer1 */
	TIMER32_0_IRQHandler,					/* 32-bit Timer0 */
	TIMER32_1_IRQHandler,					/* 32-bit Timer1 */
	SSP_IRQHandler,							/* SSP */
	UART0_IRQHandler,						/* UART0 */
	UART1_IRQHandler,						/* UART1 */
	COMP_IRQHandler,						/* Comparator */
	ADC_IRQHandler,							/* A/D Converter */
	WDT_IRQHandler,							/* Watchdog timer */
	BOD_IRQHandler,							/* Brown Out Detect */
	,										/* Reserved */
	PIOINT0_IRQHandler,						/* PIO INT0 */
	PIOINT1_IRQHandler,						/* PIO INT1 */
	PIOINT2_IRQHandler,						/* PIO INT2 */
	,										/* Reserved */
	DMA_IRQHandler,							/* DMA */
	RTC_IRQHandler,							/* RTC */
