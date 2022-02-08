#!/bin/sh

. scripts/sh/color.sh

echo
EchoError "Problem is required."
echo
echo "You can specify it by using the argument ${Bold}-p${Normal} or ${Bold}--problem${Normal}. For example:"
echo "${Bold}  $ ./run.sh -problem A -case 0${Normal}"
echo "The problem will be saved in the ./config file for subsequent uses of ./run."
echo
echo "You can also create a new problem, which saves the ${Bold}Problem${Normal} variable in ./config:"
echo "${Bold}  $ ./create problem ${Normal}"

