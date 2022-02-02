#!/bin/sh

source scripts/sh/color.sh

echo ""
echo "${Bold}Usage:"
echo "  polygon generator Arg [GeneratorArgs..]"
echo "  polygon g Arg [GeneratorArgs..]${Normal}"
echo ""
echo "Compile and run a generator of the current problem."
echo ""
echo "${Bold}Arg:${Normal}"
echo "  ${Bold}-h${Normal}, ${Bold}--help${Normal}               show this manual, then exit"
echo "  ${Bold}Generator${Normal}                compile workspace/${Bold}Problem${Normal}/polygon/${Bold}Generator${Normal}.cpp and"
echo "                           run it with ${Bold}[GeneratorArgs..]${Normal} as command line arguments"
