#!/bin/sh

source scripts/sh/color.sh

echo ""
echo "${Bold}Usage: add_case [Options]${Normal}"
echo ""
echo "Adds input and output files for a new test case for problem ${Bold}Problem${Normal}, the"
echo "${Bold}CaseId${Normal} will be set to the minimum non-negative integer not used in other"
echo "test case."
echo ""
echo "The ${Bold}Problem${Normal} variable is required to be set in the ./config file."
echo ""
echo "The input and output files will be automatically opened in VSCode."
echo ""
echo "${Bold}Options:${Normal}"
echo "  ${Bold}-h${Normal}, ${Bold}--help${Normal}               show this manual, then exit"
echo ""