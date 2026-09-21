#ifndef __INPUTS_MQH__
#define __INPUTS_MQH__

enum EnumRisk {
  UseFixedLot,
  UseBalanceLot
};

input group "GENERAL PARAMETERS";
input int EAMagic = 122232;
input string MySymbol = "EURUSD";
input ENUM_TIMEFRAMES MyTimeFrave = PERIOD_M1;
input int MaxSlippage = 1;

input group "RISK INPUTS";
input EnumRisk LotUsed = UseFixedLot;
input double BalanceIncrease = 1000;
input double VolumeIncrease = 0.1;
input double FixedLot = 0.1;

#endif // __INPUTS_MQH__
