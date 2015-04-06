---
layout: book
---

## Introduction

### Background

Unix Shell Programming in 2015 is a terrible, antiquated, perplexing, gross, and
*unmatched extraordinarily powerful* programming environment. Truly. You'll find
no better, more practical alternative for the problems shell programming solves
well, problems that remain prevalent in many areas of contemporary software
development nearly 40 years after being introduced.

But shell programming has gotten a bum rap over the decades, and perhaps
deservedly so. It has more than its fair share of landmines, there are over
ten-thousand known incompatible language interpreters, it has *the worst* case
of feature creep, there's a whole internet full of example code propagating
awful practices, and experienced programmers have a strange innate urge to
needlessly push shell far past its natural limits. In short, it's really easy to
fuck up, and that counts as much for experienced programmers as for beginners,
possibly even more so.

A *"Shell Hater"* is the label given to programmers who &mdash; despite knowing
all its flaws and reputation as a "not real" language &mdash; are completely and
utterly incapable of coping in the real world without the pervasive use and
writing of shell programs. They are crazed addicts and they are dangerous.  Out
of basic necessity, these programmers have been forced to develop a set of rules
and mechanisms for taming shell's wild side and have learned to live with the
disorder, mostly.

Over the past decade, I've been in the unfortunate occasional close quarters
with these programmers for extended periods of time and fear I've contracted the
disease. It's strange to admit out here in the open due to the stigma associated
with these people and their practices, but I've found strength in the idea that
talking about it might make it easier for the *the next programmer* faced with
this strange affliction.

This is *The Shell Hater's Handbook*. Part style guide, part field manual, part
way of life, it is the product of many hard-learned lessons in real world shell
hacking stolen from programmers who are smarter than you or I. The goal of the
handbook is to provide a set of guidelines for achieving simple, reliable,
portable, and fast programs by cataloging the good stuff and avoiding as much of
the bad stuff as possible. I hope you like it.

### Axioms

This handbook is unlike most documentation and tutorials on shell programming
you will find elsewhere on the internet or in book stores.

 1. **Simplicity and minimalism over advanced features.** The goal of this
    handbook is to provide a minimal practical shell programming subset rooted
    in real world problem solving. We eschew superflous syntax and features that
    offer little practical benefit as they come with enormous cost in cognitive
    overhead. There is no problem that shell is suitable for solving that cannot
    be accomplished elegantly with this subset, however.

 2. **Practicality over religion.** Check your obsession with POSIX purity at
    the door. If you love GNU/Bash's advanced featureset, you've also come to
    the wrong place. We're here to get work done. In most cases it's
    advantageous to stick with POSIX, and some 95% or more of this handbook
    keeps tightly to that path, but we'll also diverge where there's a
    significant gain in practicality.

 3. **Portability.** Wherever possible, shell programs should avoid features not
    supported by a wide range of operating system environments. It's possible to
    write programs that run on GNU/Linux, MacOS X, BSDs, Microsoft Windows, and
    even specialized environments like [BusyBox](http://www.busybox.net/).
    There's also still a surprisingly large number of Sun, HP, IBM UX, and other
    early Unix out there doing boring things like mass storage, scientific ...
    Stick to the basics and your shit will run everywhere with only a little
    extra work.

### Subset

 - POSIX shell (IEEE Std 1003.1) as baseline. Primary rationale: It's a small,
   simple, and predictable subset of shell capable of achieving most tasks.
   Secondary rationale: it's well specified and widely supported on everything
   from GNU/Linux, BSDs, MacOS X, and even Microsoft Windows. Note that
   simplicity and predictable trump sheer portability in our thinking. Sticking
   to POSIX wherever possible is beneficial even if you're targeting a specific
   Unix environment.

 - Layer a small bit of non-POSIX specified but practical and reliable stuff on
   top. Things like 

