	Reset_Handler,					/* Reset Vector */
	NMI_Handler,					/* Non Maskable Interrupt Vector */
	HardFault_Handler,				/* Hard Fault Vector */
	,								/* Reserved */
	,								/* Reserved */
	,								/* Reserved */
	,								/* Reserved */
	,								/* Reserved */
	,								/* Reserved */
	,								/* Reserved */
	SVC_Handler,					/* SuperVisor Call Vector */
	,								/* Reserved */
	,								/* Reserved */
	PendSV_Handler,					/* Pending SuperVisor Vector */
	SysTick_Handler,				/* System Tick Vector */

	WWDG_IRQHandler,				/* Windowed WatchDog */
	,								/* Reserved */
	RTC_IRQHandler,					/* RTC through the EXTI line */
	FLASH_IRQHandler,				/* FLASH */
	RCC_IRQHandler,					/* RCC */
	EXTI0_1_IRQHandler,				/* EXTI Line 0 and 1 */
	EXTI2_3_IRQHandler,				/* EXTI Line 2 and 3 */
	EXTI4_15_IRQHandler,			/* EXTI Line 4 to 15 */
	,								/* Reserved */
	DMA1_Channel1_IRQHandler,		/* DMA1 Channel 1 */
	DMA1_Channel2_3_IRQHandler,		/* DMA1 Channel 2 and Channel 3 */
	DMA1_Channel4_5_IRQHandler,		/* DMA1 Channel 4 and Channel 5 */
	ADC1_IRQHandler,				/* ADC1 */
	TIM1_BRK_UP_TRG_COM_IRQHandler,	/* TIM1 Break, Update, Trigger and Commutation */
	TIM1_CC_IRQHandler,				/* TIM1 Capture Compare */
	,								/* Reserved */
	TIM3_IRQHandler,				/* TIM3 */
	,								/* Reserved */
	,								/* Reserved */
	TIM14_IRQHandler,				/* TIM14 */
	,								/* Reserved */
	TIM16_IRQHandler,				/* TIM16 */
	TIM17_IRQHandler,				/* TIM17 */
	I2C1_IRQHandler,				/* I2C1 */
	,								/* Reserved */
	SPI1_IRQHandler,				/* SPI1 */
	,								/* Reserved */
	USART1_IRQHandler,				/* USART1 */
	,								/* Reserved */
	,								/* Reserved */
	,								/* Reserved */
	,								/* Reserved */
