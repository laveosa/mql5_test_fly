#ifndef __CHART_VISUALS__
#define __CHART_VISUALS__

void SetTemplateView() {
  ChartSetInteger(0, CHART_MODE, CHART_CANDLES);
  ChartSetInteger(0, CHART_COLOR_BACKGROUND, clrDarkSlateGray);
  ChartSetInteger(0, CHART_COLOR_FOREGROUND, clrWhite);
  ChartSetInteger(0, CHART_COLOR_CANDLE_BULL, clrDarkSeaGreen);
  ChartSetInteger(0, CHART_COLOR_CHART_UP, clrDarkSeaGreen);
  ChartSetInteger(0, CHART_COLOR_CANDLE_BEAR, clrSalmon);
  ChartSetInteger(0, CHART_COLOR_CHART_DOWN, clrSalmon);
}

#endif // __CHART_VISUALS__