#!/bin/bash
set -e

REPO="superskibidi/funny-cli"
echo "📦 Installing Bahoot CLI..."

if ! command -v node &> /dev/null || ! command -v npm &> /dev/null; then
  echo "⚠️ Node.js and npm required. Please install them first."
  exit 1
fi

npm install -g "https://github.com/$REPO.git"

echo "✅ Installed! Run 'bahoot' to get started."
