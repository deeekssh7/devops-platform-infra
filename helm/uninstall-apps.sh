#!/bin/bash
set -e

NAMESPACE="default"

helm uninstall ui --namespace $NAMESPACE
helm uninstall orders --namespace $NAMESPACE
helm uninstall checkout --namespace $NAMESPACE
helm uninstall cart --namespace $NAMESPACE
helm uninstall catalog --namespace $NAMESPACE

echo "All apps uninstalled."