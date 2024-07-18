// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtop.h for the primary calling header

#include "Vtop__pch.h"
#include "Vtop___024root.h"

VL_INLINE_OPT void Vtop___024root___ico_sequent__TOP__0(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___ico_sequent__TOP__0\n"); );
    // Body
    vlSelf->GenericComponent__DOT__clk = vlSelf->clk;
    vlSelf->GenericComponent__DOT__rst = vlSelf->rst;
    vlSelf->dout = vlSelf->GenericComponent__DOT__dout;
    vlSelf->inversa = vlSelf->GenericComponent__DOT__inversa;
    vlSelf->GenericComponent__DOT__din = vlSelf->din;
    vlSelf->GenericComponent__DOT__temp_inversa = (0xfU 
                                                   & (~ (IData)(vlSelf->din)));
    vlSelf->GenericComponent__DOT__U_Inversor__DOT__entrada 
        = vlSelf->GenericComponent__DOT__din;
    vlSelf->GenericComponent__DOT__U_Inversor__DOT__salida 
        = vlSelf->GenericComponent__DOT__temp_inversa;
}

void Vtop___024root___eval_ico(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval_ico\n"); );
    // Body
    if ((1ULL & vlSelf->__VicoTriggered.word(0U))) {
        Vtop___024root___ico_sequent__TOP__0(vlSelf);
    }
}

void Vtop___024root___eval_triggers__ico(Vtop___024root* vlSelf);

bool Vtop___024root___eval_phase__ico(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval_phase__ico\n"); );
    // Init
    CData/*0:0*/ __VicoExecute;
    // Body
    Vtop___024root___eval_triggers__ico(vlSelf);
    __VicoExecute = vlSelf->__VicoTriggered.any();
    if (__VicoExecute) {
        Vtop___024root___eval_ico(vlSelf);
    }
    return (__VicoExecute);
}

void Vtop___024root___eval_act(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval_act\n"); );
}

