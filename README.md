# What is this?

Tools for efficient competitive programming in Go and C++ using Visual Studio Code.

# Dependencies

- Visual Studio Code: https://code.visualstudio.com/
- POSIX Shell: `/bin/sh --version`
- [Optional] Golang for Go problem solving: https://go.dev/
- [Optional] GCC for C++ problem solving: https://gcc.gnu.org/

# Quickstart

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

The following scripts are available in the root folder: `./open`, `./create`, `./add_case` and `./run`.

You can see the manual for any script by running them with the `-h` or `--help` flag, for example: `./create -h`.

## Folder structure

```
|- add_case
|- config
|- create
|- open
|- run
|- .vscode/
|  |- snippets.code-snippets
|- docs/
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
- `./add_case`: [Add case script manual](/docs/add-case-manual.txt).
- `./config`: File containing the current values for `${Lang}`, `${Problem}` and `${CaseId}`.
- `./create`: [Create script manual](/docs/create-manual.txt).
- `./run`: [Run script manual](/docs/run-manual.txt).
- `./open`: [Open script manual](/docs/open-manual.txt).
- `./docs/`: Contains text files with documentation that gets shown by scripts.
- `./notebook/`: Folder with tested implementations of algorithms, data structures or utilities to be copy pasted when needed.
- `./.vscode/snippets.code-snippets`: Handy (VSCode snippets)[https://code.visualstudio.com/docs/editor/userdefinedsnippets] for faster problem solving.
- `./notebook/go/template.go`: Default code for `./workspace/${Problem}/main.go` when `./create --l go ${Problem}` is called.
- `./notebook/go/template.cpp`: Default code for `./workspace/${Problem}/main.cpp` when `./create -l cpp ${Problem}` is called.
- `./workspace/${Problem}/`: Folder with the source code and test cases for problem `${Problem}`, it is created by `./create ${Problem}`
- `./workspace/${Problem}/main.go`: Solution file for problem `${Problem}`.
- `./workspace/${Problem}/cases/`: Folder containing inputs, answers and the solution outputs for the problem `${Problem}`.
- `./workspace/${Problem}/cases/${CaseId}.in`: Input file for case `${CaseId}` of problem `${Problem}`.
- `./workspace/${Problem}/cases/${CaseId}.txt`: Solution's output for case `${CaseId}` of problem `${Problem}`. This is your solution's output.
- `./workspace/${Problem}/cases/${CaseId}.out`: Answer file for case `${CaseId}` of problem `${Problem}`. This is the expected output.

## Contribute

See [contributing guidelines](CONTRIBUTING.md).
