#!/bin/bash
#set -eo pipefail

export LANG="pt_BR.UTF-8"

export HOST_HOSTNAME=#HOSTNAME#
export DISPLAY=unix#DISPLAY#
export XAUTHORITY=/home/bank/.Xauthority

get_xauth_host() {
  if [ -n "${XAUTHORITY}" ] && [ -n "${HOST_HOSTNAME}" ]
  then
    if [ "${HOSTNAME}" != "${HOST_HOSTNAME}" ]
    then
      [ -f ${XAUTHORITY} ] || touch ${XAUTHORITY}
      xauth add ${HOSTNAME}/${DISPLAY} . \
      $(xauth -f /tmp/.docker.xauth list | grep $HOST_HOSTNAME | awk '{ print $NF }')
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

setup

