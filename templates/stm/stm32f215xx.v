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
	CAN1_TX_IRQHandler,				/* CAN1 TX */
	CAN1_RX0_IRQHandler,			/* CAN1 RX0 */
	CAN1_RX1_IRQHandler,			/* CAN1 RX1 */
	CAN1_SCE_IRQHandler,			/* CAN1 SCE */
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
	USART3_IRQHandler,				/* USART3 */
	EXTI15_10_IRQHandler,			/* External Line[15:10]s */
	RTC_Alarm_IRQHandler,			/* RTC Alarm (A and B) through EXTI Line */
	OTG_FS_WKUP_IRQHandler,			/* USB OTG FS Wakeup through EXTI line */
	TIM8_BRK_TIM12_IRQHandler,		/* TIM8 Break and TIM12 */
	TIM8_UP_TIM13_IRQHandler,		/* TIM8 Update and TIM13 */
	TIM8_TRG_COM_TIM14_IRQHandler,	/* TIM8 Trigger and Commutation and TIM14 */
	TIM8_CC_IRQHandler,				/* TIM8 Capture Compare */
	DMA1_Stream7_IRQHandler,		/* DMA1 Stream7 */
	FSMC_IRQHandler,				/* FSMC */
	SDIO_IRQHandler,				/* SDIO */
	TIM5_IRQHandler,				/* TIM5 */
	SPI3_IRQHandler,				/* SPI3 */
	UART4_IRQHandler,				/* UART4 */
	UART5_IRQHandler,				/* UART5 */
	TIM6_DAC_IRQHandler,			/* TIM6 and DAC1&2 underrun errors */
	TIM7_IRQHandler,				/* TIM7 */
	DMA2_Stream0_IRQHandler,		/* DMA2 Stream 0 */
	DMA2_Stream1_IRQHandler,		/* DMA2 Stream 1 */
	DMA2_Stream2_IRQHandler,		/* DMA2 Stream 2 */
	DMA2_Stream3_IRQHandler,		/* DMA2 Stream 3 */
	DMA2_Stream4_IRQHandler,		/* DMA2 Stream 4 */
	,								/* Reserved */
	,								/* Reserved */
	CAN2_TX_IRQHandler,				/* CAN2 TX */
	CAN2_RX0_IRQHandler,			/* CAN2 RX0 */
	CAN2_RX1_IRQHandler,			/* CAN2 RX1 */
	CAN2_SCE_IRQHandler,			/* CAN2 SCE */
	OTG_FS_IRQHandler,				/* USB OTG FS */
	DMA2_Stream5_IRQHandler,		/* DMA2 Stream 5 */
	DMA2_Stream6_IRQHandler,		/* DMA2 Stream 6 */
	DMA2_Stream7_IRQHandler,		/* DMA2 Stream 7 */
	USART6_IRQHandler,				/* USART6 */
	I2C3_EV_IRQHandler,				/* I2C3 event */
	I2C3_ER_IRQHandler,				/* I2C3 error */
	OTG_HS_EP1_OUT_IRQHandler,		/* USB OTG HS End Point 1 Out */
	OTG_HS_EP1_IN_IRQHandler,		/* USB OTG HS End Point 1 In */
	OTG_HS_WKUP_IRQHandler,			/* USB OTG HS Wakeup through EXTI */
	OTG_HS_IRQHandler,				/* USB OTG HS */
	,								/* Reserved */
	CRYP_IRQHandler,				/* CRYP crypto */
	HASH_RNG_IRQHandler,			/* Hash and Rng */
