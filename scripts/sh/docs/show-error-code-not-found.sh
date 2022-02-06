#!/bin/sh

. scripts/sh/color.sh

EchoError "command not found: code"
EchoRed "Install VSCode to automatically open the created files in VSCode:"
EchoRed " -> https://code.visualstudio.com/"
EchoRed "When using Windows Subsystem for Linux you also need to install:"
EchoRed " -> https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack"\
