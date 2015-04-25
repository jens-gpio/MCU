module startup;

version(GNU)
{
	static import gcc.attribute;					// we need this to get the section, weak and alias attributes
	void wfi(){ version(ALLOW_WFI){ asm{ "wfi"; } } }
}
else version(LDC)
{
	import ldc.llvmasm;
	void wfi(){ version(ALLOW_WFI){ __asm("wfi"); } }
}

import core.stdc.config;							// we need this for c_ulong, so we can get symbols from the linker-script
import core.stdc.stdint;							// these are the types normally used on microcontrollers

// Create convenience enums and aliases for the weak and alias attributes:
enum isr_vector = gcc.attribute.attribute("section",".isr_vector.ro");
enum naked = gcc.attribute.attribute("naked");
enum weak = gcc.attribute.attribute("weak");
alias Tuple(A...) = A;
alias rst = Tuple!(weak, gcc.attribute.attribute("alias", "defaultResetHandler"));
alias exc = Tuple!(weak, gcc.attribute.attribute("alias", "defaultExceptionHandler"));

// The following symbols are provided by our linker-script:
extern(C) extern __gshared c_ulong _stack;			// initial stack address
extern(C) extern __gshared c_ulong _siccmram;		// pointer to read-only data that needs to be copied to CCMRAM
extern(C) extern __gshared c_ulong _sccmram;		// start address of .ccmram section (somewhere within CCMRAM)
extern(C) extern __gshared c_ulong _eccmram;		// end address of .ccmram section (somewhere within CCMRAM)
extern(C) extern __gshared c_ulong _sirelocated;	// pointer to read-only data that needs to be copied to normal SRAM
extern(C) extern __gshared c_ulong _srelocated;		// start address of .relocated section (somewhere within SRAM)
extern(C) extern __gshared c_ulong _erelocated;		// end address of .relocated section (somewhere within SRAM)
extern(C) extern __gshared c_ulong _szeroed;		// start address of .zeroed section (somewhere within SRAM or CCMRAM)
extern(C) extern __gshared c_ulong _ezeroed;		// end address of .zeroed section (somewhere within SRAM or CCMRAM)

// Create a convenience alias for our vector functions:
//alias extern(C) const void function() VectorFunc;	// currently, this won't work for me
alias extern(C) const void *VectorFunc;				// so I'm using a void* instead.

