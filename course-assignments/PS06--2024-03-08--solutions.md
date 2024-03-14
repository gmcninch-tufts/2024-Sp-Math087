---
title: PS 06 -- Markov Processes
author: George McNinch
date: 2024-03-08
---


1. Suppose you’re standing on a street with buildings labelled by the
   integers (specifically, you’re in front of the building labelled
   $0$, and suppose that the indices are increasing to the
   right). Suppose that every minute you flip a coin. If the coin is
   heads you walk right and if the coin is tails you walk left.

   a. Explain why your position (i.e. the building you’re in front of)
      as a function of time can be modeled as a Markov process.

   b. Can the distance from where you started as a function of time be
      modeled by a Markov process?
   
   c. Now suppose that every minute you flip two coins. If both are
      heads, you move right, if both are tails you move left and
      otherwise you stay put. Is your distance from where you started
      modeled by a Markov process in this scenario? How do you expect
      this to compare to the process described in part b?
	  
   d. For both experiments, compute the probability that you are
      standing on an odd number for minute $0,1,2,3,4$.
	  
   e. (Optional food for thought) Suppose your friend is playing the
      same game, but started at position −100. Do you think it is more
      likely that you two will eventually meet or that you two will
      never meet? Does this answer change when your friend starts at
      −1? How about −10000000?  
	  
2. Rain or shine On Planet X, the weather is strangely predictable:
   The weather is always either sunny, rainy, foggy or snowy. If it
   rains today, its sunny tomorrow. If it is sunny today, its rainy
   tomorrow. If its foggy today, its not sunny tomorrow. Finally, the
   weather is never the same two days in a row. Apart from these
   rules, the weather is completely random, in that if e.g. its foggy
   today it is equally likely to be either rainy or snowy
   tomorrow. You live on Planet X and are trying to figure out what to
   wear this week, so you’d like to develop a model for the weather.
  
   a. Explain why the weather can be modeled as a Markov process. Write
      out the transition matrix, and draw the corresponding finite
      state machine.  
	 
   b. Check whether the conditions for the Perron-Frobenius theorem is
      satisfied for this problem (aperiodic and strongly
      connected). Explain your reasoning.

   c. Do you expect power iteration to be effective for computing the
      greatest eigenvector of your transition matrix?

   d. Find the eigenvalue decomposition for the transition matrix, and
      the associated eigenvectors. Explain why these values confirm
      your answer to part 2.

   e. Suppose that the “weather rules” change so that if its sunny
      today, it is equally likely to be snowy or rainy tomorrow. Write
      out the new transition matrix, associated finite state machine,
      and determine whether the conditions for the Perron-Frobenius
      are satisfied. Compute the eigenvalue decomposition and compare
      to the previous set of eigenvalues.
