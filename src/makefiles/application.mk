
RUN_WITH_VIRTUALENV = bash src/scripts/with-virtualenv.sh

.PHONY: setup-virtualenv
setup-virtualenv: # virtualenv をセットアップする.
	@$(RUN_WITH_VIRTUALENV)

.PHONY: run
run: # プログラムを実行する.
	@$(RUN_WITH_VIRTUALENV) python src/main/main.py

.PHONY: python
python: # Python をインタラクティブモードで実行する.
	@$(RUN_WITH_VIRTUALENV) python

