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

prepare() {
  get_xauth_host
  firefox -CreateProfile default
  sudo dpkg -i /warsaw_setup64.deb
  sudo /usr/local/bin/warsaw/core
  /usr/local/bin/warsaw/core
}

run() {
  prepare
  firefox $1
}


case ${1} in
  itau)
    run "http://www.itau.com.br"
  ;;
  bb)
    run "https://www2.bancobrasil.com.br/aapf/login.jsp?aapf.IDH=sim&perfil=1"
  ;;
  bbpj)
    run "https://aapj.bb.com.br/aapj/loginpfe.bb"
  ;;
  cef)
    run "https://internetbanking.caixa.gov.br/sinbc/#!nb/login"
  ;;
  sobre|about|ajuda|help)
    run "https://github.com/lichti/containers4docker/tree/master/warsaw-browser"
  ;;
  *)
    prepare
  ;;
esac


