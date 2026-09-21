#ifndef __CHARTVISUALS_MQH__
#define __CHARTVISUALS_MQH__

void SetTemplateView() {
  ChartSetInteger(0, CHART_MODE, CHART_CANDLES);
  ChartSetInteger(0, CHART_COLOR_BACKGROUND, clrDarkSlateGray);
  ChartSetInteger(0, CHART_COLOR_FOREGROUND, clrWhite);
  ChartSetInteger(0, CHART_COLOR_CANDLE_BULL, clrDarkSeaGreen);
  ChartSetInteger(0, CHART_COLOR_CHART_UP, clrDarkSeaGreen);
  ChartSetInteger(0, CHART_COLOR_CANDLE_BEAR, clrSalmon);
  ChartSetInteger(0, CHART_COLOR_CHART_DOWN, clrSalmon);
}

#endif // __CHARTVISUALS_MQH__