#!/usr/bin/env bash
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##@Version           :  202207112331-git
# @Author            :  Jason Hempstead
# @Contact           :  jason@casjaysdev.com
# @License           :  LICENSE.md
# @ReadME            :  ca-install.sh --help
# @Copyright         :  Copyright: (c)  Jason Hempstead, Casjays Developments
# @Created           :  Monday, Jul 11, 2022 23:31 EDT
# @File              :  ca-install.sh
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
SSL_DIR="${MY_SSL_HOME:-$SSL_DIR}"
SSL_SYS_DIR="${SSL_DIR}"
[ -n "$SSL_DIR" ] || SSL_DIR="/config/ssl"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
mkdir -p "$SSL_SYS_DIR" "$SSL_DIR"
cd "$SSL_DIR"
[ "$SSL_DIR" = "$SSL_SYS_DIR" ] || rsync -avhP "$SSL_DIR/." "$SSL_SYS_DIR/"

