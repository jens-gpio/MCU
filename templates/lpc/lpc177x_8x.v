	Reset_Handler,					/* Reset Vector */
	NMI_Handler,					/* Non Maskable Interrupt Vector */
	HardFault_Handler,				/* Hard Fault Vector */
	MemManage_Handler,				/* Memory Protection Unit Fault Vector */
	BusFault_Handler,				/* Bus Fault Vector */
	UsageFault_Handler,				/* Usage Fault Vector */
	,								/* Reserved */
	,								/* Reserved */
	,								/* Reserved */
	,								/* Reserved */
	SVC_Handler,					/* SuperVisor Call Vector */
	DebugMon_Handler,				/* Debug Monitor Vector */
	,								/* Reserved */
	PendSV_Handler,					/* Pending SuperVisor Vector */
	SysTick_Handler,				/* System Tick Vector */

	WDT_IRQHandler,					/* Watchdog Timer */
	TIMER0_IRQHandler,				/* Timer0 */
	TIMER1_IRQHandler,				/* Timer1 */
	TIMER2_IRQHandler,				/* Timer2 */
	TIMER3_IRQHandler,				/* Timer3 */
	UART0_IRQHandler,				/* UART0 */
	UART1_IRQHandler,				/* UART1 */
	UART2_IRQHandler,				/* UART2 */
	UART3_IRQHandler,				/* UART3 */
	PWM1_IRQHandler,				/* PWM1 */
	I2C0_IRQHandler,				/* I2C0 */
	I2C1_IRQHandler,				/* I2C1 */
	I2C2_IRQHandler,				/* I2C2 */
	,								/* Reserved */
	SSP0_IRQHandler,				/* SSP0 */
	SSP1_IRQHandler,				/* SSP1 */
	PLL0_IRQHandler,				/* PLL0 Lock (Main PLL) */
	RTC_IRQHandler,					/* Real Time Clock */
	EINT0_IRQHandler,				/* External Interrupt 0 */
	EINT1_IRQHandler,				/* External Interrupt 1 */
	EINT2_IRQHandler,				/* External Interrupt 2 */
	EINT3_IRQHandler,				/* External Interrupt 3 */
	ADC_IRQHandler,					/* A/D Converter */
	BOD_IRQHandler,					/* Brown-Out Detect */
	USB_IRQHandler,					/* USB */
	CAN_IRQHandler,					/* CAN */
	DMA_IRQHandler,					/* General Purpose DMA */
	I2S_IRQHandler,					/* I2S */
	ENET_IRQHandler,				/* Ethernet */
	MCI_IRQHandler,					/* SD/MMC Card */
	MCPWM_IRQHandler,				/* Motor Control PWM */
	QEI_IRQHandler,					/* Quadrature Encoder Interface */
	PLL1_IRQHandler,				/* PLL1 Lock (USB PLL) */
	USBActivity_IRQHandler,			/* USB Activity */
	CANActivity_IRQHandler,			/* CAN Activity */
	UART4_IRQHandler,				/* UART4 */
	SSP2_IRQHandler,				/* LCD_IRQHandler */
	GPIO_IRQHandler,				/* GPIO */
	PWM0_IRQHandler,				/* PWM0 */
	EEPROM_IRQHandler,				/* EEPROM */
