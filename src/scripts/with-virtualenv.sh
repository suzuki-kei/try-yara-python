#!/bin/bash
#
# virtualenv を有効化した状態でコマンドを実行する.
#
#     1. virtualenv が初期化されていない場合は,
#        virtualenv を初期化した上で pip install する.
#
#     2. virtualenv を有効化した上で,
#        引数で指定されたコマンドを実行する.
#
# 使用例:
#
#     # virtualenv の初期化だけ行う.
#     with-virtualenv.sh
#
#     # virtualenv を有効化した状態で main.py を実行する.
#     with-virtualenv.sh python main.py
#

set -eu

# プロジェクトのルートディレクトリ.
readonly ROOT_DIR="$(cd "$(dirname "$0")/../.." && pwd)"

# virtualenv のディレクトリ.
readonly VIRTUALENV_DIR="${ROOT_DIR}/virtualenv"

if [[ ! -d "${VIRTUALENV_DIR}" ]]; then
    virtualenv --python=python3 "${VIRTUALENV_DIR}"
    source "${VIRTUALENV_DIR}/bin/activate"
    pip install -r "${ROOT_DIR}/requirements.txt"
else
    source "${VIRTUALENV_DIR}/bin/activate"
fi

# 引数で渡されたコマンドを実行する.
$*

