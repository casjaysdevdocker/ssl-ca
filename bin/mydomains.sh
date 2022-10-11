#!/usr/bin/env bash
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##@Version           :  202207112331-git
# @Author            :  Jason Hempstead
# @Contact           :  jason@casjaysdev.com
# @License           :  LICENSE.md
# @ReadME            :  mydomains.sh --help
# @Copyright         :  Copyright: (c)  Jason Hempstead, Casjays Developments
# @Created           :  Monday, Jul 11, 2022 23:31 EDT
# @File              :  mydomains.sh
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
DOMAIN="localhost"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
mkdir -p "$SSL_DIR" "$SSL_DIR/crl" "$SSL_DIR/private" "$SSL_DIR/certs" "$SSL_DIR/p12" "$SSL_DIR/requests"
[[ -n "$DOMAIN" ]] || { echo "Usage: $APPNAME" && exit 1; }
[[ -f "$SSL_DIR/certs/ca.crt" ]] || "$SRC_DIR/ca-setup.sh"
openssl req -new -sha256 -newkey rsa:2048 -config $SSL_DIR/mydomains.cnf -passin file:$SSL_DIR/passwd -nodes -keyout $SSL_DIR/private/$DOMAIN.key -out $SSL_DIR/requests/$DOMAIN.csr
openssl ca -policy policy_anything -keyfile $SSL_DIR/private/ca.key -config $SSL_DIR/mydomains.cnf -passin file:$SSL_DIR/passwd -out $SSL_DIR/certs/$DOMAIN.crt -infiles $SSL_DIR/requests/$DOMAIN.csr
#clear
