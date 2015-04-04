!SLIDE

# Command Language

!SLIDE code shell-example

<pre><code><b class='syn-com'>#!/bin/sh
# Usage: hello &lt;name></b>

<b class='syn-name'>name</b>=<b class='syn-str'>"$1"</b>

<b class='syn-shell'>if [ <b class='syn-str'>"$name"</b> = <b class='syn-str'>"world"</b> ]</b>
<b class='syn-shell'>then</b>
    <b class='syn-shell'>echo</b> <b class='syn-str'>"you're so cliché"</b>
<b class='syn-shell'>else</b>
    <b class='syn-shell'>echo</b> <b class='syn-str'>"hello $name"</b>
<b class='syn-shell'>fi</b></pre>

!SLIDE code shell-example

<pre><code><b class='syn-com'>#!/bin/sh
# Usage: hello &lt;name></b>

<b class='syn-name'>name</b>=<b class='syn-str'>"$1"</b>

<b class='syn-shell'>if [ <b class='syn-str'>"$name"</b> = <b class='syn-str'>"world"</b> <span class='syn-hilight'>-a <b class='syn-str'>"$LOGNAME"</b> != <b class='syn-str'>"boss"</b></span> ]</b>
<b class='syn-shell'>then</b>
    <b class='syn-shell'>echo</b> <b class='syn-str'>"you're so cliché"</b>
<b class='syn-shell'>else</b>
    <b class='syn-shell'>echo</b> <b class='syn-str'>"hello $name"</b>
<b class='syn-shell'>fi</b></pre>

!SLIDE code shell-example

<pre><code><b class='syn-com'>#!/bin/sh
# Usage: hello &lt;name></b>

<b class='syn-name'>name</b>=<b class='syn-str'>"$1"</b>

<b class='syn-shell'>if [ <b class='syn-str'>"$name"</b> = <b class='syn-str'>"world"</b> -a <b class='syn-str'>"$LOGNAME"</b> != <b class='syn-str'>"boss"</b> ]<b class='syn-hilight'> ||
   [ <b class='syn-var'>`hostname`</b> = <b class='syn-str'>"mordor"</b> ]</b></b>
<b class='syn-shell'>then</b>
    <b class='syn-shell'>echo</b> <b class='syn-str'>"you're so cliché"</b>
<b class='syn-shell'>else</b>
    <b class='syn-shell'>echo</b> <b class='syn-str'>"hello $name"</b>
<b class='syn-shell'>fi</b></pre>

!SLIDE code shell-example

<pre><code><b class='syn-com'>#!/bin/sh
# Usage: hello &lt;name></b>

<b class='syn-shell'><b class='syn-name'>name</b>=<b class='syn-str'>"$1"</b>

if [ <b class='syn-str'>"$name"</b> = <b class='syn-str'>"world"</b> -a <b class='syn-str'>"$LOGNAME"</b> != <b class='syn-str'>"boss"</b> ] ||
   [ <b class='syn-var'>`hostname`</b> = <b class='syn-str'>"mordor"</b> ]
then
    echo <b class='syn-str'>"you're so cliché"</b>
<span class='syn-hilight'>elif [ -z <b class='syn-str'>"$name"</b> ]
then
    echo <b class='syn-str'>"Usage: hello &lt;name>"</b>
    false</span>
else
    echo <b class='syn-str'>"hello $name"</b>
fi</b></pre>

!SLIDE code shell-example

<pre><code><b class='syn-com'>#!/bin/sh
# Usage: hello &lt;name></b>

<b class='syn-shell'><b class='syn-name'>name</b>=<b class='syn-str'>"$1"</b>

if [ <b class='syn-str'>"$name"</b> = <b class='syn-str'>"world"</b> -a <b class='syn-str'>"$LOGNAME"</b> != <b class='syn-str'>"boss"</b> ] ||
   [ <b class='syn-var'>`hostname`</b> = <b class='syn-str'>"mordor"</b> ]
then
    echo <b class='syn-str'>"you're so cliché"</b>
elif [ -z <b class='syn-str'>"$name"</b> ]<span class='syn-hilight'> &amp;&amp; grep -q <b class='syn-str'>"^$name:"</b> /etc/passwd</span>
then
    echo <b class='syn-str'>"Usage: hello &lt;name>"</b>
    false
else
    echo <b class='syn-str'>"hello $name"</b>
fi</b></pre>

!SLIDE commandline huge

    $ man if
    No manual entry for if

!SLIDE commandline smaller

    $ man if
    BUILTIN(1)                BSD General Commands Manual               BUILTIN(1)

    NAME
         builtin, !, %, ., :, @, {, }, alias, alloc, bg, bind, bindkey, break,
         breaksw, builtins, case, cd, chdir, command, complete, continue, default,
         dirs, do, done, echo, echotc, elif, else, end, endif, endsw, esac, eval,
         exec, exit, export, false, fc, fg, filetest, fi, for, foreach, getopts,
         glob, goto, hash, hashstat, history, hup, if, jobid, jobs, kill, limit,
         local, log, login, logout, ls-F, nice, nohup, notify, onintr, popd,
         printenv, pushd, pwd, read, readonly, rehash, repeat, return, sched, set,
         setenv, settc, setty, setvar, shift, source, stop, suspend, switch,
         telltc, test, then, time, times, trap, true, type, ulimit, umask,
         unalias, uncomplete, unhash, unlimit, unset, unsetenv, until, wait,
         where, which, while -- shell built-in commands

    SYNOPSIS
         builtin [-options] [args ...]

    DESCRIPTION
         Shell builtin commands are commands that can be executed within the run-
         ning shell's process.  Note that, in the case of csh(1) builtin commands,
         the command is executed in a subshell if it occurs as any component of a
         pipeline except the last.

         If a command specified to the shell contains a slash ``/'', the shell
         will not execute a builtin command, even if the last component of the
         specified command matches the name of a builtin command.  Thus, while
         specifying ``echo'' causes a builtin command to be executed under shells
         that support the echo builtin command, specifying ``/bin/echo'' or
         ``./echo'' does not.

         While some builtin commands may exist in more than one shell, their oper-
         ation may be different under each shell which supports them.  Below is a
         table which lists shell builtin commands, the standard shells that sup-
         port them and whether they exist as standalone utilities.

         ...

