#!/bin/bash
set -e

echo "Executing simple before-init hook..."

# Перевірка версії Terraform
TERRAFORM_VERSION=$(terraform version -json | jq -r '.terraform_version')
echo "Current Terraform version: $TERRAFORM_VERSION"

# Видалення локальних файлів стану, якщо вони існують
if [ -f terraform.tfstate ]; then
    echo "Removing local terraform.tfstate file"
    rm terraform.tfstate
fi

if [ -f terraform.tfstate.backup ]; then
    echo "Removing local terraform.tfstate.backup file"
    rm terraform.tfstate.backup
fi

# Перевірка наявності необхідних файлів
if [ ! -f main.tf ]; then
    echo "Warning: main.tf file not found in the current directory"
fi

echo "Before-init hook completed successfully"