#!/bin/bash
set -e

REPO="https://github.com/superskibidi69/funny-cli.git"
echo "📦 Installing Bahoot CLI..."

if ! command -v node &> /dev/null || ! command -v npm &> /dev/null; then
  echo "⚠️ Node.js and npm required. Please install them first."
  exit 1
fi

npm install -g "$REPO"

echo "✅ Installed! Run 'bahoot' to get started. if not work, idk"
