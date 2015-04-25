	Reset_Handler,							/* Reset Vector */
	NMI_Handler,							/* Non Maskable Interrupt Vector */
	HardFault_Handler,						/* Hard Fault Vector */
	,										/* Reserved */
	,										/* Reserved */
	,										/* Reserved */
	,										/* Reserved */
	,										/* Reserved */
	,										/* Reserved */
	,										/* Reserved */
	SVC_Handler,							/* SuperVisor Call Vector */
	,										/* Reserved */
	,										/* Reserved */
	PendSV_Handler,							/* Pending SuperVisor Vector */
	SysTick_Handler,						/* System Tick Vector */

	SPI0_IRQHandler,						/* SPI0 */
	SPI1_IRQHandler,						/* SPI1 */
	,										/* Reserved */
	UART0_IRQHandler,						/* UART0 */
	UART1_IRQHandler,						/* UART1 */
	UART2_IRQHandler,						/* UART2 */
	,										/* Reserved */
	,										/* Reserved */
	I2C0_IRQHandler,						/* I2C0 */
	SCT_IRQHandler,							/* SCT */
	MRT_IRQHandler,							/* MRT */
	CMP_IRQHandler,							/* CMP */
	WDT_IRQHandler,							/* WDT */
	BOD_IRQHandler,							/* BOD */
	FLASH_IRQHandler,						/* Flash Interrupt */
	WKT_IRQHandler,							/* WKT Interrupt */
	,										/* Reserved */
	,										/* Reserved */
	,										/* Reserved */
	,										/* Reserved */
	,										/* Reserved */
	,										/* Reserved */
	,										/* Reserved */
	,										/* Reserved */
	PIN_INT0_IRQHandler,					/* External Interrupt 0 */
	PIN_INT1_IRQHandler,					/* External Interrupt 1 */
	PIN_INT2_IRQHandler,					/* External Interrupt 2 */
	PIN_INT3_IRQHandler,					/* External Interrupt 3 */
	PIN_INT4_IRQHandler,					/* External Interrupt 4 */
	PIN_INT5_IRQHandler,					/* External Interrupt 5 */
	PIN_INT6_IRQHandler,					/* External Interrupt 6 */
	PIN_INT7_IRQHandler,					/* External Interrupt 7 */
