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
	DebugMon_Handler,										/* Reserved */
	,										/* Reserved */
	PendSV_Handler,							/* Pending SuperVisor Vector */
	SysTick_Handler,						/* System Tick Vector */

	WAKEUP0_IRQHandler,						/*  */
	WAKEUP1_IRQHandler,						/*  */
	WAKEUP2_IRQHandler,						/*  */
	WAKEUP3_IRQHandler,						/*  */
	WAKEUP4_IRQHandler,						/*  */
	WAKEUP5_IRQHandler,						/*  */
	WAKEUP6_IRQHandler,						/*  */
	WAKEUP7_IRQHandler,						/*  */
	WAKEUP8_IRQHandler,						/*  */
	WAKEUP9_IRQHandler,						/*  */
	WAKEUP10_IRQHandler,					/*  */
	WAKEUP11_IRQHandler,					/*  */
	WAKEUP12_IRQHandler,					/*  */
	WAKEUP13_IRQHandler,					/*  */
	WAKEUP14_IRQHandler,					/*  */
	WAKEUP15_IRQHandler,					/*  */
	WAKEUP16_IRQHandler,					/*  */
	WAKEUP17_IRQHandler,					/*  */
	WAKEUP18_IRQHandler,					/*  */
	WAKEUP19_IRQHandler,					/*  */
	WAKEUP20_IRQHandler,					/*  */
	WAKEUP21_IRQHandler,					/*  */
	WAKEUP22_IRQHandler,					/*  */
	WAKEUP23_IRQHandler,					/*  */
	WAKEUP24_IRQHandler,					/*  */
	WAKEUP25_IRQHandler,					/*  */
	WAKEUP26_IRQHandler,					/*  */
	WAKEUP27_IRQHandler,					/*  */
	WAKEUP28_IRQHandler,					/*  */
	WAKEUP29_IRQHandler,					/*  */
	WAKEUP30_IRQHandler,					/*  */
	WAKEUP31_IRQHandler,					/*  */
	WAKEUP32_IRQHandler,					/*  */
	WAKEUP33_IRQHandler,					/*  */
	WAKEUP34_IRQHandler,					/*  */
	WAKEUP35_IRQHandler,					/*  */
	WAKEUP36_IRQHandler,					/*  */
	WAKEUP37_IRQHandler,					/*  */
	WAKEUP38_IRQHandler,					/*  */
	WAKEUP39_IRQHandler,					/*  */

	I2C0_IRQHandler,						/* I2C Interrupt */
	TIMER_16_0_IRQHandler,					/* 16-bit Timer0 Interrupt */
	TIMER_16_1_IRQHandler,					/* 16-bit Timer1 Interrupt */
	TIMER_32_0_IRQHandler,					/* 32-bit Timer0 Interrupt */
	TIMER_32_1_IRQHandler,					/* 32-bit Timer1 Interrupt */
	SSP0_IRQHandler,						/* SSP Interrupt */
	UART0_IRQHandler,						/* UART Interrupt */
	USB0_IRQHandler,						/* USB Regular Interrupt */
	USB0_FIQ_IRQHandler,					/* USB Fast Interrupt */
	ADC_IRQHandler,							/* A/D Converter Interrupt */
	WDT_IRQHandler,							/* Watchdog timer Interrupt */
	BOD_IRQHandler,							/* Brown Out Detect(BOD) Interrupt */
	EINT3_IRQHandler,						/* External Interrupt 3 Interrupt */
	EINT2_IRQHandler,						/* External Interrupt 2 Interrupt */
	EINT1_IRQHandler,						/* External Interrupt 1 Interrupt */
	EINT0_IRQHandler,						/* External Interrupt 0 Interrupt */
	SSP1_IRQHandler,						/* SSP1 Interrupt */
