#!/bin/sh

. scripts/sh/color.sh

CppFile="$1"
ExecFile="$2"
CacheFile="$3"
if cmp --silent "$CppFile" "$CacheFile"; then
  EchoInfo "No changes in $CppFile"
else
  EchoInfo "Compiling $CppFile"
  g++ "$CppFile" -std=c++17 -o "$ExecFile" -I "scripts/cpp/polygon/cpp-include-path"
  if [ $? -ne 0 ]; then
    EchoError "Compilation error :("
    exit 1
  fi
  cp "$CppFile" "$CacheFile"
fi