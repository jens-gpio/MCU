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
	EXTI2_IRQHandler,				/* EXTI Line2 */
	EXTI3_IRQHandler,				/* EXTI Line3 */
	EXTI4_IRQHandler,				/* EXTI Line4 */
	DMA1_Stream0_IRQHandler,		/* DMA1 Stream 0 */
	DMA1_Stream1_IRQHandler,		/* DMA1 Stream 1 */
	DMA1_Stream2_IRQHandler,		/* DMA1 Stream 2 */
	DMA1_Stream3_IRQHandler,		/* DMA1 Stream 3 */
	DMA1_Stream4_IRQHandler,		/* DMA1 Stream 4 */
	DMA1_Stream5_IRQHandler,		/* DMA1 Stream 5 */
	DMA1_Stream6_IRQHandler,		/* DMA1 Stream 6 */
	ADC_IRQHandler,					/* ADC1, ADC2 and ADC3s */
	,								/* Reserved */
	,								/* Reserved */
	,								/* Reserved */
	,								/* Reserved */
	EXTI9_5_IRQHandler,				/* External Line[9:5]s */
	TIM1_BRK_TIM9_IRQHandler,		/* TIM1 Break and TIM9 */
	TIM1_UP_TIM10_IRQHandler,		/* TIM1 Update and TIM10 */
	TIM1_TRG_COM_TIM11_IRQHandler,	/* TIM1 Trigger and Commutation and TIM11 */
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
	,								/* Reserved */
	EXTI15_10_IRQHandler,			/* External Line[15:10]s */
	RTC_Alarm_IRQHandler,			/* RTC Alarm (A and B) through EXTI Line */
	OTG_FS_WKUP_IRQHandler,			/* USB OTG FS Wakeup through EXTI line */
	,								/* Reserved */
	,								/* Reserved */
	,								/* Reserved */
	,								/* Reserved */
	DMA1_Stream7_IRQHandler,		/* DMA1 Stream7 */
	,								/* Reserved */
	SDIO_IRQHandler,				/* SDIO */
	TIM5_IRQHandler,				/* TIM5 */
	SPI3_IRQHandler,				/* SPI3 */
	,								/* Reserved */
	,								/* Reserved */
	,								/* Reserved */
	,								/* Reserved */
	DMA2_Stream0_IRQHandler,		/* DMA2 Stream 0 */
	DMA2_Stream1_IRQHandler,		/* DMA2 Stream 1 */
	DMA2_Stream2_IRQHandler,		/* DMA2 Stream 2 */
	DMA2_Stream3_IRQHandler,		/* DMA2 Stream 3 */
	DMA2_Stream4_IRQHandler,		/* DMA2 Stream 4 */
	,								/* Reserved */
	,								/* Reserved */
	,								/* Reserved */
	,								/* Reserved */
	,								/* Reserved */
	,								/* Reserved */
	OTG_FS_IRQHandler,				/* USB OTG FS */
	DMA2_Stream5_IRQHandler,		/* DMA2 Stream 5 */
	DMA2_Stream6_IRQHandler,		/* DMA2 Stream 6 */
	DMA2_Stream7_IRQHandler,		/* DMA2 Stream 7 */
	USART6_IRQHandler,				/* USART6 */
	I2C3_EV_IRQHandler,				/* I2C3 event */
	I2C3_ER_IRQHandler,				/* I2C3 error */
	,								/* Reserved */
	,								/* Reserved */
	,								/* Reserved */
	,								/* Reserved */
	,								/* Reserved */
	,								/* Reserved */
	,								/* Reserved */
	FPU_IRQHandler,					/* FPU */
	,								/* Reserved */
	,								/* Reserved */
	SPI4_IRQHandler,				/* SPI4 */
	SPI5_IRQHandler,				/* SPI5 */
