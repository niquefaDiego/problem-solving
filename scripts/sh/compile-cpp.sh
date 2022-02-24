#!/bin/sh

. scripts/sh/color.sh

CppFile="$1"
ExecFile="$2"
CacheFile="$3"
ExecFolder=$(dirname "$ExecFile")

mkdir -p "$ExecFolder"

if cmp --silent "$CppFile" "$CacheFile"; then
  EchoInfo "No changes in $CppFile"
else
  if [ -f "$ExecFile" ]; then
    rm "$ExecFile"
  fi

  cp "$CppFile" "$CacheFile"
  EchoInfo "Compiling $CppFile"
  g++ "$CppFile" -O2 -std=c++17 -o "$ExecFile" -I "scripts/cpp/polygon/cpp-include-path"
  if [ $? -ne 0 ]; then
    EchoError "Compilation error :("
    exit 1
  fi
fi