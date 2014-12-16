# praatManipulationR

このレポジトリは R から praat を
操作するためのライブラリを管理しています．

このライブラリは開発途中です．

- Last Change: 17-Dec-2014.
- 文責: qh73xe

## コンセント

音声コーパスを作成，管理，分析する大変優秀なツールとして
praat というものがあります．一方，統計解析，可視化などでは R を使用する方が便利
な側面もあります．
praat は操作が独特な面もあり外部との連携が楽ではないため，この2つの連携を行うことが必要でした．

praatManipulationR が提供する機能は次の 3 点です．

- R から praat 自体 の操作を行う (sendpraat.cmd)
- R のデータを praat に渡す (sendpraat.data)
- praat のデータを R に渡す (getpraat.data)

