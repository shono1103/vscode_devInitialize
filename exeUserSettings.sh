#!/bin/bash

# コピー元ファイルのパス（このスクリプトと同じディレクトリにあることを想定）
SOURCE_FILE="./settings.json"

# コピー先ファイルのパス
DEST_FILE="$HOME/.config/Code/User/settings.json"

# コピー元ファイルが存在するか確認
if [ ! -f "$SOURCE_FILE" ]; then
    echo "エラー: コピー元ファイル '$SOURCE_FILE' が見つかりません。"
    exit 1
fi

# ユーザーに確認を求める
read -p "Warning: This will overwrite '$DEST_FILE'. Are you sure you want to continue? (y/N): " -n 1 -r
echo

if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo "操作はキャンセルされました。"
    exit 0
fi

# ファイルを上書きコピー（sudo を使用して管理者権限で実行）
echo "設定ファイル '$SOURCE_FILE' を '$DEST_FILE' に上書きコピーします..."
cp "$SOURCE_FILE" "$DEST_FILE"

# コピーが成功したか確認
if [ $? -eq 0 ]; then
    echo "設定ファイルは正常に上書きされました。"
else
    echo "エラー: ファイルのコピーに失敗しました。"
    exit 1
fi

exit 0