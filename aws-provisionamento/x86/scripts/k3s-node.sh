#!/bin/bash

# Substituir pelo IP do Master
MASTER_URL="https://44.193.70.125:6443"
# Substituir pelo token gerado no master - executar comando no master -> cat /var/lib/rancher/k3s/server/node-token
MASTER_TOKEN="K109786e95802e28aa265c446e385a240e5c4ce71afda14fc934cf8d2a384751340::server:411709ffd0e57ba113874be844368d6f"

curl -sfL https://get.k3s.io | K3S_URL=$MASTER_URL K3S_TOKEN=$MASTER_TOKEN sh -