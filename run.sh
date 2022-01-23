#!/usr/local/bin/bash

Problem=""
CaseId="0"
Debug="false"

print_usage() {
  printf "TODO: show manual"
}

while test $# -gt 0; do
  case "$1" in
    # Debug flag
    -d)
      ;&
    -debug)
      shift
      Debug="true"
      ;;

    # Test case ID
    -c)
      ;&
    -case)
      shift
      CaseId=$1
      shift
      ;;
    
    # Problem
    -p)
      ;&
    -prob)
      shift
      Problem=$1
      shift
      ;;

    # Unknown flag
    *)
      print_usage
      exit 1;
      ;;
  esac
done  

GO_FILE=workspace/$Problem/main.go
INPUT_FILE=workspace/$Problem/$CaseId.in
OUTPUT_FILE=workspace/$Problem/$CaseId.txt
EXPECTED_FILE=workspace/$Problem/$CaseId.out

if $Debug -eq "true"; then
  go run $GO_FILE <$INPUT_FILE
else
  go run $GO_FILE <$INPUT_FILE> $OUTPUT_FILE

  if test -f $EXPECTED_FILE; then
    if cmp --silent -- "$OUTPUT_FILE" "$EXPECTED_FILE"; then
      echo "Case $CaseId: Correct! :D"
    else
      echo "Case $CaseId: Wrong :("
    fi
  fi

  echo "----- OUTPUT START -----"
  cat workspace/$Problem/$CaseId.txt
  echo "------ OUTPUT END ------"
fi
