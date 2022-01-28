# What is this?

Tools for efficient competitive programming in golang using Visual Studio Code.


# Dependencies

- Golang: https://go.dev/
- Visual Studio Code: https://code.visualstudio.com/
- POSIX Shell: `/bin/sh --version`

# Quickstart

Create a solution for problem A (folder `./workspace/A`):
```
./create A
```

This sets the `${Problem}` variable to to `"A"` in `./config`, this means the `./run` and `./add_case` commands to work in the `./workspace/A` directory. Also, it creates and opens in VSCode the files:
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

You can see the manual for each of the 3 scripts by running them with the `-h` or `--help` flag:

```
./create -h
./run -h
./add_case -h

./create --help
./run --help
./add_case --help
```

## Folder structure

```
|- add_case
|- config
|- create
|- run
|- docs/
|- notebook/
|  |- template.go
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
- `./add_case`: See previus section.
- `./config`: File containing the current values for `Problem` and `CaseId`.
- `./create`: See previus section.
- `./run`: See previus section.
- `./docs/`: Contains text files with documentation that gets shown by scripts.
- `./notebook/`: Folder with tested implementations of algorithms, data structures or utilities to be copy pasted when needed.
- `./notebook/template.go`: Default code for `./workspace/${Problem}/main.go` when `./create ${Problem}` is called.
- `./workspace/${Problem}/`: Folder with the source code and test cases for problem `${Problem}`, it is created by `./create ${Problem}`
- `./workspace/${Problem}/main.go`: Solution file for problem `${Problem}`.
- `./workspace/${Problem}/cases/`: Folder containing inputs, answers and the solution outputs for the problem `${Problem}`.
- `./workspace/${Problem}/cases/${CaseId}.in`: Input file for case `${CaseId}` of problem `${Problem}`.
- `./workspace/${Problem}/cases/${CaseId}.out`: Answer file for case `${CaseId}` of problem `${Problem}`. This is the expected output.
- `./workspace/${Problem}/cases/${CaseId}.txt`: Solution's output for case `${CaseId}` of problem `${Problem}`. This is your solution's output.

## Contributing

Make sure all scripts pass shellcheck:
https://www.shellcheck.net/

Documentation for shell:
https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html
https://github.com/dylanaraps/pure-sh-bible
