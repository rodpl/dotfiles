#!/usr/bin/env zsh

echo "\n<<< Starting Node Setup >>>\n"

if exists $N_PREFIX/bin/node; then
  echo "Node $($N_PREFIX/bin/node --version) & NPM $($N_PREFIX/bin/npm --version) already installed with n"
else
  echo "Installing Node & NPM with n..."
  n latest
fi

npm install -g yarn

echo "Global NPM Packages installed"
npm list -g --depth=0