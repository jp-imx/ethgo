#!/usr/bin/env bash

set -o errexit

start_geth () {
    VERSION=1.9.1-b7b2f60f

    NAME=geth-linux-amd64-$VERSION
    RELEASE=https://gethstore.blob.core.windows.net/builds/$NAME.tar.gz

    curl -sfSO "${RELEASE}"
    tar -xvzf $NAME.tar.gz

    nohup $NAME/geth --dev --rpc &
    sleep 5
}

install_solidity() {
    VERSION="0.5.5"
    DOWNLOAD=https://github.com/ethereum/solidity/releases/download/v${VERSION}/solc-static-linux

    curl -L $DOWNLOAD > /tmp/solc
    chmod +x /tmp/solc
    mv /tmp/solc /usr/local/bin/solc
}

start_geth
install_solidity
