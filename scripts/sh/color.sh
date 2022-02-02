#!/bin/sh

# https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux

Normal="\033[0m"          # Reset to normal font
Cyan="\033[0;36m"         # Cyan
Red="\033[0;31m"          # Red
Green="\033[0;32m"        # Green
Bold="\033[1m"            # Bold
Italic="\033[3m"            # Bold

EchoError() { echo "${Red}ERROR: $1${Normal}"; }
EchoRed() { echo "${Red}$1$Normal"; }
EchoGreen() { echo "${Green}$1${Normal}"; }
EchoInfo() { echo "${Cyan}$1${Normal}"; }
EchoInfoNoEndl()  { printf "${Cyan}%s${Normal}" "$1";}

SetInfoColor() { printf "${Cyan}"; }
ResetColor() { printf "${Normal}"; }
