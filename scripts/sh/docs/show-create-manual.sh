#!/bin/sh

. scripts/sh/color.sh

echo
echo "${Bold}Usage: create [Options] Problem${Normal}"
echo
echo "Creates solution folder for problem ${Bold}Problem${Normal} in the programming language"
echo "${Bold}Lang${Normal}, the created files are:"
echo
echo "|- workspace/"
echo "|  |- ${Bold}Problem${Normal}/"
echo "|  |  |- main.${Bold}Lang${Normal}"
echo "|  |  |- cases/"
echo "|  |  |  |- 0.in"
echo "|  |  |  |- 0.out"
echo "|  |  |  |- ..."
echo "|  |  |- polygon/          ${Italic}(if --polygon or -p flag is used)${Normal}"
echo "|  |  |- |- validator.cpp"
echo "|  |  |- |- ..."
echo 
echo "main.go, 0.in and 0.out will be automatically opened in VSCode."
echo 
echo "The ${Bold}Problem${Normal} variable will be saved in the ./config file."
echo "The default value for ${Bold}Lang${Normal} is \"cpp\", in case it is not given and it is not in"
echo "the ./config file."
echo
echo "${Bold}Options:${Normal}"
echo "  ${Bold}-l${Normal}, ${Bold}--lang${Normal}               set the ${Bold}Lang${Normal} variable in ./config file, and uses"
echo "                           creates the solution file with the template for the"
echo "                           given language. The accepted languages are \"cpp\","
echo "                           \"java\", \"go\" and \"python\""
echo "  ${Bold}-h${Normal}, ${Bold}--help${Normal}               show this manual, then exit"
echo "  ${Bold}-p${Normal}, ${Bold}--polygon${Normal}            creates the polygon/ folder with a sample validator"
echo "                           and generator"
echo "  ${Bold}-u${Normal}, ${Bold}--url${Normal} arg            codeforces problem url to get tests"
echo