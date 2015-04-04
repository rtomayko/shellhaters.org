!SLIDE

# Building Pipelines

!SLIDE terminal commandline

    $ url="http://www.gutenberg.org/files/1080/1080.txt"

!SLIDE terminal commandline

    $ curl -s "$url"
    The Project Gutenberg EBook of A Modest Proposal, by Jonathan Swift

    Title: A Modest Proposal
           For preventing the children of poor people in Ireland,
           from being a burden on their parents or country, and for
           making them beneficial to the publick - 1729

    Author: Jonathan Swift

    Posting Date: July 27, 2008 [EBook #1080]
    Release Date: October 1997

    Language: English

    A MODEST PROPOSAL

    For preventing the children of poor people in Ireland, from being a
    burden on their parents or country, and for making them beneficial to
    the publick.

    ...

!SLIDE terminal commandline

    $ curl -s "$url" |tr -c "A-Za-z" '\n'
    The
    Project
    Gutenberg
    EBook
    of
    A
    Modest
    Proposal

    by
    Jonathan
    Swift

    Title


    A
    Modest
    Proposal
    For
    preventing

!SLIDE terminal commandline

    $ curl -s "$url" |tr -c "A-Za-z" '\n' |grep -v '^$'
    The
    Project
    Gutenberg
    EBook
    of
    A
    Modest
    Proposal
    by
    Jonathan
    Swift
    Title
    A
    Modest
    Proposal
    For
    preventing

!SLIDE huge

# Control-X-E

!SLIDE terminal vim

    curl -s "$url" |tr -c "A-Za-z" '\n' |grep -v '^$'

!SLIDE terminal vim

    curl -s "$url"      |
    tr -c "A-Za-z" '\n' |
    grep -v '^$'        |
    sort

!SLIDE terminal commandline

    $ curl -s "$url" |tr -c "A-Za-z" '\n' |grep -v '^$' |sort
    A
    A
    A
    A
    A
    A
    A
    A
    A
    ACTUAL
    AGREE
    AGREE
    AGREEMENT
    AK
    AND
    ANY
    ANY
    ANY
    ANYTHING
    AS
    ASCII
    ASCII
    ASCII
    About
    Additional
    After
    American
    American
    An
    An
    And

!SLIDE terminal vim

    curl -s "$url"      |
    tr -c "A-Za-z" '\n' |
    grep -v '^$'        |
    sort                |
    uniq -c

!SLIDE terminal commandline

    $ curl -s "$url" |tr -c "A-Za-z" '\n' |grep -v '^$' |sort |uniq -c
       9 A
       1 ACTUAL
       2 AGREE
       1 AGREEMENT
       1 AK
       1 AND
       3 ANY
       1 ANYTHING
       1 AS
       3 ASCII
       1 About
       1 Additional
       1 After
       2 American
       2 An
       5 And
       2 Anonymous
       1 Any
      13 Archive
       4 As
       1 Author
       2 B
       1 BE
       1 BEFORE
       2 BREACH
       1 BUT
       1 Barbadoes
       7 But

!SLIDE terminal vim

    curl -s "$url"      |
    tr -c "A-Za-z" '\n' |
    grep -v '^$'        |
    sort                |
    uniq -c             |
    sort -rn

!SLIDE terminal commandline

    $ curl -s "$url" |tr -c "A-Za-z" '\n' |grep -v '^$' |sort |uniq -c |sort -rn
     327 the
     237 of
     182 to
     178 and
     141 a
     126 in
     107 or
      83 Project
      83 Gutenberg
      69 be
      63 for
      60 this
      58 with
      57 tm
      55 by
      55 I
      52 you
      51 that
      50 work
      47 is
      45 as
      43 at
      42 will
      41 are
      40 any
      38 their
      36 it

!SLIDE terminal vim

    #!/bin/sh
    # Usage: wordfreq <url>
    # Show top 25 words in document at <url>.

    url="$1"

    curl -s "$url"      |
    tr -c "A-Za-z" '\n' |
    grep -v '^$'        |
    sort                |
    uniq -c             |
    sort -rn            |
    head -25
