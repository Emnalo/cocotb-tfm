// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "Vtop__Syms.h"


void Vtop___024root__trace_chg_0_sub_0(Vtop___024root* vlSelf, VerilatedVcd::Buffer* bufp);

void Vtop___024root__trace_chg_0(void* voidSelf, VerilatedVcd::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root__trace_chg_0\n"); );
    // Init
    Vtop___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vtop___024root*>(voidSelf);
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (VL_UNLIKELY(!vlSymsp->__Vm_activity)) return;
    // Body
    Vtop___024root__trace_chg_0_sub_0((&vlSymsp->TOP), bufp);
}

void Vtop___024root__trace_chg_0_sub_0(Vtop___024root* vlSelf, VerilatedVcd::Buffer* bufp) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root__trace_chg_0_sub_0\n"); );
    // Init
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode + 1);
    // Body
    bufp->chgBit(oldp+0,(vlSelf->clk));
    bufp->chgBit(oldp+1,(vlSelf->rst));
    bufp->chgCData(oldp+2,(vlSelf->din),4);
    bufp->chgCData(oldp+3,(vlSelf->dout),4);
    bufp->chgBit(oldp+4,(vlSelf->GenericComponent__DOT__clk));
    bufp->chgBit(oldp+5,(vlSelf->GenericComponent__DOT__rst));
    bufp->chgCData(oldp+6,(vlSelf->GenericComponent__DOT__din),4);
    bufp->chgCData(oldp+7,(vlSelf->GenericComponent__DOT__dout),4);
    bufp->chgCData(oldp+8,(vlSelf->GenericComponent__DOT__state),2);
    bufp->chgCData(oldp+9,(vlSelf->GenericComponent__DOT__array_signal[0]),4);
    bufp->chgCData(oldp+10,(vlSelf->GenericComponent__DOT__array_signal[1]),4);
    bufp->chgCData(oldp+11,(vlSelf->GenericComponent__DOT__array_signal[2]),4);
    bufp->chgCData(oldp+12,(vlSelf->GenericComponent__DOT__array_signal[3]),4);
    bufp->chgCData(oldp+13,(vlSelf->GenericComponent__DOT__array_constant),4);
    bufp->chgIData(oldp+14,(vlSelf->GenericComponent__DOT__counter),32);
    bufp->chgBit(oldp+15,(vlSelf->GenericComponent__DOT__enable));
    bufp->chgCData(oldp+16,(vlSelf->GenericComponent__DOT__unnamedblk1__DOT__temp_var),4);
    bufp->chgIData(oldp+17,(vlSelf->GenericComponent__DOT__unnamedblk1__DOT__unnamedblk2__DOT__i),32);
    bufp->chgIData(oldp+18,(vlSelf->GenericComponent__DOT__unnamedblk1__DOT__unnamedblk3__DOT__i),32);
    bufp->chgIData(oldp+19,(vlSelf->GenericComponent__DOT__unnamedblk1__DOT__unnamedblk4__DOT__i),32);
}

void Vtop___024root__trace_cleanup(void* voidSelf, VerilatedVcd* /*unused*/) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root__trace_cleanup\n"); );
    // Init
    Vtop___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vtop___024root*>(voidSelf);
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VlUnpacked<CData/*0:0*/, 1> __Vm_traceActivity;
    for (int __Vi0 = 0; __Vi0 < 1; ++__Vi0) {
        __Vm_traceActivity[__Vi0] = 0;
    }
    // Body
    vlSymsp->__Vm_activity = false;
    __Vm_traceActivity[0U] = 0U;
}
