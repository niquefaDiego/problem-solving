#!/bin/sh

source scripts/sh/color.sh

echo ""
echo "${Bold}Usage: run [Options] [CaseId]${Normal}"
echo ""
echo "Run the solution for problem ${Bold}Problem${Normal} against one or several test cases."
echo ""
echo "${Bold}Options:"
echo "  ${Bold}-d${Normal}, ${Bold}--debug${Normal}              flag to run case in debug mode"
echo "  ${Bold}-a${Normal}, ${Bold}--all${Normal}                test solution against all test cases"
echo "  ${Bold}-c${Normal}, ${Bold}--case${Normal} arg           set the ${Bold}CaseId${Normal} variable in ./config file"
echo "  ${Bold}-p${Normal}, ${Bold}--problem${Normal} arg        set the ${Bold}Problem${Normal} variable in ./config file"
echo "  ${Bold}-l${Normal}, ${Bold}--lang${Normal}               set the ${Bold}Lang${Normal} variable in ./config file, and uses"
echo "                           solution file for that language. The accepted"
echo "                           languages are \"go\" and \"cpp\""
echo "  ${Bold}-h${Normal}, ${Bold}--help${Normal}               show this manual, then exit"
echo ""
echo "Variables saved in ./config will be used as default values when not specified"
echo "in subsequen calls to run."