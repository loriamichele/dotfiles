#!/bin/bash

set -e

echo "Installing fonts..."

if [ ! -d "~/.local" ]; then
    mkdir ~/.local || true
fi
if [ ! -d "~/.local/share" ]; then
    mkdir ~/.local/share || true
fi
if [ ! -d "~/.local/share/fonts" ]; then
    mkdir ~/.local/share/fonts || true
fi

cp font/* ~/.local/share/fonts

echo "Done installing fonts! 👌 "
