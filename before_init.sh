#!/bin/bash
set -e

echo "Executing custom before-init hook..."

terraform version

if [ -z "$AWS_ACCESS_KEY_ID" ]; then
    echo "Error: AWS_ACCESS_KEY_ID is not set"
    exit 1
fi
if [ -z "$AWS_SECRET_ACCESS_KEY" ]; then
    echo "Error: AWS_SECRET_ACCESS_KEY is not set"
    exit 1
fi

rm -rf .terraform

if [ -f terraform.tfstate ]; then
    cp terraform.tfstate terraform.tfstate.backup_$(date +%Y%m%d_%H%M%S)
    echo "Backup of terraform.tfstate created"
fi

terraform fmt -check -recursive

echo "Before-init hook completed successfully"#!/bin/bash
set -e

echo "Executing custom before-init hook..."

terraform version

if [ -z "$AWS_ACCESS_KEY_ID" ]; then
    echo "Error: AWS_ACCESS_KEY_ID is not set"
    exit 1
fi
if [ -z "$AWS_SECRET_ACCESS_KEY" ]; then
    echo "Error: AWS_SECRET_ACCESS_KEY is not set"
    exit 1
fi

rm -rf .terraform

if [ -f terraform.tfstate ]; then
    cp terraform.tfstate terraform.tfstate.backup_$(date +%Y%m%d_%H%M%S)
    echo "Backup of terraform.tfstate created"
fi

terraform fmt -check -recursive

echo "Before-init hook completed successfully"