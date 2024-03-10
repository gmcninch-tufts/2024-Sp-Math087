---
author: George McNinch
title: |
 Final Project Recommendations
date: 2024-03-09
---

# Examples of modeling problems

It might be useful to look at sample "modeling problems" for
inspiration. Here are some problems which appeared in Mathematical Contest in Modeling ( "COMAP")

In both cases, there are *a lot* more problems than I've linked
here. (I included some precise links e.g. because I found navigating
this site a bit clunky and I wanted you to see some samples quickly).
  

- [COMAP problems](https://www.contest.comap.com/undergraduate/contests/mcm/previous-contests.php)
  
  You should be able to see the *problems* here, though apparently you
  can't see the submissions & judges comments without a membership.
  
  Here are some randomly chosen examples of problems.
  - ['23 - drought stricken plant communities](https://www.mathmodels.org/Problems/2023/MCM-A/2023_MCM_Problem_A.pdf)
  - ['23 - Masai Mara](https://www.mathmodels.org/Problems/2023/MCM-B/2023_MCM_Problem_B.pdf)
  - ['23 - sailboats](https://www.mathmodels.org/Problems/2023/MCM-Y/2023_MCM%20_Problem_Y.pdf)
  - ['22 - cyclists' power profile](https://www.mathmodels.org/Problems/2022/MCM-A/2022_MCM_Problem_A.pdf)
  - ['22 - hydro-electric sharing](https://www.mathmodels.org/Problems/2022/MCM-B/2022_MCM_Problem_B.pdf)

Of course, these problems don't point you to the *literature* that may exist on these problems.


# Report samples 

  (this example should more-or-less match the given specifications, except that it is 10 pages rather than 8)

  - [proposal sample](/course-assets/samples/FinalProposal_Sample.pdf)
  
  - [report sample](/course-assets/samples/FinalReport_Sample.pdf)


# Including graphical images in your report

If you produce your report using `LaTeX` (recommended!) the following example shows how
to include graphical images:

  - [[latex example with graphics]](/course-assets/latex-examples/graphic-example.tex)
	[[graphic]](/course-assets/latex-examples/graph-example.png)
	[[pdf]](/course-assets/latex-examples/graphic-example.pdf)

The main point here is that you need to use the `graphicx` package

``` latex
\usepackage{graphicx, color}
```

and that the command

```latex
  \includegraphics[scale=.5]{graph-example}
```
displays the graphic found in the file named `graph-example.png` (or `graph-example.jpg` or...)

The `[pdf]` link shows the output. To use this yourself, you'll need
to save the `latex` file as well as the `png` graphic file. You can
read a bit more
[here](https://www.overleaf.com/learn/latex/Inserting_Images) about
how to use this in overleaf. You'll need to *upload* the file
`graph-example.png` to Overleaf...

# Video recommendations

- The *simplest* way to make the required video for the final project
  is to film yourself speaking while writing on a whiteboard or
  chalkboard.

- A better method is to use video-editing software which will allow
  you to narrate your talk while displaying *slides* which you might
  produce in `LaTeX` using the package `beamer`.
  
  Try *googling* (or searching on `youtube`) for something like:
  
  `presentations using latex and beamer`
  
  - Example of video-editing software: [`openshot`](https://www.openshot.org/)

  - discussion of `beamer` at the `overleaf` site: [`beamer`](https://www.overleaf.com/learn/latex/Beamer)
  
  - using these tools will make it easier to *visually demonstrate
    some aspect of mathematics involved in your report*
  
  - here is an example of some beamer slides:
  
    [[latex]](/course-assets/latex-examples/beamer-example.tex)
	[[graph]](/course-assets/latex-examples/graph-example.png)
	[[pdf]](/course-assets/latex-examples/beamer-example.pdf)

    This example includes an illustration of how to include *images* in a latex file.
	In order to use this example, you'll need to save both the `LaTeX`
	file and the graphical `png` file.

    The `[pdf]` link shows the output. To use this yourself, you'll need
	to save the `latex` file as well as the `png` graphic file. You can
	read a bit more
	[here](https://www.overleaf.com/learn/latex/Inserting_Images) about
	how to use this in overleaf. You'll need to *upload* the file
	`graph-example.png` to Overleaf...