VL_INLINE_OPT void Vtop___024root___nba_sequent__TOP__0(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___nba_sequent__TOP__0\n"); );
    // Init
    IData/*31:0*/ __Vdly__GenericComponent__DOT__counter;
    __Vdly__GenericComponent__DOT__counter = 0;
    CData/*1:0*/ __Vdly__GenericComponent__DOT__state;
    __Vdly__GenericComponent__DOT__state = 0;
    CData/*0:0*/ __Vdlyvset__GenericComponent__DOT__array_signal__v0;
    __Vdlyvset__GenericComponent__DOT__array_signal__v0 = 0;
    CData/*3:0*/ __Vdlyvval__GenericComponent__DOT__array_signal__v4;
    __Vdlyvval__GenericComponent__DOT__array_signal__v4 = 0;
    CData/*0:0*/ __Vdlyvset__GenericComponent__DOT__array_signal__v4;
    __Vdlyvset__GenericComponent__DOT__array_signal__v4 = 0;
    CData/*3:0*/ __Vdlyvval__GenericComponent__DOT__array_signal__v5;
    __Vdlyvval__GenericComponent__DOT__array_signal__v5 = 0;
    CData/*0:0*/ __Vdlyvset__GenericComponent__DOT__array_signal__v5;
    __Vdlyvset__GenericComponent__DOT__array_signal__v5 = 0;
    CData/*3:0*/ __Vdlyvval__GenericComponent__DOT__array_signal__v6;
    __Vdlyvval__GenericComponent__DOT__array_signal__v6 = 0;
    CData/*0:0*/ __Vdlyvset__GenericComponent__DOT__array_signal__v6;
    __Vdlyvset__GenericComponent__DOT__array_signal__v6 = 0;
    CData/*3:0*/ __Vdlyvval__GenericComponent__DOT__array_signal__v7;
    __Vdlyvval__GenericComponent__DOT__array_signal__v7 = 0;
    CData/*0:0*/ __Vdlyvset__GenericComponent__DOT__array_signal__v7;
    __Vdlyvset__GenericComponent__DOT__array_signal__v7 = 0;
    CData/*3:0*/ __Vdlyvval__GenericComponent__DOT__array_signal__v8;
    __Vdlyvval__GenericComponent__DOT__array_signal__v8 = 0;
    CData/*0:0*/ __Vdlyvset__GenericComponent__DOT__array_signal__v8;
    __Vdlyvset__GenericComponent__DOT__array_signal__v8 = 0;
    CData/*3:0*/ __Vdlyvval__GenericComponent__DOT__array_signal__v9;
    __Vdlyvval__GenericComponent__DOT__array_signal__v9 = 0;
    CData/*0:0*/ __Vdlyvset__GenericComponent__DOT__array_signal__v9;
    __Vdlyvset__GenericComponent__DOT__array_signal__v9 = 0;
    CData/*3:0*/ __Vdlyvval__GenericComponent__DOT__array_signal__v10;
    __Vdlyvval__GenericComponent__DOT__array_signal__v10 = 0;
    CData/*0:0*/ __Vdlyvset__GenericComponent__DOT__array_signal__v10;
    __Vdlyvset__GenericComponent__DOT__array_signal__v10 = 0;
    CData/*3:0*/ __Vdlyvval__GenericComponent__DOT__array_signal__v11;
    __Vdlyvval__GenericComponent__DOT__array_signal__v11 = 0;
    CData/*0:0*/ __Vdlyvset__GenericComponent__DOT__array_signal__v11;
    __Vdlyvset__GenericComponent__DOT__array_signal__v11 = 0;
    // Body
    __Vdly__GenericComponent__DOT__state = vlSelf->GenericComponent__DOT__state;
    __Vdly__GenericComponent__DOT__counter = vlSelf->GenericComponent__DOT__counter;
    __Vdlyvset__GenericComponent__DOT__array_signal__v0 = 0U;
    __Vdlyvset__GenericComponent__DOT__array_signal__v4 = 0U;
    __Vdlyvset__GenericComponent__DOT__array_signal__v5 = 0U;
    __Vdlyvset__GenericComponent__DOT__array_signal__v6 = 0U;
    __Vdlyvset__GenericComponent__DOT__array_signal__v7 = 0U;
    __Vdlyvset__GenericComponent__DOT__array_signal__v8 = 0U;
    __Vdlyvset__GenericComponent__DOT__array_signal__v9 = 0U;
    __Vdlyvset__GenericComponent__DOT__array_signal__v10 = 0U;
    __Vdlyvset__GenericComponent__DOT__array_signal__v11 = 0U;
    if (vlSelf->rst) {
        vlSelf->GenericComponent__DOT__unnamedblk1__DOT__i = 1U;
        vlSelf->GenericComponent__DOT__unnamedblk1__DOT__i = 2U;
        vlSelf->GenericComponent__DOT__unnamedblk1__DOT__i = 3U;
        vlSelf->GenericComponent__DOT__unnamedblk1__DOT__i = 4U;
        vlSelf->GenericComponent__DOT__dout = 0U;
        vlSelf->GenericComponent__DOT__inversa = 0U;
        __Vdly__GenericComponent__DOT__counter = 0U;
        __Vdly__GenericComponent__DOT__state = 0U;
        __Vdlyvset__GenericComponent__DOT__array_signal__v0 = 1U;
        vlSelf->GenericComponent__DOT__enable = 0U;
    } else if ((0U == (IData)(vlSelf->GenericComponent__DOT__state))) {
        if (vlSelf->GenericComponent__DOT__enable) {
            __Vdly__GenericComponent__DOT__state = 1U;
        }
    } else if ((1U == (IData)(vlSelf->GenericComponent__DOT__state))) {
        vlSelf->GenericComponent__DOT__temp_var = vlSelf->din;
        __Vdly__GenericComponent__DOT__counter = ((IData)(1U) 
                                                  + vlSelf->GenericComponent__DOT__counter);
        vlSelf->GenericComponent__DOT__unnamedblk2__DOT__i = 1U;
        __Vdlyvval__GenericComponent__DOT__array_signal__v4 
            = (1U & (IData)(vlSelf->GenericComponent__DOT__temp_var));
        __Vdlyvset__GenericComponent__DOT__array_signal__v4 = 1U;
        vlSelf->GenericComponent__DOT__unnamedblk2__DOT__i = 2U;
        vlSelf->GenericComponent__DOT__inversa = vlSelf->GenericComponent__DOT__temp_inversa;
        if ((9U == vlSelf->GenericComponent__DOT__counter)) {
            __Vdly__GenericComponent__DOT__state = 2U;
        }
        __Vdlyvval__GenericComponent__DOT__array_signal__v5 
            = (1U & ((IData)(vlSelf->GenericComponent__DOT__temp_var) 
                     >> 1U));
        __Vdlyvset__GenericComponent__DOT__array_signal__v5 = 1U;
        vlSelf->GenericComponent__DOT__unnamedblk2__DOT__i = 3U;
        __Vdlyvval__GenericComponent__DOT__array_signal__v6 
            = (1U & ((IData)(vlSelf->GenericComponent__DOT__temp_var) 
                     >> 2U));
        __Vdlyvset__GenericComponent__DOT__array_signal__v6 = 1U;
        vlSelf->GenericComponent__DOT__unnamedblk2__DOT__i = 4U;
        __Vdlyvval__GenericComponent__DOT__array_signal__v7 
            = (1U & ((IData)(vlSelf->GenericComponent__DOT__temp_var) 
                     >> 3U));
        __Vdlyvset__GenericComponent__DOT__array_signal__v7 = 1U;
        vlSelf->GenericComponent__DOT__dout = vlSelf->GenericComponent__DOT__temp_var;
    } else if ((2U == (IData)(vlSelf->GenericComponent__DOT__state))) {
        vlSelf->GenericComponent__DOT__unnamedblk3__DOT__i = 1U;
        vlSelf->GenericComponent__DOT__dout = vlSelf->GenericComponent__DOT__array_constant;
        __Vdlyvval__GenericComponent__DOT__array_signal__v8 
            = (1U & (IData)(vlSelf->GenericComponent__DOT__array_constant));
        __Vdlyvset__GenericComponent__DOT__array_signal__v8 = 1U;
        vlSelf->GenericComponent__DOT__unnamedblk3__DOT__i = 2U;
        vlSelf->GenericComponent__DOT__inversa = vlSelf->GenericComponent__DOT__temp_inversa;
        __Vdlyvval__GenericComponent__DOT__array_signal__v9 
            = (1U & ((IData)(vlSelf->GenericComponent__DOT__array_constant) 
                     >> 1U));
        __Vdlyvset__GenericComponent__DOT__array_signal__v9 = 1U;
        vlSelf->GenericComponent__DOT__unnamedblk3__DOT__i = 3U;
        __Vdlyvval__GenericComponent__DOT__array_signal__v10 
            = (1U & ((IData)(vlSelf->GenericComponent__DOT__array_constant) 
                     >> 2U));
        __Vdlyvset__GenericComponent__DOT__array_signal__v10 = 1U;
        vlSelf->GenericComponent__DOT__unnamedblk3__DOT__i = 4U;
        __Vdlyvval__GenericComponent__DOT__array_signal__v11 
            = (1U & ((IData)(vlSelf->GenericComponent__DOT__array_constant) 
                     >> 3U));
        __Vdlyvset__GenericComponent__DOT__array_signal__v11 = 1U;
    }
    vlSelf->GenericComponent__DOT__counter = __Vdly__GenericComponent__DOT__counter;
    vlSelf->GenericComponent__DOT__state = __Vdly__GenericComponent__DOT__state;
    if (__Vdlyvset__GenericComponent__DOT__array_signal__v0) {
        vlSelf->GenericComponent__DOT__array_signal[0U] = 0U;
        vlSelf->GenericComponent__DOT__array_signal[1U] = 0U;
        vlSelf->GenericComponent__DOT__array_signal[2U] = 0U;
        vlSelf->GenericComponent__DOT__array_signal[3U] = 0U;
    }
    if (__Vdlyvset__GenericComponent__DOT__array_signal__v4) {
        vlSelf->GenericComponent__DOT__array_signal[0U] 
            = __Vdlyvval__GenericComponent__DOT__array_signal__v4;
    }
    if (__Vdlyvset__GenericComponent__DOT__array_signal__v5) {
        vlSelf->GenericComponent__DOT__array_signal[1U] 
            = __Vdlyvval__GenericComponent__DOT__array_signal__v5;
    }
    if (__Vdlyvset__GenericComponent__DOT__array_signal__v6) {
        vlSelf->GenericComponent__DOT__array_signal[2U] 
            = __Vdlyvval__GenericComponent__DOT__array_signal__v6;
    }
    if (__Vdlyvset__GenericComponent__DOT__array_signal__v7) {
        vlSelf->GenericComponent__DOT__array_signal[3U] 
            = __Vdlyvval__GenericComponent__DOT__array_signal__v7;
    }
    if (__Vdlyvset__GenericComponent__DOT__array_signal__v8) {
        vlSelf->GenericComponent__DOT__array_signal[0U] 
            = __Vdlyvval__GenericComponent__DOT__array_signal__v8;
    }
    if (__Vdlyvset__GenericComponent__DOT__array_signal__v9) {
        vlSelf->GenericComponent__DOT__array_signal[1U] 
            = __Vdlyvval__GenericComponent__DOT__array_signal__v9;
    }
    if (__Vdlyvset__GenericComponent__DOT__array_signal__v10) {
        vlSelf->GenericComponent__DOT__array_signal[2U] 
            = __Vdlyvval__GenericComponent__DOT__array_signal__v10;
    }
    if (__Vdlyvset__GenericComponent__DOT__array_signal__v11) {
        vlSelf->GenericComponent__DOT__array_signal[3U] 
            = __Vdlyvval__GenericComponent__DOT__array_signal__v11;
    }
    vlSelf->dout = vlSelf->GenericComponent__DOT__dout;
    vlSelf->inversa = vlSelf->GenericComponent__DOT__inversa;
}

