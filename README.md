# What is this?

Tools for efficient competitive programming in golang.

Create a solution for problem A (folder workspace/A):
```
./create A
```

This will set the `Problem` variable to to `"A"` in `./config`.

Run your solution for problem A with case 0 (workspace/A/0.in):
```
./run 0
```
Note that you do not need to specify the problem since the `Problem` variable is already set in `./config` from the previus `./create A` call.

To add a new test case for problem A run:
```
./add_case
```

## Contributing

Make sure all scripts pass shellcheck:
https://www.shellcheck.net/

Documentation for shell:
https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html
https://github.com/dylanaraps/pure-sh-bible
