!SLIDE center

<img src="leave.png" style="width:1024px">

!SLIDE

# Template Script

!SLIDE code small

    @@@sh
    #!/bin/sh
    #/ Usage: your-great-program [-o <optional>] <mandatory>
    #/ A single-sentence description of your great program.
    set -e

    # show program usage
    if [ $# -eq 0 -o "$1" = "--help" ]
    then
        grep '^#/' <"$0" |
        cut -c4-
        exit 2
    fi

    # your great code

!SLIDE

# Use `&&` and `||` instead of `if`

!SLIDE code

    @@@sh
    # instead of:
    if [ $# -eq 0 -o "$1" = "--help" ]
    then
        grep '^#/' <"$0" |
        cut -c4-
        exit 2
    fi

    # try this:
    test $# -eq 0 -o "$1" = "--help" && {
        grep '^#/' <"$0" |
        cut -c4-
        exit 2
    }

