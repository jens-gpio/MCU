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

	PIO0_0_IRQHandler,						/* GPIO port 0, pin 0 Interrupt */
	RESERVED1_IRQHandler,					/*  */
	RESERVED2_IRQHandler,					/*  */
	RESERVED3_IRQHandler,					/*  */
	RESERVED4_IRQHandler,					/*  */
	RESERVED5_IRQHandler,					/*  */
	RESERVED6_IRQHandler,					/*  */
	RESERVED7_IRQHandler,					/*  */
	PIO0_8_IRQHandler,						/* GPIO port 0, pin 8 Interrupt */
	PIO0_9_IRQHandler,						/* GPIO port 0, pin 9 Interrupt */
	PIO0_10_IRQHandler,						/* GPIO port 0, pin 10 Interrupt */
	PIO0_11_IRQHandler,						/* GPIO port 0, pin 11 Interrupt */
	PIO1_0_IRQHandler,						/* GPIO port 1, pin 0 Interrupt */
	RESERVED13_IRQHandler,					/*  */
	RESERVED14_IRQHandler,					/*  */
	RESERVED15_IRQHandler,					/*  */
	TIMER_16_0_IRQHandler,					/* 16-bit Timer0 Interrupt */
	TIMER_16_1_IRQHandler,					/* 16-bit Timer1 Interrupt */
	TIMER_32_0_IRQHandler,					/* 32-bit Timer0 Interrupt */
	TIMER_32_1_IRQHandler,					/* 32-bit Timer1 Interrupt */
	SSP0_IRQHandler,						/* SSP0 Interrupt */
	UART0_IRQHandler,						/* UART Interrupt */
	RESERVED22_IRQHandler,					/*  */
	RESERVED23_IRQHandler,					/*  */
	ADC_IRQHandler,							/* A/D Converter Interrupt */
	WDT_IRQHandler,							/* Watchdog timer Interrupt */
	BOD_IRQHandler,							/* Brown Out Detect(BOD) Interrupt */
	RESERVED27_IRQHandler,					/*  */
	RESERVED28_IRQHandler,					/*  */
	RESERVED29_IRQHandler,					/*  */
	PIO1_IRQHandler,						/* GPIO interrupt status of port 1 */
	PIO0_IRQHandler,						/* GPIO interrupt status of port 0 */
