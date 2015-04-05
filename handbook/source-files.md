---
layout: book
---

## Chapter 3: Program source files

``` bash
$ cat > hello-world <<EOF
#!/bin/sh
set -e
echo "hello world"
EOF
$ chmod +x hello-world
$ ./hello-world
hello world
```

 - Shell program filenames should be lowercase with words separated by dashes not underscores. "great-program", not "great_program".
 - No file extension.
 - Executable.



### Shebang

### Usage Messages

### Template

``` bash
#!/bin/sh
#/ Usage: hello-world [-fx] [-o <val>] <arg>...
#/ Write hello message to standard output for each <arg>.
#/
#/ Options:
#/   -f                 Optional boolean "flag" style argument.
#/   -x                 Another optional boolean style argument.
#/   -o <val>           Optional argument with value.
set -e

# show usage message
if [ "$1" = "--help" ]; then
    grep ^#/ <"$0" |cut -c4-
    exit
fi

# main program logic
for arg in "$@"; do
    echo "hello $arg"
done
```

