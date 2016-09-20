#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

http_proxy="${1:-}"
https_proxy="${2:-}"
no_proxy="${3:-}"

# Docker
echo ">>> Configuring http proxies for docker"
sed -i -e '/\[Service\]/a EnvironmentFile=-/opt/mesosphere/etc/proxy.env' \
    /usr/lib/systemd/system/docker.service

systemctl daemon-reload
systemctl restart docker
