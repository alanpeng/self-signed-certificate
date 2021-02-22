#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE[0]}")"

if [ -f "out/root.crt" ]; then
    echo Root certificate already exists.
    exit 1
fi

if [ ! -d "out" ]; then
    bash flush.sh
fi

# Generate root cert along with root key
openssl req -config ca.cnf \
    -newkey rsa:2048 -nodes -keyout out/root.key.pem \
    -new -x509 -days 36500 -out out/root.crt \
    -subj "/C=CN/ST=Guangdong/L=Guangzhou/O=Wise2C/CN=Wise2C ROOT CA"

# Generate cert key
openssl genrsa -out "out/cert.key.pem" 2048
