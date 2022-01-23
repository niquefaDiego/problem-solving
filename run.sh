#!/usr/local/bin/bash

Problem=""
CaseId=""
Debug="false"

SetProblem () {
  if [ -z "$Problem" ]; then
    Problem=$1
  else
    echo "ERROR: Problem given multiple times, but it must be given exactly once."
    exit 1
  fi
}

SetCaseId () {
  if [ -z "$CaseId" ]; then
    CaseId=$1
  else
    echo "ERROR: Case given multiple times, but it must be given exactly once."
    exit 1
  fi
}

while test $# -gt 0; do
  case "$1" in
    # Debug flag
    -d) ;&
    -debug)
      shift
      Debug="true"
      ;;

    # Test case ID
    -c) ;&
    -case)
      shift
      SetCaseId $1
      shift
      ;;
    
    # Problem
    -p) ;&
    -prob) ;&
    -problem)
      shift
      SetProblem $1
      shift
      ;;

    # Some other parameter
    *)
      if [ -z "$Problem" ]; then
        SetProblem $1
        shift
      elif [ -z "$CaseId" ]; then
        SetCaseId $1
        shift
      else
        echo "ERROR: Could not parse parameter: $1"
        exit 1;
      fi
      ;;
  esac
done  

if [ -z "$Problem" ]; then
  cat docs/run-problem-required.txt
  exit 1
fi

if [ -z "$CaseId" ]; then
  CaseId="0"
fi

echo "Running problem $Problem with case $CaseId. Debug=$Debug..."

SOLUTION_FILE=workspace/$Problem/main.go
INPUT_FILE=workspace/$Problem/$CaseId.in
OUTPUT_FILE=workspace/$Problem/$CaseId.txt
EXPECTED_FILE=workspace/$Problem/$CaseId.out

if ! test -f $SOLUTION_FILE; then
  echo "Solution file not found: ${SOLUTION_FILE}"
  exit 0
fi

if ! test -f $INPUT_FILE; then
  echo "Input file not found: ${INPUT_FILE}"
  exit 0
fi

if $Debug -eq "true"; then
  go run $SOLUTION_FILE <$INPUT_FILE
else
  go run $SOLUTION_FILE <$INPUT_FILE> $OUTPUT_FILE

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
