#property copyright "Copyright 2026, MetaQuotes Ltd."
#property link "https://www.mql5.com"
#property version "1.00"

#include <Trade\Trade.mqh>

#include "Include/Inputs.mqh"
#include "Include/Globals.mqh"
#include "Include/Utils.mqh"
#include "Include/ChartVisuals.mqh"
#include "Include/RiskManagement.mqh"
#include "Include/TradeExecution.mqh"
#include "Include/SignalLogic.mqh"

int OnInit() {
  SetTemplateView();

  Trade = new CTrade;
  Trade.SetExpertMagicNumber(EAMagic);
  Trade.SetDeviationInPoints(MaxSlippage * 10);

  LotMax  = SymbolInfoDouble(MySymbol, SYMBOL_VOLUME_MAX);
  LotMin  = SymbolInfoDouble(MySymbol, SYMBOL_VOLUME_MIN);
  LotStep = SymbolInfoDouble(MySymbol, SYMBOL_VOLUME_STEP);

  Log("Initialized");

  return (INIT_SUCCEEDED);
}

void OnDeinit(const int reason) {
  delete Trade;
}

void OnTick() {
  if (CheckEntrySignal()) {
    OpenBuy();
  }

  if (CheckExitSignal()) {
    CloseAllPositions();
  }
}
