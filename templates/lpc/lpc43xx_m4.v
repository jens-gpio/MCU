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
	DebugMon_Handler,						/* Reserved */
	,										/* Reserved */
	PendSV_Handler,							/* Pending SuperVisor Vector */
	SysTick_Handler,						/* System Tick Vector */

	DAC_IRQHandler,							/* D/A Converter */
	M0CORE_IRQHandler,						/* M0 Core */
	DMA_IRQHandler,							/* General Purpose DMA */
	EZH_IRQHandler,							/* EZH/EDM */
	FLASH_EEPROM_IRQHandler,				/* Reserved for Typhoon */
	ETH_IRQHandler,							/* Ethernet */
	SDIO_IRQHandler,						/* SD/MMC */
	LCD_IRQHandler,							/* LCD */
	USB0_IRQHandler,						/* USB0 */
	USB1_IRQHandler,						/* USB1 */
	SCT_IRQHandler,							/* State Configurable Timer */
	RIT_IRQHandler,							/* Repetitive Interrupt Timer */
	TIMER0_IRQHandler,						/* Timer0 */
	TIMER1_IRQHandler,						/* Timer1 */
	TIMER2_IRQHandler,						/* Timer2 */
	TIMER3_IRQHandler,						/* Timer3 */
	MCPWM_IRQHandler,						/* Motor Control PWM */
	ADC0_IRQHandler,						/* A/D Converter 0 */
	I2C0_IRQHandler,						/* I2C0 */
	I2C1_IRQHandler,						/* I2C1 */
	SPI_IRQHandler,							/* SPI */
	ADC1_IRQHandler,						/* A/D Converter 1 */
	SSP0_IRQHandler,						/* SSP0 */
	SSP1_IRQHandler,						/* SSP1 */
	UART0_IRQHandler,						/* UART0 */
	UART1_IRQHandler,						/* UART1 */
	UART2_IRQHandler,						/* UART2 */
	UART3_IRQHandler,						/* UART3 */
	I2S0_IRQHandler,						/* I2S0 */
	I2S1_IRQHandler,						/* I2S1 */
	SPIFI_IRQHandler,						/* SPI Flash Interface */
	SGPIO_IRQHandler,						/* SGPIO */
	GPIO0_IRQHandler,						/* GPIO0 */
	GPIO1_IRQHandler,						/* GPIO1 */
	GPIO2_IRQHandler,						/* GPIO2 */
	GPIO3_IRQHandler,						/* GPIO3 */
	GPIO4_IRQHandler,						/* GPIO4 */
	GPIO5_IRQHandler,						/* GPIO5 */
	GPIO6_IRQHandler,						/* GPIO6 */
	GPIO7_IRQHandler,						/* GPIO7 */
	GINT0_IRQHandler,						/* GINT0 */
	GINT1_IRQHandler,						/* GINT1 */
	EVRT_IRQHandler,						/* Event Router */
	CAN1_IRQHandler,						/* C_CAN1 */
	,										/* Reserved */
	VADC_IRQHandler,						/* VADC */
	ATIMER_IRQHandler,						/* ATIMER */
	RTC_IRQHandler,							/* RTC */
	,										/* Reserved */
	WDT_IRQHandler,							/* WDT */
	M0s_IRQHandler,							/* M0s */
	CAN0_IRQHandler,						/* C_CAN0 */
	QEI_IRQHandler,							/* QEI */
