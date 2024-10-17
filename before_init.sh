#!/bin/bash
set -e

echo "Executing custom before-init hook..."

# Видалення локальних файлів стану
if [ -f terraform.tfstate ]; then
    echo "Removing local terraform.tfstate file"
    rm terraform.tfstate
fi

if [ -f terraform.tfstate.backup ]; then
    echo "Removing local terraform.tfstate.backup file"
    rm terraform.tfstate.backup
fi

# Перевірка версії Terraform
TERRAFORM_VERSION=$(terraform version -json | jq -r '.terraform_version')
LATEST_VERSION="1.9.8"  # Ви можете оновлювати це значення вручну або автоматизувати його отримання
echo "Current Terraform version: $TERRAFORM_VERSION"
echo "Latest Terraform version: $LATEST_VERSION"
if [ "$TERRAFORM_VERSION" != "$LATEST_VERSION" ]; then
    echo "Warning: Your Terraform version is not up to date. Consider updating."
fi

# Перевірка наявності необхідних змінних середовища AWS
if [ -z "$AWS_ACCESS_KEY_ID" ]; then
    echo "Error: AWS_ACCESS_KEY_ID is not set"
    exit 1
fi

if [ -z "$AWS_SECRET_ACCESS_KEY" ]; then
    echo "Error: AWS_SECRET_ACCESS_KEY is not set"
    exit 1
fi

# Додаткові перевірки чи дії можна додати тут

echo "Before-init hook completed successfully"