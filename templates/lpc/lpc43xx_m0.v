	M0_Reset_Handler,						/* Reset Vector */
	M0_NMI_Handler,							/* Non Maskable Interrupt Vector */
	M0_HardFault_Handler,					/* Hard Fault Vector */
	,										/* Memory Protection Unit Fault Vector */
	,										/* Bus Fault Vector */
	,										/* Usage Fault Vector */
	,										/* Reserved */
	,										/* Reserved */
	,										/* Reserved */
	,										/* Reserved */
	M0_SVC_Handler,							/* SuperVisor Call Vector */
	M0_DebugMon_Handler,					/* Reserved */
	,										/* Reserved */
	M0_PendSV_Handler,						/* Pending SuperVisor Vector */
	M0_SysTick_Handler,						/* System Tick Vector (this is not implemented on the LPC43xx!) */

	M0_RTC_IRQHandler,						/* RTC */
	M0_M4CORE_IRQHandler,					/* M4 Core */
	M0_DMA_IRQHandler,						/* General Purpose DMA */
	,										/* Reserved */
	,										/* Reserved */
	M0_ETH_IRQHandler,						/* Ethernet */
	M0_SDIO_IRQHandler,						/* SD/MMC */
	M0_LCD_IRQHandler,						/* LCD */
	M0_USB0_IRQHandler,						/* USB0 */
	M0_USB1_IRQHandler,						/* USB1 */
	M0_SCT_IRQHandler,						/* State Configurable Timer */
	M0_RIT_OR_WWDT_IRQHandler,				/* Repetitive Interrupt Timer */
	M0_TIMER0_IRQHandler,					/* Timer0 */
	M0_GINT1_IRQHandler,					/* GINT1 */
	M0_TIMER3_IRQHandler,					/* Timer3 */
	,										/* Reserved */
	,										/* Reserved */
	M0_MCPWM_IRQHandler,					/* Motor Control PWM */
	M0_ADC0_IRQHandler,						/* ADC0 */
	M0_I2C0_OR_I2C1_IRQHandler,				/* I2C0 or I2C1 */
	M0_SGPIO_IRQHandler,					/* Serial GPIO */
	M0_SPI_OR_DAC_IRQHandler,				/* SPI or DAC */
	M0_ADC1_IRQHandler,						/* ADC1 */
	M0_SSP0_OR_SSP1_IRQHandler,				/* SSP0 or SSP1 */
	M0_EVENTROUTER_IRQHandler,				/* Event Router */
	M0_USART0_IRQHandler,					/* USART0 */
	M0_USART2_OR_C_CAN1_IRQHandler,			/* USART2 or C CAN1 */
	M0_USART3_IRQHandler,					/* USART3 */
	M0_I2S0_OR_I2S1_OR_QEI_IRQHandler,		/* I2S0 or I2S1 or QEI */
	M0_C_CAN0_IRQHandler,					/* C CAN0 */
