# test-fly

MQL5 Expert Advisor project, developed in VS Code and compiled via MetaEditor.

## Setup

This project folder is junctioned into the MetaTrader data folder so MetaEditor can
find and compile it:

```powershell
mklink /J "<MetaTrader Data Folder>\MQL5\Experts\Advisors\test-fly" "D:\trade\projects\test-fly"
```

Find your MetaTrader data folder via **File → Open Data Folder** inside the terminal.

## Development workflow

- Open this folder directly in VS Code (`D:\trade\projects\test-fly`)
- Formatting runs automatically on save (clang-format, style defined in `.clang-format`)
- Saving a `.mq5` file automatically triggers the **Compile MQL5** task, which runs
  MetaEditor's compiler and prints any errors/warnings in the terminal
- Commits/pushes are done through GitHub Desktop

## Structure

```
test-fly.mq5                   Main EA entry point — OnInit/OnTick/OnDeinit only.
                                Stays thin; wires the modules below together.

Include/
  Inputs.mqh                   All input parameters and enums.
  Globals.mqh                  Shared state (Trade handle, lot limits).
  RiskManagement.mqh           Position sizing logic (LotSize).
  TradeExecution.mqh           Wraps CTrade calls (OpenBuy, OpenSell, CloseAllPositions).
  SignalLogic.mqh              Strategy entry/exit conditions — edit this most.
  ChartVisuals.mqh             Cosmetic chart setup only, no trading effect.
  Utils.mqh                    Small reusable helpers (Log, etc).

.vscode/                       Editor/tooling configuration.
.clang-format                  Code formatting rules.
```

## Adding a new module

1. Create `Include/YourModule.mqh`, wrapped in an include guard:
   ```cpp
   #ifndef __YOURMODULE_MQH__
   #define __YOURMODULE_MQH__
   // ...
   #endif // __YOURMODULE_MQH__
   ```
2. Add `#include "Include\YourModule.mqh"` to `test-fly.mq5`, after any modules it
   depends on (MQL5 pastes includes in order, so a module using `Trade` or inputs
   must be included after `Globals.mqh` / `Inputs.mqh`).
3. Save — formatting and compilation run automatically.
