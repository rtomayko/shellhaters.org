---
layout: book
---


## Chapter 01: Learning and Reference Material

### The Shell Language

The hands down best place to learn the minimal subset of shell language required
to write reliable programs is:

**[IEEE Std 1003.1 / Chapter 2. Shell Command Language](http://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html)**

The basic language syntax and core constructs are described in under 20 printed
pages. It's worth reading top to bottom if only for the epiphany that shell
is simple and sensible at its core.

It is an undeniable fact that this conclusion and level of understanding is
impossible to reach by working backward from example code in the wild and
attempting to reason out syntax rules. In fact, learning only by reading code
and extrapolating from knowledge of other languages will lead very quickly to a
great many false assumptions.

The classic example of this phenomenon is found in the common `if` construct.
Consider a typical conditional that checks if the first program argument is
`"--hello"`:

``` bash
if [ "$1" = "--hello" ]; then
    echo "hello"
fi
```

An experienced programmer but newcomer to shell programming may quite reasonably
conclude that the shell *language* includes expression evaluation and that
expressions in `if` statements must be enclosed in square brackets (`[]`).

Upon further reading, you may come across a conditional with slightly different
form:

``` bash
if echo "$1" | grep -q "--world"; then
    echo "world"
fi
```

Are the square brackets optional? Were they left off for pure style reasons?
Perhaps pipelines in conditionals are special in some way ...

``` bash
if [ $(expr 1 + 1) -eq 2 ]; then
    echo "OMG"
fi
```

Okay, what in the world is going on here? Is the language some kind of sick
joke?

All I can say is, [RTFM](http://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html).
It includes clear, easy to understand, and reasonable explanations for why basic
syntax at first appears to manifest with seemingly infinite variation.

### The Shell Utilities / Commands

It may seem as though there are many thousands of adhoc commands in every
Unix-like operating system, all included willy-nilly with little to distinguish
between them. How do you know which commands exist and behave similarly on both
GNU/Linux and MacOS X? Where do I even start diving into commands that are used
most frequently?

A key to becoming truly productive in shell is the realization that there is a
small and well defined set of core commands, with which and using no more you
can accomplish a great deal. Think of it as the core or standard library in
other languages.

The best source of documentation for the standard shell utilities is, again, 
included in [IEEE Std 1003.1](http://pubs.opengroup.org/onlinepubs/9699919799/utilities/).
However, I recommend starting at the following

**[The POSIX Shell and Utilities Quick Index](../)**

It's important to note that this is *not* limited to the set of "shell builtins"
(although they are included). The standard shell utilities are a much fuller
suite of commands that include support for text processing, file manipulation,
process management, data compression, and network communication.

### Man pages

All contemporary Unix-like environments should include extensive documentation,
available via `man(1)`:

    $ man find

Man pages have the benefit of including additional documentation on
platform-specific features, known implementation bugs, and can sometimes provide
clarity beyond that provided in the IEEE standard. That said, I highly recommend
using the IEEE reference *first*. It's minimalist, often more thorough, and
includes *good* example usage. Most importantly, anything specified in the IEEE
standard
