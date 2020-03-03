#!/bin/bash
set -eo pipefail
. s.sh
export LANG="pt_BR.UTF-8"
export DISPLAY=:1
export XAUTHORITY=/home/bank/.Xauthority

ps -ef |grep -v grep |grep -i warsaw 

firefox bb.com.br && sudo halt