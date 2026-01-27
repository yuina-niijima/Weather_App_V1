# Weather App V1

新しいFlutterアプリケーション

## 概要

Weather App V1は、Flutterで開発されたクロスプラットフォーム対応のモバイルアプリケーションです。

## 対応プラットフォーム

- 🤖 Android
- 🍎 iOS


## 必要な環境

- Dart SDK: ^3.10.3
- Flutter SDK: 3.38.7-stable

## asdfについて

このプロジェクトでは、**asdf** を使用してツールバージョンを管理しています。

### asdfのセットアップ

asdfがまだインストールされていない場合は、以下のコマンドでインストールしてください：

```bash
brew install asdf
```

詳細は [asdf 公式ドキュメント](https://asdf-vm.com/) を参照してください。

### バージョンの確認と設定

`.tool-versions` ファイルに指定されているバージョンを使用します：

```
flutter 3.38.7-stable
```

プロジェクトディレクトリで以下のコマンドを実行すると、指定されたバージョンが自動的に使用されます：

```bash
# asdfプラグインの追加（初回のみ）
asdf plugin add flutter

# .tool-versionsで指定されたバージョンをインストール
asdf install
```

## セットアップ

### 1. 依存関係のインストール

```bash
flutter pub get
```

### 2. アプリの実行

```bash
# デバッグモードで実行
flutter run

# 特定のプラットフォームで実行
flutter run -d android   # Android
flutter run -d ios       # iOS
flutter run -d macos     # macOS
flutter run -d windows   # Windows
flutter run -d linux     # Linux
flutter run -d web       # Web
```

## プロジェクト構成

```
.
├── android/          # Android固有のコード
├── ios/              # iOS固有のコード
├── lib/              # Dartコード（メインアプリケーション）
├── macos/            # macOS固有のコード
├── windows/          # Windows固有のコード
├── linux/            # Linux固有のコード
├── web/              # Web固有のコード
├── test/             # テストファイル
└── pubspec.yaml      # Flutterプロジェクト設定
```

## 依存関係

- **flutter**: Flutter SDK
- **cupertino_icons**: iOS スタイルのアイコン

### 開発用依存関係

- **flutter_test**: Flutter テストフレームワーク
- **flutter_lints**: Dartコード分析とリント

## ビルド

### デバッグビルド

```bash
flutter build <platform>
```

### リリースビルド

```bash
flutter build <platform> --release
```

## テスト

```bash
flutter test
```

## ライセンス

このプロジェクトはプライベートパッケージとして管理されています。

## サポート

問題が発生した場合は、プロジェクトのメンテナーにお問い合わせください。
