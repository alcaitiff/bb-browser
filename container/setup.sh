#!/bin/bash
#set -eo pipefail

export LANG="pt_BR.UTF-8"

export HOST_HOSTNAME=#HOSTNAME#
export DISPLAY=unix#DISPLAY#
export XAUTHORITY=/home/bank/.Xauthority
export PATH=/home/bank/.local/bin/:$PATH

get_xauth_host() {
  if [ -n "${XAUTHORITY}" ] && [ -n "${HOST_HOSTNAME}" ]
  then
    if [ "${HOSTNAME}" != "${HOST_HOSTNAME}" ]
    then
      [ -f ${XAUTHORITY} ] || touch ${XAUTHORITY}
      xauth add ${HOSTNAME}/${DISPLAY} . \
      $(xauth -f /tmp/.docker.xauth list | grep ${HOST_HOSTNAME}/${DISPLAY} | awk '{ print $NF }')
    else
      cp /tmp/.docker.xauth ${XAUTHORITY}
    fi
  fi
}

setup() {
  get_xauth_host
  firefox -CreateProfile default
  sudo dpkg -i /warsaw_setup64.deb
  sudo /usr/local/bin/warsaw/core
}

execute() {
  xvfb-run -a --server-args="-screen 0, 1920x1080x24" \
      java -jar $HOME/selenium-server-standalone.jar -enablePassThrough false -port 10000 &> /tmp/selenium.log &
}

setup
execute

