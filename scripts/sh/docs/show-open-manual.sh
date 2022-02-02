#!/bin/sh

. scripts/sh/color.sh

echo ""
echo "${Bold}Usage: open [Options] [CaseId]${Normal}"
echo ""
echo "Opens with VSCode the input and expected output files for ${Bold}CaseId${Normal}. If ${Bold}CaseId${Normal}"
echo "is not given, it will be take from the \"./config\" file."
echo ""
echo "${Bold}Options:${Normal}"
echo "  ${Bold}-h${Normal}, ${Bold}--help${Normal}               show this manual, then exit"
echo ""