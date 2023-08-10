#!/usr/bin/env bash
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##@Version           :  202207112331-git
# @Author            :  Jason Hempstead
# @Contact           :  jason@casjaysdev.pro
# @License           :  LICENSE.md
# @ReadME            :  ca-setup.sh --help
# @Copyright         :  Copyright: (c)  Jason Hempstead, Casjays Developments
# @Created           :  Monday, Jul 11, 2022 23:31 EDT
# @File              :  ca-setup.sh
# @Description       :
# @TODO              :
# @Other             :
# @Resource          :
# @sudo/root         :  no
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Set bash options
[ -n "$DEBUG" ] && set -x
set -o pipefail
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
APPNAME="$(basename "$0")"
VERSION="202207112331-git"
USER="${SUDO_USER:-${USER}}"
HOME="${USER_HOME:-${HOME}}"
SRC_DIR="${BASH_SOURCE%/*}"
SSL_DIR="${MY_SSL_HOME:-$(cd "$SRC_DIR/../CasjaysDev" && echo "$PWD" || exit 1)}"
SSL_DH_DIR="${MY_SSL_DH_HOME:-$(cd "$SRC_DIR/../dh" && echo "$PWD" || exit 1)}"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
mkdir -p "$SSL_DH_DIR"
cd "$SSL_DH_DIR" || exit 1
umask 022
for legth in 512 1024 2048 4096; do
  if openssl dhparam -out "dh_$legth.tmp" "$legth"; then
    mv -f "dh_$legth.tmp" "dh_$legth.pem"
    chmod 644 "dh_$legth.pem"
  fi
done
