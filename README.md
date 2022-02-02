# What is this?

Tools for efficient competitive programming in Go and C++ using Visual Studio Code.

# Dependencies

- Visual Studio Code: https://code.visualstudio.com/
- POSIX Shell: `/bin/sh --version`
- [Optional] Golang for Go problem solving: https://go.dev/
- [Optional] G++ for C++ problem solving: `$ g++ --version`

# Quickstart

In order for all the scripts to run you have to give them permission:
```
chmod +x **/*.sh
```

The following is an example of how to use golang to solve a classic [A+B problem](http://poj.org/problem?id=1000).

Create a solution for problem A (folder `./workspace/A`):
```
./create -l go A
```

This sets the `${Lang}` variable to `"go"` and `${Problem}` variable to to `"A"` in `./config`. The `${Problem}` variable makes the `./run` and `./add_case` commands to work in the `./workspace/A` directory. Also, the script creates and opens in VSCode the files:
- `./workspace/A/main.go`: For your solution file.
- `./workspace/A/cases/0.in`: Input file for case `0`.
- `./workspace/A/cases/0.out`: Expected output for case `0`.

Save the following in `0.in`:
```
10 12
```

And save the following in `0.out` (add a single newline after the number):
```
22
```

Replace the contents of `./workspace/A/main.go` with:
```
package main

import "fmt"

func main() {
	var a, b int
	fmt.Scan(&a, &b)
	fmt.Printf("%d\n", a+b)
}
```

Now run your solution for problem `A` with case `0`:
```
./run 0
```

You do not need to specify the problem since the `${Problem}` variable is already set in `./config` from the previus `./create A` call.

To add a new test case for problem A run:
```
./add_case
```

This will create and open in VSCode the files `workspace/A/cases/1.in` and `workspace/A/cases/1.out`. You can add a case with input `1 2` and output `3` and test your solution against it with:
```
./run 1
```

## Scripts

The following scripts are available in the root folder: `./open`, `./create`, `./add_case`, `./run` and , `./polygon`.

You can see the manual for any script by running them with the `-h` or `--help` flag, for example: `./create -h`.

## Folder structure

```
|- add_case
|- config
|- create
|- polygon
|- open
|- run
|- .vscode/
|  |- snippets.code-snippets
|  |- c_cpp_properties.json
|- scripts/
|- notebook/
|  |- go/
|  |  |- template.go
|  |- cpp/
|  |  |- template.cpp
|- workspace/
|  | ...
|  |- ${Problem}/
|  |  |- main.go
|  |  |- cases/
|  |  |  |- 0.in
|  |  |  |- 0.out
|  |  |  |- 0.txt
|  |  |  | ...
|  |  |  |- ${CaseId}.in
|  |  |  |- ${CaseId}.out
|  |  |  |- ${CaseId}.txt
```

File/folder description:
- `./add_case`: Create input and output files for a new test case for the current problem.
- `./config`: File containing the current values for `${Lang}`, `${Problem}` and `${CaseId}` variables.
- `./create`: Creates a new folder in `workspace/` for a new problem and sets the `${Problem}` variable.
- `./run`: Runs one or all test cases for the current problem.
- `./open`: Opens the given test case for the current problem.
- `./polygon`: Runs a polygon validator or generator for the current problem.
- `./scripts/`: Contains helper scripts used by the main scripts in the root folder.
- `./notebook/`: Folder with tested implementations of algorithms, data structures or utilities to be copy pasted when needed.
- `./.vscode/snippets.code-snippets`: Handy (VSCode snippets)[https://code.visualstudio.com/docs/editor/userdefinedsnippets] for faster problem solving.
- `./.vscode/c_cpp_properties.json`: Updates the VSCode "include path" for C++, so that C++ programns can include [testlib.h](scripts/cpp/polygon/cpp-include-path).
- `./notebook/go/template.go`: Default code for `./workspace/${Problem}/main.go` when `./create --l go ${Problem}` is called.
- `./notebook/go/template.cpp`: Default code for `./workspace/${Problem}/main.cpp` when `./create -l cpp ${Problem}` is called.
- `./workspace/${Problem}/`: Folder with the source code and test cases for problem `${Problem}`, it is created by `./create ${Problem}`
- `./workspace/${Problem}/main.go`: Solution file for problem `${Problem}`.
- `./workspace/${Problem}/cases/`: Folder containing inputs, answers and the solution outputs for the problem `${Problem}`.
- `./workspace/${Problem}/cases/${CaseId}.in`: Input file for case `${CaseId}` of problem `${Problem}`.
- `./workspace/${Problem}/cases/${CaseId}.txt`: Solution's output for case `${CaseId}` of problem `${Problem}`. This is your solution's output.
- `./workspace/${Problem}/cases/${CaseId}.out`: Answer file for case `${CaseId}` of problem `${Problem}`. This is the expected output.

## Polygon quickstart

Here's an example of how to prepare an "A+B problem" for [polygon](https://polygon.codeforces.com/).

Create a problem called "aplusb" by using `./create` with the `--polygon` (or `-p`) flag: 

```
./create aplusb --polygon
```

This will create
```
|- workspace/
|  |- aplusb/
|  |  |- main.cpp   # Sample solution file
|  |  |- cases/
|  |  |  |- 0.in    # Sample input 0
|  |  |  |- 0.out   # Sample output 0
|  |  |- polygon/
|  |  |- |- validator.cpp # Sample input validator
|  |  |- |- gen-random.cpp # Sample random case generator
```

This autogenerated template are correct for a simple A+B problem. So you can run the solution file aginst case 0:

```
./run 0
```

Now you can add a new test case running:

```
./add_case
```

And saving `10 10\n` in `workspace/aplusb/cases/0.in` and `20\n` in `workspace/aplusb/cases/1.out`.

In order to run the solution against all test cases you can run:
```
./run -a
```

### Validator

In order to use the validator to check that all the inputs are valid you can run:
```
./polygon validator
```

If you want to validate only `workspace/aplusb/cases/1.in` you can run:
```
./polygon validator 1
```

A shortcut for `./polygon validator` is `./polygon v`.

### Generators

In order to generate a case with the sample generator (`workspace/aplusb/polygon/gen-random.cpp`) you can run:
```
./polygon generator gen-random
```

Since the generator uses [testlib](https://github.com/MikeMirzayanov/testlib), it always outputs the same numbers. But you can add a random extra argument to change the output, for example:

```
./polygon generator gen-random random-seed-value-12341
```

A shortcut for `./polygon generator` is `./polygon g`.

## Contribute

See [contributing guidelines](CONTRIBUTING.md).
