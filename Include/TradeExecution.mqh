#ifndef __TRADEEXECUTION_MQH__
#define __TRADEEXECUTION_MQH__

bool OpenBuy() {
  double lot = LotSize();
  return Trade.Buy(lot, MySymbol);
}

bool OpenSell() {
  double lot = LotSize();
  return Trade.Sell(lot, MySymbol);
}

void CloseAllPositions() {
  for (int i = PositionsTotal() - 1; i >= 0; i--) {
    ulong ticket = PositionGetTicket(i);
    if (PositionSelectByTicket(ticket)) {
      if (PositionGetInteger(POSITION_MAGIC) == EAMagic) {
        Trade.PositionClose(ticket);
      }
    }
  }
}

#endif // __TRADEEXECUTION_MQH__