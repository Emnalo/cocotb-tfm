// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table implementation internals

#include "Vtop__pch.h"
#include "Vtop.h"
#include "Vtop___024root.h"

// FUNCTIONS
Vtop__Syms::~Vtop__Syms()
{

    // Tear down scope hierarchy
    __Vhier.remove(0, &__Vscope_GenericComponent);
    __Vhier.remove(&__Vscope_GenericComponent, &__Vscope_GenericComponent__U_Inversor);

}

Vtop__Syms::Vtop__Syms(VerilatedContext* contextp, const char* namep, Vtop* modelp)
    : VerilatedSyms{contextp}
    // Setup internal state of the Syms class
    , __Vm_modelp{modelp}
    // Setup module instances
    , TOP{this, namep}
{
    // Configure time unit / time precision
    _vm_contextp__->timeunit(-9);
    _vm_contextp__->timeprecision(-12);
    // Setup each module's pointers to their submodules
    // Setup each module's pointer back to symbol table (for public functions)
    TOP.__Vconfigure(true);
    // Setup scopes
    __Vscope_GenericComponent.configure(this, name(), "GenericComponent", "GenericComponent", -9, VerilatedScope::SCOPE_MODULE);
    __Vscope_GenericComponent__U_Inversor.configure(this, name(), "GenericComponent.U_Inversor", "U_Inversor", -9, VerilatedScope::SCOPE_MODULE);
    __Vscope_GenericComponent__unnamedblk1.configure(this, name(), "GenericComponent.unnamedblk1", "unnamedblk1", -9, VerilatedScope::SCOPE_OTHER);
    __Vscope_GenericComponent__unnamedblk2.configure(this, name(), "GenericComponent.unnamedblk2", "unnamedblk2", -9, VerilatedScope::SCOPE_OTHER);
    __Vscope_GenericComponent__unnamedblk3.configure(this, name(), "GenericComponent.unnamedblk3", "unnamedblk3", -9, VerilatedScope::SCOPE_OTHER);
    __Vscope_TOP.configure(this, name(), "TOP", "TOP", 0, VerilatedScope::SCOPE_OTHER);

    // Set up scope hierarchy
    __Vhier.add(0, &__Vscope_GenericComponent);
    __Vhier.add(&__Vscope_GenericComponent, &__Vscope_GenericComponent__U_Inversor);

    // Setup export functions
    for (int __Vfinal = 0; __Vfinal < 2; ++__Vfinal) {
        __Vscope_GenericComponent.varInsert(__Vfinal,"DONE", const_cast<void*>(static_cast<const void*>(&(TOP.GenericComponent__DOT__DONE))), true, VLVT_UINT8,VLVD_NODIR|VLVF_PUB_RW,1 ,1,0);
        __Vscope_GenericComponent.varInsert(__Vfinal,"IDLE", const_cast<void*>(static_cast<const void*>(&(TOP.GenericComponent__DOT__IDLE))), true, VLVT_UINT8,VLVD_NODIR|VLVF_PUB_RW,1 ,1,0);
        __Vscope_GenericComponent.varInsert(__Vfinal,"N", const_cast<void*>(static_cast<const void*>(&(TOP.GenericComponent__DOT__N))), true, VLVT_UINT32,VLVD_NODIR|VLVF_PUB_RW,1 ,31,0);
        __Vscope_GenericComponent.varInsert(__Vfinal,"WORKING", const_cast<void*>(static_cast<const void*>(&(TOP.GenericComponent__DOT__WORKING))), true, VLVT_UINT8,VLVD_NODIR|VLVF_PUB_RW,1 ,1,0);
        __Vscope_GenericComponent.varInsert(__Vfinal,"array_constant", &(TOP.GenericComponent__DOT__array_constant), false, VLVT_UINT8,VLVD_NODIR|VLVF_PUB_RW,1 ,3,0);
        __Vscope_GenericComponent.varInsert(__Vfinal,"array_signal", &(TOP.GenericComponent__DOT__array_signal), false, VLVT_UINT8,VLVD_NODIR|VLVF_PUB_RW,2 ,3,0 ,0,3);
        __Vscope_GenericComponent.varInsert(__Vfinal,"clk", &(TOP.GenericComponent__DOT__clk), false, VLVT_UINT8,VLVD_NODIR|VLVF_PUB_RW,0);
        __Vscope_GenericComponent.varInsert(__Vfinal,"counter", &(TOP.GenericComponent__DOT__counter), false, VLVT_UINT32,VLVD_NODIR|VLVF_PUB_RW,1 ,31,0);
        __Vscope_GenericComponent.varInsert(__Vfinal,"din", &(TOP.GenericComponent__DOT__din), false, VLVT_UINT8,VLVD_NODIR|VLVF_PUB_RW,1 ,3,0);
        __Vscope_GenericComponent.varInsert(__Vfinal,"dout", &(TOP.GenericComponent__DOT__dout), false, VLVT_UINT8,VLVD_NODIR|VLVF_PUB_RW,1 ,3,0);
        __Vscope_GenericComponent.varInsert(__Vfinal,"enable", &(TOP.GenericComponent__DOT__enable), false, VLVT_UINT8,VLVD_NODIR|VLVF_PUB_RW,0);
        __Vscope_GenericComponent.varInsert(__Vfinal,"inversa", &(TOP.GenericComponent__DOT__inversa), false, VLVT_UINT8,VLVD_NODIR|VLVF_PUB_RW,1 ,3,0);
        __Vscope_GenericComponent.varInsert(__Vfinal,"rst", &(TOP.GenericComponent__DOT__rst), false, VLVT_UINT8,VLVD_NODIR|VLVF_PUB_RW,0);
        __Vscope_GenericComponent.varInsert(__Vfinal,"state", &(TOP.GenericComponent__DOT__state), false, VLVT_UINT8,VLVD_NODIR|VLVF_PUB_RW,1 ,1,0);
        __Vscope_GenericComponent.varInsert(__Vfinal,"temp_inversa", &(TOP.GenericComponent__DOT__temp_inversa), false, VLVT_UINT8,VLVD_NODIR|VLVF_PUB_RW,1 ,3,0);
        __Vscope_GenericComponent.varInsert(__Vfinal,"temp_var", &(TOP.GenericComponent__DOT__temp_var), false, VLVT_UINT8,VLVD_NODIR|VLVF_PUB_RW,1 ,3,0);
        __Vscope_GenericComponent__U_Inversor.varInsert(__Vfinal,"N", const_cast<void*>(static_cast<const void*>(&(TOP.GenericComponent__DOT__U_Inversor__DOT__N))), true, VLVT_UINT32,VLVD_NODIR|VLVF_PUB_RW,1 ,31,0);
        __Vscope_GenericComponent__U_Inversor.varInsert(__Vfinal,"entrada", &(TOP.GenericComponent__DOT__U_Inversor__DOT__entrada), false, VLVT_UINT8,VLVD_NODIR|VLVF_PUB_RW,1 ,3,0);
        __Vscope_GenericComponent__U_Inversor.varInsert(__Vfinal,"salida", &(TOP.GenericComponent__DOT__U_Inversor__DOT__salida), false, VLVT_UINT8,VLVD_NODIR|VLVF_PUB_RW,1 ,3,0);
        __Vscope_GenericComponent__unnamedblk1.varInsert(__Vfinal,"i", &(TOP.GenericComponent__DOT__unnamedblk1__DOT__i), false, VLVT_UINT32,VLVD_NODIR|VLVF_PUB_RW|VLVF_DPI_CLAY,1 ,31,0);
        __Vscope_GenericComponent__unnamedblk2.varInsert(__Vfinal,"i", &(TOP.GenericComponent__DOT__unnamedblk2__DOT__i), false, VLVT_UINT32,VLVD_NODIR|VLVF_PUB_RW|VLVF_DPI_CLAY,1 ,31,0);
        __Vscope_GenericComponent__unnamedblk3.varInsert(__Vfinal,"i", &(TOP.GenericComponent__DOT__unnamedblk3__DOT__i), false, VLVT_UINT32,VLVD_NODIR|VLVF_PUB_RW|VLVF_DPI_CLAY,1 ,31,0);
        __Vscope_TOP.varInsert(__Vfinal,"clk", &(TOP.clk), false, VLVT_UINT8,VLVD_IN|VLVF_PUB_RW,0);
        __Vscope_TOP.varInsert(__Vfinal,"din", &(TOP.din), false, VLVT_UINT8,VLVD_IN|VLVF_PUB_RW,1 ,3,0);
        __Vscope_TOP.varInsert(__Vfinal,"dout", &(TOP.dout), false, VLVT_UINT8,VLVD_OUT|VLVF_PUB_RW,1 ,3,0);
        __Vscope_TOP.varInsert(__Vfinal,"inversa", &(TOP.inversa), false, VLVT_UINT8,VLVD_OUT|VLVF_PUB_RW,1 ,3,0);
        __Vscope_TOP.varInsert(__Vfinal,"rst", &(TOP.rst), false, VLVT_UINT8,VLVD_IN|VLVF_PUB_RW,0);
    }
}
