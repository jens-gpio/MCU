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
	PIO0_1_IRQHandler,						/* GPIO port 0, pin 1 Interrupt */
	PIO0_2_IRQHandler,						/* GPIO port 0, pin 2 Interrupt */
	PIO0_3_IRQHandler,						/* GPIO port 0, pin 3 Interrupt */
	PIO0_4_IRQHandler,						/* GPIO port 0, pin 4 Interrupt */
	PIO0_5_IRQHandler,						/* GPIO port 0, pin 5 Interrupt */
	PIO0_6_IRQHandler,						/* GPIO port 0, pin 6 Interrupt */
	PIO0_7_IRQHandler,						/* GPIO port 0, pin 7 Interrupt */
	PIO0_8_IRQHandler,						/* GPIO port 0, pin 8 Interrupt */
	PIO0_9_IRQHandler,						/* GPIO port 0, pin 9 Interrupt */
	PIO0_10_IRQHandler,						/* GPIO port 0, pin 10 Interrupt */
	PIO0_11_IRQHandler,						/* GPIO port 0, pin 11 Interrupt */
	PIO1_0_IRQHandler,						/* GPIO port 1, pin 0 Interrupt */
	ADC_B_IRQHandler,						/* ADC_B Interrupt */
	SSP1_IRQHandler,						/* SSP1 Interrupt */
	I2C0_IRQHandler,						/* I2C Interrupt */
	TIMER_16_0_IRQHandler,					/* 16-bit Timer0 Interrupt */
	TIMER_16_1_IRQHandler,					/* 16-bit Timer1 Interrupt */
	TIMER_32_0_IRQHandler,					/* 32-bit Timer0 Interrupt */
	TIMER_32_1_IRQHandler,					/* 32-bit Timer1 Interrupt */
	SSP0_IRQHandler,						/* SSP0 Interrupt */
	UART0_IRQHandler,						/* UART0 Interrupt */
	UART1_IRQHandler,						/* UART1 Interrupt */
	UART2_IRQHandler,						/* UART2 Interrupt */
	ADC_A_IRQHandler,						/* ADC_A Converter Interrupt */
	WDT_IRQHandler,							/* Watchdog timer Interrupt */
	BOD_IRQHandler,							/* Brown Out Detect(BOD) Interrupt */
	Reserved27_IRQHandler,					/*  */
	PIO3_IRQHandler,						/* GPIO interrupt status of port 3 */
	PIO2_IRQHandler,						/* GPIO interrupt status of port 2 */
	PIO1_IRQHandler,						/* GPIO interrupt status of port 1 */
	PIO0_IRQHandler,						/* GPIO interrupt status of port 0 */
