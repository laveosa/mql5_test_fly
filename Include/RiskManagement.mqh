#ifndef __RISKMANAGEMENT_MQH__
#define __RISKMANAGEMENT_MQH__

double LotSize() {
  double Lot;

  if (LotUsed == UseFixedLot) {
    Lot = FixedLot;
  } else {
    double result = VolumeIncrease * AccountInfoDouble(ACCOUNT_BALANCE) / BalanceIncrease;
    Lot           = NormalizeDouble(result, 2);
    Lot           = MathRound(Lot / LotStep) * LotStep;

    if (Lot > LotMax) {
      Lot = LotMax;
    }

    if (Lot < LotMin) {
      Lot = LotMin;
    }
  }

  return Lot;
}

#endif // __RISKMANAGEMENT_MQH__