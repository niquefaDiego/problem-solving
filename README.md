# What is this?

Tools for efficient competitive programming in golang using Visual Studio Code.

# Quickstart

Create a solution for problem A (folder `./workspace/A`):
```
./create A
```

This will set the `${Problem}` variable to to `"A"` in `./config`.

Run your solution for problem A with case 0 (workspace/A/0.in):
```
./run 0
```
Note that you do not need to specify the problem since the `${Problem}` variable is already set in `./config` from the previus `./create A` call.

To add a new test case for problem A run:
```
./add_case
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

TODO: Implement the help flags in every script :P


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

- `./add_case`: See previus section.
- `./config`: File containing the current values for `Problem` and `CaseId`.
- `./create`: See previus section.
- `./run`: See previus section.
- `./docs/`: Contains text files with documentation that gets shown by some scripts when certain errors happens.
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
