---
layout: book
---

## Chapter 06. Practical Idioms

- Relative Path Locations
- Environment Defaults
- Config Files
- Testing for commands

### Relative Path Locations

It's often useful to find paths relative to the currently executing program. For instance, you may have a project structure where shell programs are under "bin"

```
project_root="$(cd $(dirname "$0")/.. && pwd)"
```

### Environment Defaults

```
: ${PROG_CONFIG:="/etc/prog.conf"}
```

### Config files

Many programming languages require special config file formats and include libraries for loading and parsing.

``` bash
$ cat /etc/prog.conf
# override hostname and port
PROG_HOSTNAME="shellhaters.org"
PROG_PORT=4269
```

``` bash
#!/bin/sh
set -e

# default config values
PROG_HOSTNAME=example.com
PROG_PORT=80

# config file location
: ${PROG_CONFIG:="/etc/prog.conf"}
. "$PROG_CONFIG"

# dump config vars from environment
env | grep ^PROG_
```

This means that config files can use full shell capabilities to, e.g., load config from external sources or configure conditionally.

### Testing for commands

The `which(1)` program included in many modern operations systems is non-POSIX and notorious for behaving differently depending. Shell programs should use the POSIX specified `command(1)` instead.

Example: Check if a command exists without invocation:

``` bash
if ! command -v rsync >/dev/null 2>&1; then
    echo "error: rsync not found." 1>&2
fi
```

Example: Find the first available in a list of alternative command implementations:

``` bash
CC=
for comm in clang gcc cc; do
    if command -v "$comm"; then
        CC=$comm
        break
    fi
done
```

