#!/bin/bash
set -e

CHART_VERSION="1.3.0"
NAMESPACE="default"

echo "Logging into ECR..."
aws ecr-public get-login-password --region us-east-1 | \
  helm registry login -u AWS --password-stdin public.ecr.aws

echo "Installing catalog..."
helm upgrade --install catalog \
  oci://public.ecr.aws/aws-containers/retail-store-sample-catalog-chart \
  --version $CHART_VERSION --namespace $NAMESPACE \
  -f values-catalog.yaml

echo "Installing cart..."
helm upgrade --install cart \
  oci://public.ecr.aws/aws-containers/retail-store-sample-cart-chart \
  --version $CHART_VERSION --namespace $NAMESPACE \
  -f values-cart.yaml

echo "Installing checkout..."
helm upgrade --install checkout \
  oci://public.ecr.aws/aws-containers/retail-store-sample-checkout-chart \
  --version $CHART_VERSION --namespace $NAMESPACE \
  -f values-checkout.yaml

echo "Installing orders..."
helm upgrade --install orders \
  oci://public.ecr.aws/aws-containers/retail-store-sample-orders-chart \
  --version $CHART_VERSION --namespace $NAMESPACE \
  -f values-orders.yaml

echo "Installing ui..."
helm upgrade --install ui \
  oci://public.ecr.aws/aws-containers/retail-store-sample-ui-chart \
  --version $CHART_VERSION --namespace $NAMESPACE \
  -f values-ui.yaml

echo "Done!"
kubectl get pods -n $NAMESPACE