#!/bin/sh

. scripts/sh/color.sh

echo ""
echo "${Bold}Usage:"
echo "  polygon validator [Args]"
echo "  polygon v [Args]${Normal}"
echo ""
echo "Compile and run the validator for the current problem against one or all of the"
echo "inputs. If no argument is given then the all of the inputs will be validated."
echo ""
echo "${Bold}Args:${Normal}"
echo "  ${Bold}-h${Normal}, ${Bold}--help${Normal}               show this manual, then exit"
echo "  ${Bold}CaseId${Normal}                   compile and run the validator with the case"
echo "                           workspace/${Bold}Problem${Normal}/cases/${Bold}CaseId${Normal}.in as input"
