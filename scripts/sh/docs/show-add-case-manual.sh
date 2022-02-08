#!/bin/sh

. scripts/sh/color.sh

echo ""
echo "${Bold}Usage: add_case [Option] [CaseId]${Normal}"
echo ""
echo "Adds input and output files for a new test case for problem ${Bold}Problem${Normal}."
echo "If ${Bold}CaseId${Normal} is not given, it will be set to the minimum non-negative integer not"
echo "used in other test case."
echo ""
echo "The ${Bold}Problem${Normal} variable is required to be set in the ./config file."
echo ""
echo "The input and output files will be automatically opened in VSCode."
echo ""
echo "${Bold}Option:${Normal}"
echo "  ${Bold}-h${Normal}, ${Bold}--help${Normal}               show this manual, then exit"
echo ""