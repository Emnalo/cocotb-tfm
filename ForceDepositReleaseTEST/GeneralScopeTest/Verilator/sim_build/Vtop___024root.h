// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vtop.h for the primary calling header

#ifndef VERILATED_VTOP___024ROOT_H_
#define VERILATED_VTOP___024ROOT_H_  // guard

#include "verilated.h"


class Vtop__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vtop___024root final : public VerilatedModule {
  public:

    // DESIGN SPECIFIC STATE
    VL_IN8(clk,0,0);
    VL_IN8(rst,0,0);
    VL_IN8(din,3,0);
    VL_OUT8(dout,3,0);
    VL_OUT8(inversa,3,0);
    CData/*0:0*/ GenericComponent__DOT__clk;
    CData/*0:0*/ GenericComponent__DOT__rst;
    CData/*3:0*/ GenericComponent__DOT__din;
    CData/*3:0*/ GenericComponent__DOT__dout;
    CData/*3:0*/ GenericComponent__DOT__inversa;
    CData/*1:0*/ GenericComponent__DOT__state;
    CData/*3:0*/ GenericComponent__DOT__array_constant;
    CData/*0:0*/ GenericComponent__DOT__enable;
    CData/*3:0*/ GenericComponent__DOT__temp_var;
    CData/*3:0*/ GenericComponent__DOT__temp_inversa;
    CData/*3:0*/ GenericComponent__DOT__U_Inversor__DOT__entrada;
    CData/*3:0*/ GenericComponent__DOT__U_Inversor__DOT__salida;
    CData/*0:0*/ __VstlFirstIteration;
    CData/*0:0*/ __VicoFirstIteration;
    CData/*0:0*/ __Vtrigprevexpr___TOP__clk__0;
    CData/*0:0*/ __Vtrigprevexpr___TOP__rst__0;
    CData/*0:0*/ __VactContinue;
    IData/*31:0*/ GenericComponent__DOT__counter;
    IData/*31:0*/ GenericComponent__DOT__unnamedblk1__DOT__i;
    IData/*31:0*/ GenericComponent__DOT__unnamedblk2__DOT__i;
    IData/*31:0*/ GenericComponent__DOT__unnamedblk3__DOT__i;
    IData/*31:0*/ __VactIterCount;
    VlUnpacked<CData/*3:0*/, 4> GenericComponent__DOT__array_signal;
    VlTriggerVec<1> __VstlTriggered;
    VlTriggerVec<1> __VicoTriggered;
    VlTriggerVec<1> __VactTriggered;
    VlTriggerVec<1> __VnbaTriggered;

    // INTERNAL VARIABLES
    Vtop__Syms* const vlSymsp;

    // PARAMETERS
    static constexpr CData/*1:0*/ GenericComponent__DOT__IDLE = 0U;
    static constexpr CData/*1:0*/ GenericComponent__DOT__WORKING = 1U;
    static constexpr CData/*1:0*/ GenericComponent__DOT__DONE = 2U;
    static constexpr IData/*31:0*/ GenericComponent__DOT__N = 4U;
    static constexpr IData/*31:0*/ GenericComponent__DOT__U_Inversor__DOT__N = 4U;

    // CONSTRUCTORS
    Vtop___024root(Vtop__Syms* symsp, const char* v__name);
    ~Vtop___024root();
    VL_UNCOPYABLE(Vtop___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
