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

## Structure

```
test-fly.mq5       Main EA entry point — OnInit/OnTick/OnDeinit
Include/            Supporting logic split into headers, #include'd from the main file
.vscode/            Editor/tooling configuration
.clang-format       Code formatting rules
```
