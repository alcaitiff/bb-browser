#!/bin/bash
set -eo pipefail

export LANG="pt_BR.UTF-8"
export DISPLAY=:1
export XAUTHORITY=/home/bank/.Xauthority
firefox bb.com.br && sudo halt