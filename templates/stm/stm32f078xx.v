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
	VDDIO2_IRQHandler,				/* VDDIO2 Monitor through EXTI Line 31 */
	RTC_IRQHandler,					/* RTC through the EXTI line */
	FLASH_IRQHandler,				/* FLASH */
	RCC_CRS_IRQHandler,				/* RCC and CRS */
	EXTI0_1_IRQHandler,				/* EXTI Line 0 and 1 */
	EXTI2_3_IRQHandler,				/* EXTI Line 2 and 3 */
	EXTI4_15_IRQHandler,			/* EXTI Line 4 to 15 */
	TSC_IRQHandler,					/* TSC */
	DMA1_Channel1_IRQHandler,		/* DMA1 Channel 1 */
	DMA1_Channel2_3_IRQHandler,		/* DMA1 Channel 2 and Channel 3 */
	DMA1_Channel4_5_6_7_IRQHandler,	/* DMA1 Channel 4, Channel 5, Channel 6 and Channel 7 */
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
	USART3_4_IRQHandler,			/* USART3 and USART4 */
	CEC_CAN_IRQHandler,				/* CEC and CAN */
	USB_IRQHandler,					/* USB */