void Vtop___024root___eval_nba(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval_nba\n"); );
    // Body
    if ((1ULL & vlSelf->__VnbaTriggered.word(0U))) {
        Vtop___024root___nba_sequent__TOP__0(vlSelf);
    }
}

void Vtop___024root___eval_triggers__act(Vtop___024root* vlSelf);

bool Vtop___024root___eval_phase__act(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval_phase__act\n"); );
    // Init
    VlTriggerVec<1> __VpreTriggered;
    CData/*0:0*/ __VactExecute;
    // Body
    Vtop___024root___eval_triggers__act(vlSelf);
    __VactExecute = vlSelf->__VactTriggered.any();
    if (__VactExecute) {
        __VpreTriggered.andNot(vlSelf->__VactTriggered, vlSelf->__VnbaTriggered);
        vlSelf->__VnbaTriggered.thisOr(vlSelf->__VactTriggered);
        Vtop___024root___eval_act(vlSelf);
    }
    return (__VactExecute);
}

bool Vtop___024root___eval_phase__nba(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval_phase__nba\n"); );
    // Init
    CData/*0:0*/ __VnbaExecute;
    // Body
    __VnbaExecute = vlSelf->__VnbaTriggered.any();
    if (__VnbaExecute) {
        Vtop___024root___eval_nba(vlSelf);
        vlSelf->__VnbaTriggered.clear();
    }
    return (__VnbaExecute);
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vtop___024root___dump_triggers__ico(Vtop___024root* vlSelf);
#endif  // VL_DEBUG
#ifdef VL_DEBUG
VL_ATTR_COLD void Vtop___024root___dump_triggers__nba(Vtop___024root* vlSelf);
#endif  // VL_DEBUG
#ifdef VL_DEBUG
VL_ATTR_COLD void Vtop___024root___dump_triggers__act(Vtop___024root* vlSelf);
#endif  // VL_DEBUG

void Vtop___024root___eval(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval\n"); );
    // Init
    IData/*31:0*/ __VicoIterCount;
    CData/*0:0*/ __VicoContinue;
    IData/*31:0*/ __VnbaIterCount;
    CData/*0:0*/ __VnbaContinue;
    // Body
    __VicoIterCount = 0U;
    vlSelf->__VicoFirstIteration = 1U;
    __VicoContinue = 1U;
    while (__VicoContinue) {
        if (VL_UNLIKELY((0x64U < __VicoIterCount))) {
#ifdef VL_DEBUG
            Vtop___024root___dump_triggers__ico(vlSelf);
#endif
            VL_FATAL_MT("/home/emnalo/Test/ForceDepositReleaseTEST/Verilator/GenericComponent.v", 1, "", "Input combinational region did not converge.");
        }
        __VicoIterCount = ((IData)(1U) + __VicoIterCount);
        __VicoContinue = 0U;
        if (Vtop___024root___eval_phase__ico(vlSelf)) {
            __VicoContinue = 1U;
        }
        vlSelf->__VicoFirstIteration = 0U;
    }
    __VnbaIterCount = 0U;
    __VnbaContinue = 1U;
    while (__VnbaContinue) {
        if (VL_UNLIKELY((0x64U < __VnbaIterCount))) {
#ifdef VL_DEBUG
            Vtop___024root___dump_triggers__nba(vlSelf);
#endif
            VL_FATAL_MT("/home/emnalo/Test/ForceDepositReleaseTEST/Verilator/GenericComponent.v", 1, "", "NBA region did not converge.");
        }
        __VnbaIterCount = ((IData)(1U) + __VnbaIterCount);
        __VnbaContinue = 0U;
        vlSelf->__VactIterCount = 0U;
        vlSelf->__VactContinue = 1U;
        while (vlSelf->__VactContinue) {
            if (VL_UNLIKELY((0x64U < vlSelf->__VactIterCount))) {
#ifdef VL_DEBUG
                Vtop___024root___dump_triggers__act(vlSelf);
#endif
                VL_FATAL_MT("/home/emnalo/Test/ForceDepositReleaseTEST/Verilator/GenericComponent.v", 1, "", "Active region did not converge.");
            }
            vlSelf->__VactIterCount = ((IData)(1U) 
                                       + vlSelf->__VactIterCount);
            vlSelf->__VactContinue = 0U;
            if (Vtop___024root___eval_phase__act(vlSelf)) {
                vlSelf->__VactContinue = 1U;
            }
        }
        if (Vtop___024root___eval_phase__nba(vlSelf)) {
            __VnbaContinue = 1U;
        }
    }
}

#ifdef VL_DEBUG
void Vtop___024root___eval_debug_assertions(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((vlSelf->clk & 0xfeU))) {
        Verilated::overWidthError("clk");}
    if (VL_UNLIKELY((vlSelf->rst & 0xfeU))) {
        Verilated::overWidthError("rst");}
    if (VL_UNLIKELY((vlSelf->din & 0xf0U))) {
        Verilated::overWidthError("din");}
}
#endif  // VL_DEBUG
