#!/bin/sh

TextReset="\033[0m"       # Text Reset
Cyan="\033[0;36m"         # Cyan
Red="\033[0;31m"          # Red
Green="\033[0;32m"        # Green

EchoError() { echo "${Red}ERROR: $1${TextReset}"; }
EchoRed() { echo "${Red}$1$TextReset"; }
EchoGreen() { echo "${Green}$1${TextReset}"; }
EchoInfo() { echo "${Cyan}$1${TextReset}"; }
EchoInfoNoEndl()  { printf "${Cyan}%s${TextReset}" "$1";}

SetInfoColor() { printf "${Cyan}"; }
ResetColor() { printf "${TextReset}"; }
