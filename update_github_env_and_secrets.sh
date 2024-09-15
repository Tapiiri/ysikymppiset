#!/bin/bash

# Usage: ./update_github_env_and_secrets.sh <environment>
# Example: ./update_github_env_and_secrets.sh production

# Check for the environment name argument
if [ -z "$1" ]; then
  echo "Error: Environment name not provided."
  echo "Usage: $0 <environment>"
  exit 1
fi

ENVIRONMENT=$1

# Check for gh CLI tool
if ! command -v gh &> /dev/null; then
  echo "Error: GitHub CLI (gh) is not installed."
  exit 1
fi

# Update GitHub Actions Environment Variables
if [ -f ".env" ]; then
  echo "Updating GitHub Actions Environment Variables for environment: $ENVIRONMENT"
  while IFS='=' read -r key value; do
    if [[ -n "$key" && "$key" != \#* ]]; then
      echo "Setting environment variable: $key"
      gh variable set "$key" --env "$ENVIRONMENT" --body "$value"
    fi
  done < .env
else
  echo "Warning: .env file not found. Skipping environment variable update."
fi

# Update GitHub Actions Secrets
if [ -f ".secrets" ]; then
  echo "Updating GitHub Actions Secrets for environment: $ENVIRONMENT"
  while IFS='=' read -r key value; do
    if [[ -n "$key" && "$key" != \#* ]]; then
      echo "Setting secret: $key"
      echo "$value" | gh secret set "$key" --env "$ENVIRONMENT"
    fi
  done < .secrets
else
  echo "Warning: .secrets file not found. Skipping secrets update."
fi

echo "Update complete!"
