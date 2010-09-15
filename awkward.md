AWK-ward Ruby
=============

Ruby, like most successful languages, was assembled from pieces of things that
came before it: Smalltalk's consistent object system, Perl's practical syntax,
UNIX's sensibilities. Not that it didn't bring entirely new innovations (block
syntax!) of its own, but it's amazing to consider how much of Ruby's design
rests on the elegant packaging of old concepts into a new coherent whole.

There's something less obvious but perhaps more essential that Ruby borrowed:
the very concept of blatant, unashamed borrowing. In his 1999 talk, [*Perl, the
first postmodern computer language*][1], Larry Wall states plainly that Perl was
built mostly from things that "didn't suck" in the languages that preceded it:

> When I started designing Perl, I explicitly set out to deconstruct all the
> computer languages I knew and recombine or reconstruct them in a different way,
> because there were many things I liked about other languages, and many things I
> disliked. I lovingly reused features from many languages. (I suppose a Modernist
> would say I stole the features, since Modernists are hung up about originality.)
> Whatever the verb you choose, I've done it over the course of the years from C,
> sh, csh, grep, sed, awk, Fortran, COBOL, PL/I, BASIC-PLUS, SNOBOL, Lisp, Ada,
> C++, and Python. To name a few. To the extent that Perl rules rather than sucks,
> it's because the various features of these languages ruled rather than sucked.

[1]: http://www.perl.com/pub/1999/03/pm.html

Ruby, the story goes, borrowed much from Perl: integral regular expressions,
statement modifiers (`do_this if that`), array/hash literals, funny global
variable names, and of course the philosophy of having more than one way to do
the same thing (TMTOWTDI).

Or did it?

If these features didn't originate with Perl, as Wall seems to imply, then where
did they come from?

One of the most important influences on Perl's design was AWK. So much so that
Perl was sometimes described as a semantic superset of AWK. Are the relics of
AWK still present in Ruby? Let's see.

Today, AWK is probably best known as a versatile tool for extracting fields from
delimited flat files in a shell pipeline:

    cat /etc/passwd | awk -F: '{ print $1 }'

It's rare to see AWK used for more complex problems in modern systems, but
there's actually a full blown programming language lurking beneath the surface.
It was at one time used to solve a lot of the same problems people commonly use
Ruby, Perl, or Python to solve today.

You might find some of AWK's language features familiar:

 * Associative array type.
 * Automatic string, integer, and floating point value types.
 * C-style `if`, `while`, and `do` constructs.
 * For-each style `for` construct for iterating over associative arrays.
 * Arithmetic (`+`, `-`, `*`, `/`), modulu-division (`%`), exponentiation (`^`),
   increment/decrement (`++`, `--`), and assignment shorthand (`+=`, `-=`, `*=`, ...)
   operators.
 * Array membership operator (`expr in array`).
 * Integral regular expression type and matching operators (`str ~ /pattern/`).
 * Comprehensive builtin function library (a small sample: `printf`, `gsub`,
   `split`, `substr`, `cos`, `sin`, `log`, `sqrt`).
 * User defined functions.

Not bad for 1977.

It would seem that a large portion of Ruby's basic syntax and semantics were
present in AWK. So how did Perl come to dominant the problem space? There must
be something very *different* about AWK.

While AWK had much of the primitive syntax right, it also overcompensated for a
specific case: processing streams of delimited text. The top-level context is
used exclusively for declaring one or more matching statements:

    pattern { action }
    ...

Here, `pattern` is a full blown expression and `action` is a block of code
executed when `pattern` evaluates truthfully. The `pattern` is tested for each
line (or record) of input and `action` is executed when `pattern` returns
truthfully.  Omitting the `pattern` causes the action to be executed for every
line.

There's special patterns for setting actions up to run before the first line of
input is read and after all lines have been processed. Here's an example that
uses the special `BEGIN` pattern along with a regular expression match. It
prints all the usernames from `/etc/passwd` while avoiding comment lines:

    cat /etc/passwd |
    awk '
        BEGIN     { FS = ":" }
        /^[a-z_]/ { print $1 }
    '

(NOTE: You can paste bomb that into your shell on just about any UNIX system.)

Here's a more complex example that shows off some of AWK's advanced features,
like associative arrays and for-in syntax. It calculates word frequencies from
the text of Jonathan Swift's, *A Modest Proposal*:

    curl -s http://www.gutenberg.org/files/1080/1080.txt |
    awk '
        BEGIN { FS="[^a-zA-Z]+" }

        {
            for (i=1; i<=NF; i++) {
                word = tolower($i)
                words[word]++
            }
        }

        END {
            for (w in words)
                 printf("%3d %s\n", words[w], w)
        }
    ' |
    sort -rn

It may seem strange, but this style of programming was very common in UNIX's
hayday. Instead of programs being dominated by a single language like Perl or
Ruby, you'd build pipelines that combined standard utilities (like `sort` shown
above), sprinkle in bits and pieces of AWK as needed, and drop down to C when
performance was critical.

Perl took the guts of AWK and left behind the mandatory pattern matching at the
top-level. That simple design change turned what was a special purpose language
for processing delimited text streams into what we know today as a *general
purpose scripting language*.

But that's not the end of the story.

It was important that Perl be able to act as a replacement for AWK in all its
capacities, including within shell pipelines. This meant having the ability to
run `perl` in a kind of top-level AWK mode. Ruby borrowed this capability from
Perl, making it possible to use Ruby for the same style of programming
facilitated by AWK, complete with `BEGIN` and `END` blocks!

Here's the word frequency script in AWK-ish Ruby:

    curl -s http://www.gutenberg.org/files/1080/1080.txt |
    ruby -ne '
      BEGIN { $words = Hash.new(0) }

      $_.split(/[^a-zA-Z]+/).each { |word| $words[word.downcase] += 1 }

      END {
        $words.each { |word, i| printf "%3d %s\n", i, word }
      }
    ' |
    sort -rn

The `-n` argument causes Ruby to assume a `while gets(); ... end` loop around
the provided script. `$_` is set to the last line read and the `BEGIN` and `END`
blocks function exactly as they did in AWK.
