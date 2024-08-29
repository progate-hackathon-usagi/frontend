# frontend

## 開発環境を作成する

1. リポジトリをクローンします
2. `.env.example` を複製し、名前を `dev.env` にする
3. 各環境変数を入力する

- supabase 関連：supabase 上のプロジェクトから確認してください
- `GOOGLE_OAUTH_WEB_CLIENT_ID`：[ここ](https://discord.com/channels/@me/1276404329326182481/1278368211749965957) から「web」のクライアントIDをコピぺしてください

## 起動する

VSCode を使用している場合、F5 / "実行とデバッグ"内 から起動することをオススメします
（`.vscode/launch.json` にデバッグ用の起動時コマンドを定義しているので）

コマンドから呼び出す場合は以下

```
flutter run --dart-define-from-file=dev.env
```
