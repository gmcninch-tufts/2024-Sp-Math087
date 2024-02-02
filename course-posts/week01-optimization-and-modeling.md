---
title: "Week01 -- Optimization and modeling: overview"
date: 2024-01-11
---

In the first week (well, really just the one day...) we discuss
*single-variable optimization problems*.

This week's homework assignment is 

- [**[problem set 1]**](/course-assignments/PS01--2024-01-29.html) [[pdf]](/course-assignments/PS01--2024-01-29.pdf)
- [**[problem set 1 solutions]**](/course-assignments/PS01--2024-01-29--solutions.html)


It is due 2024-01-29 on `gradescope` (you can also get the
assignment on `gradescope`).

There are three associated `jupyter notebooks`. There are three ways
to interact with this material: you can **[View]** the contents of the
notebooks as a (non-interactive) web page, you can view the notebook
**[via colab]**, or you can **[download]** the `ipynb` file for use
with `jupyter` running on your computer. The latter two choices permit
you to edit and execute code; for more information, see the
[course-resource discussion about `jupyter
notebooks`](/course-posts/resources--python-and-jupyter.html).

- **jupyter demo** [[via colab]](https://colab.research.google.com/github/gmcninch-tufts/2024-Sp-Math087/blob/main/course-content/week01-00--demo-notebook.ipynb) 
   [[download notebook]](/course-content/week01-00--demo-notebook.ipynb) 
   [[pdf]](/course-content/week01-00--demo-notebook.pdf) 

- **single-variable optimization** 
  [[via colab]](https://colab.research.google.com/github/gmcninch-tufts/2024-Sp-Math087/blob/main/course-content/week01-01--optimization.ipynb)
  [[download notebook]](/course-content/week01-01--optimization.ipynb) 
  [[pdf]](/course-content/week01-01--optimization.pdf)   

- **optimization & derivatives**
  [[via colab]](https://colab.research.google.com/github/gmcninch-tufts/2024-Sp-Math087/blob/main/course-content/week01-02--optimization-and-derivatives.ipynb)
  [[download notebook]](/course-content/week01-02--optimization-and-derivatives.ipynb)
  [[pdf]](/course-content/week01-02--optimization-and-derivatives.pdf)  



# Optimization Overview

Optimization is the most common application of mathematics. Here are
some “real-world” examples:

-   **Business optimization**. A business manager attempts to understand
    and control parameters in order to maximize profit and minimize
    costs.

-   **Natural resource management**. Control harvest rates to maximize
    long-term yield, while conserving resources.

-   **Environmental regulation**. Governments sets standards to minimize
    environmental costs, while maximizing production of goods.

-   **IT management**. Computer system managers try to maximize
    throughput and minimize delays.

-   **Pharmaceutical optimization**. Doctors and pharmacists regulate
    drugs to minimize harmful side effects and maximize healing.

------

In this first part of our modeling course, we are going to discuss some
sorts of optimization problems and related matters:

-   *single variable optimization* and *sensitivity analysis*

-   *multivariable optimization*

-   *multivariable optimization with constraints*


We begin this week with a discussion of *single variable
optimization*.

# Single Variable Optimization

- In this first section of our modeling class, we examine a few
  *single variable* optimization problems. In some sense, these amount
  to -- perhaps complicated examples of! -- *word problems* that you
  might have met in Calculus I (differential calculus).

The procedure to carry out a calculus based solution can then be
described roughly as follows:

-   find the function $f(x)$ that measures the quantity that you desire
    to optimize, and the relevant interval $[a,b]$ of values of
    independent variable $x$.
	
-   find the critical points $c_1,c_2,\dots,c_N$ of $f$ in the interval
    $(a,b)$.
	
-   if $f$ is a *differentiable* function, the maximum and minimum value of
    $f$ will be found in the list $f(a),f(c_1),\dots,f(c_N),f(b)$;
    remember that you must check the endpoints $a,b$!


# Some remarks on modeling, in general

Here are some guidelines to follow when attempting to model a problem mathematically:

1.  Ask the question:
    -   The question should be phrased using correct mathematics; this
        will help make clear what must be found.
    -   Make a list of all the variables and constants; include units as
        appropriate.
    -   State all assumptions about these variables and constants;
        include equations and inequalities.
    -   Check units to make sure things make sense.
    -   State your objective in mathematical terms (i.e., the *oil
        spill* problem this week is a “minimization problem”).
    -   It may even be useful to make an educated guess at this point on
        what the answer should be. 
		

2.  Select the modeling approach.
    -   Choose a general solution procedure to solve the mathematical
        problem (in our case first and second derivative tests).
    -   This might be the most difficult part and to a large extent
        depends on just good experience. That’s our goal…to get some
        experience.  
		

3.  Formulate the model.
    -   Restate the question in terms of your model (in our example,
        what function are we taking the derivative of?).
    -   You may need to relabel or redefine things to make it work. This
        is where the mathematical model and real physical model may
        start to differ…
		
4.  Solve the model.
    -   Apply Step 2 to Step 3.
    -   Use any useful technologies, such as computation if necessary,
        but consider the errors that they may introduce.
		
5.  Answer the question.

    -   Rephrase the result of Step 4 in non-technical terms.
    -   The goal is now to make the answer understandable to the
        person that posed it, keeping in mind that person may not be a
        mathematician.
    -   Think about what the errors might be, or how realistic the
        answer actually is.
    -   Assess to what extent the answer met expectations.



Of course this procedure is described in very general terms, and may
need adaptation according to the problem at hand.  

But: at least it describes our goals in modeling.
