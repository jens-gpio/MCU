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

	WWDG_IRQHandler,				/* Windowed WatchDog */
	PVD_IRQHandler,					/* PVD through EXTI Line detection */
	TAMP_STAMP_IRQHandler,			/* Tamper and TimeStamps through the EXTI line */
	RTC_WKUP_IRQHandler,			/* RTC Wakeup through the EXTI line */
	FLASH_IRQHandler,				/* FLASH */
	RCC_IRQHandler,					/* RCC */
	EXTI0_IRQHandler,				/* EXTI Line0 */
	EXTI1_IRQHandler,				/* EXTI Line1 */
	EXTI2_TSC_IRQHandler,			/* EXTI Line2 */
	EXTI3_IRQHandler,				/* EXTI Line3 */
	EXTI4_IRQHandler,				/* EXTI Line4 */
	DMA1_Channel1_IRQHandler,		/* DMA1 Channel 1 */
	DMA1_Channel2_IRQHandler,		/* DMA1 Channel 2 */
	DMA1_Channel3_IRQHandler,		/* DMA1 Channel 3 */
	DMA1_Channel4_IRQHandler,		/* DMA1 Channel 4 */
	DMA1_Channel5_IRQHandler,		/* DMA1 Channel 5 */
	DMA1_Channel6_IRQHandler,		/* DMA1 Channel 6 */
	DMA1_Channel7_IRQHandler,		/* DMA1 Channel 7 */
	ADC1_2_IRQHandler,				/* ADC1 and ADC2 */
	USB_HP_CAN_TX_IRQHandler,		/* USB High Priority and CAN TX */
	USB_LP_CAN_RX0_IRQHandler,		/* USB Low Priority and CAN RX0 */
	CAN_RX1_IRQHandler,				/* CAN RX1 */
	CAN_SCE_IRQHandler,				/* CAN SCE */
	EXTI9_5_IRQHandler,				/* External Line[9:5]s */
	TIM1_BRK_TIM15_IRQHandler,		/* TIM1 Break and TIM15 */
	TIM1_UP_TIM16_IRQHandler,		/* TIM1 Update and TIM16 */
	TIM1_TRG_COM_TIM17_IRQHandler,	/* TIM1 Trigger and Commutation and TIM17 */
	TIM1_CC_IRQHandler,				/* TIM1 Capture Compare */
	TIM2_IRQHandler,				/* TIM2 */
	TIM3_IRQHandler,				/* TIM3 */
	TIM4_IRQHandler,				/* TIM4 */
	I2C1_EV_IRQHandler,				/* I2C1 Event */
	I2C1_ER_IRQHandler,				/* I2C1 Error */
	I2C2_EV_IRQHandler,				/* I2C2 Event */
	I2C2_ER_IRQHandler,				/* I2C2 Error */
	SPI1_IRQHandler,				/* SPI1 */
	SPI2_IRQHandler,				/* SPI2 */
	USART1_IRQHandler,				/* USART1 */
	USART2_IRQHandler,				/* USART2 */
	USART3_IRQHandler,				/* USART3 */
	EXTI15_10_IRQHandler,			/* External Line[15:10]s */
	RTC_Alarm_IRQHandler,			/* RTC Alarm (A and B) through EXTI Line */
	USBWakeUp_IRQHandler,			/* USB Wake Up */
	TIM8_BRK_IRQHandler,			/* TIM8 Break */
	TIM8_UP_IRQHandler,				/* TIM8 Update */
	TIM8_TRG_COM_IRQHandler,		/* TIM8 Trigger and Commutation */
	TIM8_CC_IRQHandler,				/* TIM8 Capture Compare */
	ADC3_IRQHandler,				/* ADC3 */
	,								/* Reserved */
	,								/* Reserved */
	,								/* Reserved */
	SPI3_IRQHandler,				/* SPI3 */
	,								/* Reserved */
	,								/* Reserved */
	TIM6_DAC_IRQHandler,			/* TIM6 and DAC */
	TIM7_IRQHandler,				/* TIM7 */
	DMA2_Channel1_IRQHandler,		/* DMA2 Channel 1 */
	DMA2_Channel2_IRQHandler,		/* DMA2 Channel 2 */
	DMA2_Channel3_IRQHandler,		/* DMA2 Channel 3 */
	DMA2_Channel4_IRQHandler,		/* DMA2 Channel 4 */
	DMA2_Channel5_IRQHandler,		/* DMA2 Channel 5 */
	ADC4_IRQHandler,				/* ADC4 */
	,								/* Reserved */
	,								/* Reserved */
	COMP1_2_3_IRQHandler,			/* Comparator1, Comparator2 and Comparator3 */
	COMP4_5_6_IRQHandler,			/* Comparator4, Comparator5 and Comparator6 */
	COMP7_IRQHandler,				/* Comparator7 */
	,								/* Reserved */
	,								/* Reserved */
	,								/* Reserved */
	,								/* Reserved */
	,								/* Reserved */
	,								/* Reserved */
	,								/* Reserved */
	USB_HP_IRQHandler,				/* USB High Priority */
	USB_LP_IRQHandler,				/* USB Low Priority */
	USBWakeUp_RMP_IRQHandler,		/* USB Wake Up and RMP */
	,								/* Reserved */
	TIM19_IRQHandler,				/* TIM19 */
	,								/* Reserved */
	,								/* Reserved */
	FPU_IRQHandler,					/* FPU */