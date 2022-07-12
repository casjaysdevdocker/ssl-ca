#!/usr/bin/env bash
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##@Version           :  202207112331-git
# @Author            :  Jason Hempstead
# @Contact           :  jason@casjaysdev.com
# @License           :  LICENSE.md
# @ReadME            :  ca-revoke.sh --help
# @Copyright         :  Copyright: (c)  Jason Hempstead, Casjays Developments
# @Created           :  Monday, Jul 11, 2022 23:31 EDT
# @File              :  ca-revoke.sh
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
REVOKE_FILE="revoke.crl"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
mkdir -p "$SSL_DIR" "$SSL_DIR/crl" "$SSL_DIR/private" "$SSL_DIR/certs" "$SSL_DIR/p12" "$SSL_DIR/requests"
cd "$SSL_DIR" || exit 1
[[ -f "$SSL_DIR/certs/ca.crt" ]] || "$SRC_DIR/ca-setup.sh"
openssl ca -config "$SSL_DIR/openssl.cnf" -gencrl -keyfile $SSL_DIR/private/ca.key -cert $SSL_DIR/certs/ca.crt -out "$SSL_DIR/crl/$REVOKE_FILE" -passin file:$SSL_DIR/passwd
openssl crl -inform PEM -in "$SSL_DIR/crl/revoke.crl.pem" -outform DER -out "$SSL_DIR/crl/$REVOKE_FILE"
