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
	DebugMon_Handler,				/* Debug Monitor Vector */
	,								/* Reserved */
	PendSV_Handler,					/* Pending SuperVisor Vector */
	SysTick_Handler,				/* System Tick Vector */

	WWDG_IRQHandler,				/* Windowed WatchDog */
	PVD_IRQHandler,					/* PVD through EXTI Line detection */
	RTC_IRQHandler,					/* RTC through the EXTI line */
	FLASH_IRQHandler,				/* FLASH */
	RCC_IRQHandler,					/* RCC */
	EXTI0_1_IRQHandler,				/* EXTI Line 0 and 1 */
	EXTI2_3_IRQHandler,				/* EXTI Line 2 and 3 */
	EXTI4_15_IRQHandler,			/* EXTI Line 4 to 15 */
	,								/* Reserved */
	DMA1_Channel1_IRQHandler,		/* DMA1 Channel 1 */
	DMA1_Channel2_3_IRQHandler,		/* DMA1 Channel 2 and Channel 3 */
	DMA1_Channel4_5_6_7_IRQHandler,	/* DMA1 Channel 4, Channel 5, Channel 6 and Channel 7 */
	ADC1_COMP_IRQHandler,			/* ADC1, COMP1 and COMP2 */
	LPTIM1_IRQHandler,				/* LPTIM1 */
	,								/* Reserved */
	TIM2_IRQHandler,				/* TIM2 */
	,								/* Reserved */
	TIM6_IRQHandler,				/* TIM6 */
	,								/* Reserved */
	,								/* Reserved */
	TIM21_IRQHandler,				/* TIM21 */
	,								/* Reserved */
	TIM22_IRQHandler,				/* TIM22 */
	I2C1_IRQHandler,				/* I2C1 */
	I2C2_IRQHandler,				/* I2C2 */
	SPI1_IRQHandler,				/* SPI1 */
	SPI2_IRQHandler,				/* SPI2 */
	USART1_IRQHandler,				/* USART1 */
	USART2_IRQHandler,				/* USART2 */
	LPUART1_IRQHandler,				/* LPUART1 */
	,								/* Reserved */
	,								/* Reserved */