!SLIDE commandline smaller

    $ help if
    if: if COMMANDS; then COMMANDS;
        [ elif COMMANDS; then COMMANDS; ]...
        [ else COMMANDS; ]
        fi

        The `if COMMANDS' list is executed.  If its exit status is zero, then the
        `then COMMANDS' list is executed.  Otherwise, each `elif COMMANDS' list is
        executed in turn, and if its exit status is zero, the corresponding
        `then COMMANDS' list is executed and the if command completes.  Otherwise,
        the `else COMMANDS' list is executed, if present.  The exit status of the
        entire construct is the exit status of the last command executed, or zero
        if no condition tested true.

!SLIDE commandline

    $ man [
    TEST(1)      BSD General Commands Manual     TEST(1)

    NAME
         test, [ -- condition evaluation utility

    SYNOPSIS
         test expression
         [ expression ]

    DESCRIPTION
         The test utility evaluates the expression and, if it
         evaluates to true, returns a zero (true) exit status;
         otherwise it returns 1 (false).  If there is no
         expression, test also returns 1 (false).

         All operators and flags are separate arguments to the
         test utility.

         The following primaries are used to construct expres-
         sions:
    ...

!SLIDE commandline huge

    $ which [
    /bin/[

!SLIDE commandline big

    $ ls -l /bin/[
    -r-xr-xr-x  2 root  62K May 18  2009 /bin/[

!SLIDE commandline bigger
.notes on mac

    $ diff -s /bin/[ /bin/test
    Files /bin/[ and /bin/test are identical

!SLIDE commandline bigger
.notes TODO make incremental
.notes exit status
.notes /bin/[ just for fun

    $ test 1 = 1
    $ echo $?
    0

    $ test 1 = 0
    $ echo $?
    1

    $ /bin/[ 1 = 0
    $ echo $?
    1

!SLIDE code shell-example

<pre><code><b class='syn-com'>#!/bin/sh
# Usage: hello &lt;name></b>

<b class='syn-shell'><b class='syn-name'>name</b>=<b class='syn-str'>"$1"</b>

if test <b class='syn-str'>"$name"</b> = <b class='syn-str'>"world"</b> -a <b class='syn-str'>"$LOGNAME"</b> != <b class='syn-str'>"boss"</b> ||
   test <b class='syn-var'>`hostname`</b> = <b class='syn-str'>"mordor"</b>
then
    echo <b class='syn-str'>"you're so cliché"</b>
elif test -z <b class='syn-str'>"$name"</b> &amp;&amp; grep -q <b class='syn-str'>"^$name:"</b> /etc/passwd
then
    echo <b class='syn-str'>"Usage: hello &lt;name>"</b>
    false
else
    echo <b class='syn-str'>"hello $name"</b>
fi</b></pre>

!SLIDE code shell-example

<pre><code><b class='syn-com'>#!/bin/sh
# Usage: hello &lt;name></b>

<b class='syn-shell'><b class='syn-hilight'>name="$1"</b>

<b class='syn-hilight'>if</b> test "$name" = "world" -a "$LOGNAME" != "boss" <b class='syn-hilight'>||</b>
   test `hostname` = "mordor"
<b class='syn-hilight'>then</b>
    echo "you're so cliché"
<b class='syn-hilight'>elif</b> test -z "$name" <b class='syn-hilight'>&amp;&amp;</b> grep -q "^$name:" /etc/passwd
<b class='syn-hilight'>then</b>
    echo "Usage: hello &lt;name>"
    false
<b class='syn-hilight'>else</b>
    echo "hello $name"
<b class='syn-hilight'>fi</b></b></pre>

!SLIDE code shell-example

<pre><code><b class='syn-com'>#!/bin/sh
# Usage: hello &lt;name></b>

<b class='syn-shell'>name="$1"

if <b class='syn-hilight'>test "$name" = "world" -a "$LOGNAME" != "boss"</b> ||
   <b class='syn-hilight'>test `hostname` = "mordor"</b>
then
    <b class='syn-hilight'>echo "you're so cliché"</b>
elif <b class='syn-hilight'>test -z "$name"</b> &amp;&amp; <b class='syn-hilight'>grep -q "^$name:" /etc/passwd</b>
then
    <b class='syn-hilight'>echo "Usage: hello &lt;name>"</b>
    <b class='syn-hilight'>false</b>
else
    <b class='syn-hilight'>echo "hello $name"</b>
fi</b></pre>

!SLIDE code big

    while true
    do
        echo "boom"
        sleep 1
    done

!SLIDE commandline huge

    $ which true
    /bin/true

!SLIDE commandline huge

    $ which false
    /bin/false

!SLIDE code big

    while /bin/true
    do
        echo "boom"
        sleep 1
    done

!SLIDE code big

    while [ $# -gt 0 ]
    do
        echo "$1"
        shift
    done

!SLIDE code big

    while test $# -gt 0
    do
        echo "$1"
        shift
    done

!SLIDE bullets incremental

# Special Purpose Language

* Fundamental Abstraction: The Command
* Builtins
* External Programs
* Functions
* Aliases
