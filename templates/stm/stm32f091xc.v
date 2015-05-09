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
	PVD_VDDIO2_IRQHandler,			/* PVD and VDDIO2 through EXTI Line detection */
	RTC_IRQHandler,					/* RTC through the EXTI line */
	FLASH_IRQHandler,				/* FLASH */
	RCC_CRS_IRQHandler,				/* RCC and CRS */
	EXTI0_1_IRQHandler,				/* EXTI Line 0 and 1 */
	EXTI2_3_IRQHandler,				/* EXTI Line 2 and 3 */
	EXTI4_15_IRQHandler,			/* EXTI Line 4 to 15 */
	TSC_IRQHandler,					/* TSC */
	DMA1_Ch1_IRQHandler,			/* DMA1 Channel 1 */
	DMA1_Ch2_3_DMA2_Ch1_2_IRQHandler,	/* DMA1 Channel 2 and 3 & DMA2 Channel 1 and 2 */
	DMA1_Ch4_7_DMA2_Ch3_5_IRQHandler,	/* DMA1 Channel 4 to 7 & DMA2 Channel 3 to 5 */
	ADC1_COMP_IRQHandler,			/* ADC1, COMP1 and COMP2 */
	TIM1_BRK_UP_TRG_COM_IRQHandler,	/* TIM1 Break, Update, Trigger and Commutation */
	TIM1_CC_IRQHandler,				/* TIM1 Capture Compare */
	TIM2_IRQHandler,				/* TIM2 */
	TIM3_IRQHandler,				/* TIM3 */
	TIM6_DAC_IRQHandler,			/* TIM6 and DAC */
	TIM7_IRQHandler,				/* TIM7 */
	TIM14_IRQHandler,				/* TIM14 */
	TIM15_IRQHandler,				/* TIM15 */
	TIM16_IRQHandler,				/* TIM16 */
	TIM17_IRQHandler,				/* TIM17 */
	I2C1_IRQHandler,				/* I2C1 */
	I2C2_IRQHandler,				/* I2C2 */
	SPI1_IRQHandler,				/* SPI1 */
	SPI2_IRQHandler,				/* SPI2 */
	USART1_IRQHandler,				/* USART1 */
	USART2_IRQHandler,				/* USART2 */
	USART3_8_IRQHandler,			/* USART3, USART4, USART5, USART6, USART7, USART8 */
	CEC_CAN_IRQHandler,				/* CEC and CAN */
