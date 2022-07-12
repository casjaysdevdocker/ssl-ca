#!/usr/bin/env bash
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##@Version           :  202207112331-git
# @Author            :  Jason Hempstead
# @Contact           :  jason@casjaysdev.com
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
APPNAME="$(basename "$0")"
VERSION="202207112331-git"
USER="${SUDO_USER:-${USER}}"
HOME="${USER_HOME:-${HOME}}"
SRC_DIR="${BASH_SOURCE%/*}"
SSL_DIR="${MY_SSL_HOME:-$(cd "$SRC_DIR/../CasjaysDev" && echo "$PWD" || exit 1)}"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
mkdir -p "$SSL_DIR" "$SSL_DIR/crl" "$SSL_DIR/private" "$SSL_DIR/certs" "$SSL_DIR/p12" "$SSL_DIR/requests"
cd "$SSL_DIR" || exit 1
openssl req -new -x509 -extensions v3_ca -keyout "$SSL_DIR/private/ca.key" -out "$SSL_DIR/certs/ca.crt" -days 3650 -config "$SSL_DIR/openssl-ca.cnf"
openssl pkcs12 -export -out "$SSL_DIR/p12/ca.p12" -in "$SSL_DIR/certs/ca.crt" -inkey "$SSL_DIR/private/ca.key"
