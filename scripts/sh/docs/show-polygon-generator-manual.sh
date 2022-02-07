#!/bin/sh

. scripts/sh/color.sh

echo ""
echo "${Bold}Usage:"
echo "  polygon generator [Options] GeneratorName [GeneratorArgs..]"
echo "  polygon g [Options] GeneratorName [GeneratorArgs..]${Normal}"
echo ""
echo "Compile and run a generator of the current problem. More specifically, compile"
echo "workspace/${Bold}Problem${Normal}/polygon/${Bold}GeneratorName${Normal}.cpp and run it with ${Bold}[GeneratorArgs..]${Normal}"
echo "as command line arguments"
echo ""
echo "${Bold}Options${Normal}:"
echo "  ${Bold}-c${Normal}, ${Bold}--case arg${Normal}           save the generated test case with the given ID"
echo "  ${Bold}-h${Normal}, ${Bold}--help${Normal}               show this manual, then exit"
