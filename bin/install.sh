#!/bin/bash
set -e

REPO="superskibidi/funny-cli"
echo "📦 Installing Bahoot CLI..."

if ! command -v node &> /dev/null || ! command -v npm &> /dev/null; then
  echo "⚠️ Node.js and npm required. Please install them first."
  exit 1
fi

npm install -g "npm install -g git+https://github.com/superskibidi/funny-cli.git"

echo "✅ Installed! Run 'bahoot' to get started."
