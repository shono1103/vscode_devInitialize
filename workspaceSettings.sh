#!/bin/bash

case "$1" in
    "c"|"cpp") # ここを修正: パイプ記号 "|" でOR条件を指定
        cp -r "$VSCODE_CPP_SETTINGS" "$PWD"
        ;;
    *) # 上記のどのパターンにもマッチしない場合（デフォルト）
        echo "エラー: 引数を指定してください。"
        exit 1 # エラーの場合はスクリプトを終了する
        ;;
esac