!SLIDE

# Command Language

!SLIDE code small

    #!/bin/sh
    # Usage: hello <name>

    name="$1"

    if [ "$name" = "world" ]
    then
      echo "you're so cliché"
    else
      echo "hello $name"
    fi

!SLIDE code small

    #!/bin/sh
    # Usage: hello <name>

    name="$1"

    if [ "$name" = "world" -a "$LOGNAME" != "boss" ]
    then
      echo "you're so cliché"
    else
      echo "hello $name"
    fi

!SLIDE code small

    #!/bin/sh
    # Usage: hello <name>

    name="$1"

    if [ "$name" = "world" -a "$LOGNAME" != "boss" ] ||
       [ `hostname` = "mordor" ]
    then
      echo "you're so cliché"
    else
      echo "hello $name"
    fi

!SLIDE code small

    #!/bin/sh
    # Usage: hello <name>

    name="$1"

    if [ "$name" = "world" -a "$LOGNAME" != "boss" ] ||
       [ `hostname` = "mordor" ]
    then
      echo "you're so cliché"
    elif [ -z "$name" ]
      echo "Usage: hello <name>"
      false
    else
      echo "hello $name"
    fi

!SLIDE code small

    #!/bin/sh
    # Usage: hello <name>

    name="$1"

    if [ "$name" = "world" -a "$LOGNAME" != "boss" ] ||
       [ `hostname` = "mordor" ]
    then
      echo "you're so cliché"
    elif [ -z "$name" ] && grep -q "^$name:" /etc/passwd
      echo "Usage: hello <name>"
      false
    else
      echo "hello $name"
    fi

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

    $ diff -s /bin/[ /bin/test
    Files /bin/[ and /bin/test are identical

!SLIDE commandline big

    $ uname
    Linux

    $ which [
    /usr/bin/[

    $ ls -l /usr/bin/[
    -rwxr-xr-x 1 root 39K 2008-04-04 07:58 /usr/bin/[

    $ diff -s /usr/bin/[ /usr/bin/test
    Binary files /usr/bin/[ and /usr/bin/test differ

!SLIDE commandline

    $ test 1 = 0
    $ echo $?
    0

    $ /bin/[ 1 = 0
    $ echo $?
    0

!SLIDE smaller commandline


    $ man test
    TEST(1)                   BSD General Commands Manual                  TEST(1)

    NAME
         test, [ -- condition evaluation utility

    SYNOPSIS
         test expression
         [ expression ]

    DESCRIPTION
         The test utility evaluates the expression and, if it evaluates to true,
         returns a zero (true) exit status; otherwise it returns 1 (false).  If
         there is no expression, test also returns 1 (false).

!SLIDE code small

    #!/bin/sh
    # Usage: hello <name>

    name="$1"

    if test "$name" = "world" -a "$LOGNAME" != "boss" ||
       test `hostname` = "mordor"
    then
      echo "you're so cliché"
    elif test -z "$name" && grep -q "^$name:" /etc/passwd
      echo "Usage: hello <name>"
      false
    else
      echo "hello $name"
    fi
