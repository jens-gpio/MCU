	Reset_Handler,							/* Reset Vector */
	NMI_Handler,							/* Non Maskable Interrupt Vector */
	HardFault_Handler,						/* Hard Fault Vector */
	MemManage_Handler,						/* Memory Protection Unit Fault Vector */
	BusFault_Handler,						/* Bus Fault Vector */
	UsageFault_Handler,						/* Usage Fault Vector */
	,										/* Reserved */
	,										/* Reserved */
	,										/* Reserved */
	,										/* Reserved */
	SVC_Handler,							/* SuperVisor Call Vector */
	DebugMon_Handler,										/* Reserved */
	,										/* Reserved */
	PendSV_Handler,							/* Pending SuperVisor Vector */
	SysTick_Handler,						/* System Tick Vector */

	PIN_INT0_IRQHandler,					/* PIN_INT0 */
	PIN_INT1_IRQHandler,					/* PIN_INT1 */
	PIN_INT2_IRQHandler,					/* PIN_INT2 */
	PIN_INT3_IRQHandler,					/* PIN_INT3 */
	PIN_INT4_IRQHandler,					/* PIN_INT4 */
	PIN_INT5_IRQHandler,					/* PIN_INT5 */
	PIN_INT6_IRQHandler,					/* PIN_INT6 */
	PIN_INT7_IRQHandler,					/* PIN_INT7 */
	GINT0_IRQHandler,						/* GINT0 */
	GINT1_IRQHandler,						/* GINT1 */
	,										/* Reserved */
	,										/* Reserved */
	RIT_IRQHandler,							/* Repetitive Interrupt Timer */
	,										/* Reserved */
	SSP1_IRQHandler,						/* SSP1 */
	I2C0_IRQHandler,						/* I2C0 */
	TIMER_16_0_IRQHandler,					/* 16-bit Timer0 Interrupt */
	TIMER_16_1_IRQHandler,					/* 16-bit Timer1 Interrupt */
	TIMER_32_0_IRQHandler,					/* 32-bit Timer0 Interrupt */
	TIMER_32_1_IRQHandler,					/* 32-bit Timer1 Interrupt */
	SSP0_IRQHandler,						/* SSP0 */
	UART0_IRQHandler,						/* USART */
	USB0_IRQHandler,						/* USB_IRQ */
	USB0_FIQ_IRQHandler,					/* USB_FIQ */
	ADC_IRQHandler,							/* ADC */
	WDT_IRQHandler,							/* WDT */
	BOD_IRQHandler,							/* BOD */
	FMC_IRQHandler,							/* FMC */
	,										/* Reserved */
	,										/* Reserved */
	USB_WAKEUP_IRQHandler,					/* USBWAKEUP */
	,										/* Reserved */
