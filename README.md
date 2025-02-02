# Latin Text-to-Speech Docker Container

このプロジェクトは、テキストをラテン語の音声に変換するためのシンプルなDockerコンテナです。[eSpeak](http://espeak.sourceforge.net/)を使用して、入力されたテキストをWAVファイルとして出力します。

## 必要条件

このプロジェクトを実行するには以下が必要です：

- Docker
- マウント用のディレクトリ（出力ファイル保存用）

## 使用方法

1. イメージのビルド:
```bash
docker build -t latin-tts .
```

2. コンテナの実行:

Bash（Linux/macOS）での実行:
```bash
docker run -e TEXT="Lorem ipsum dolor sit amet" -v $(pwd)/mnt:/mnt latin-tts
```

PowerShellでの実行:
```powershell
# カレントディレクトリのパスを使用する場合
docker run -e TEXT="Lorem ipsum dolor sit amet" -v ${PWD}/mnt:/mnt latin-tts

# または絶対パスを使用する場合（より確実な方法）
docker run -e TEXT="Lorem ipsum dolor sit amet" -v C:\path\to\your\project\mnt:/mnt latin-tts
```

PowerShellでは、以下の点に注意が必要です：
- `$(pwd)` の代わりに `${PWD}` または絶対パスを使用します
- パスの区切り文字はバックスラッシュ（\）を使用しますが、Dockerのマウントポイント指定では引き続きスラッシュ（/）を使用します
- 絶対パスを使用する場合は、プロジェクトの実際のパスに置き換えてください

コマンドを実行すると、`mnt`ディレクトリ内に`caesar.wav`として音声ファイルが生成されます。

## 環境変数

- `TEXT`: 音声に変換したいテキスト（ラテン語）

## プロジェクト構造

```
.
├── Dockerfile      # Dockerイメージの定義ファイル
├── README.md       # このファイル
└── mnt/           # 出力ファイル用ディレクトリ
    └── caesar.wav  # 生成される音声ファイル
```

## 技術詳細

このプロジェクトは最新のAlpine Linuxをベースイメージとして使用し、セキュリティを考慮してOpenSSLを最新版にアップグレードしています。eSpeakをインストールし、デフォルトでラテン語の音声エンジンを使用するように設定されています。

音声の出力はWAVフォーマットで行われ、ホストマシンの`mnt`ディレクトリにマウントされたボリュームを通じて保存されます。

## セキュリティ注意事項

- コンテナは最小限の権限で実行されます
- パッケージは起動時に最新版にアップデートされます
- 出力ディレクトリのみがホストとマウントされます

## ライセンス

このプロジェクトはオープンソースソフトウェアとして提供されています。eSpeakは[GPL v3ライセンス](https://www.gnu.org/licenses/gpl-3.0.en.html)の下で提供されています。