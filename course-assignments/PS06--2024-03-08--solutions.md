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

      ::: {.solution}
	  
	  Your position at time t is (randomly chosen to be) one step to
	  the left or to the right of your previous position, and hence is
	  only dependent on your position at time t − 1. It doesn’t matter
	  (for instance) what sequence of steps took you to get to your
	  position at time t − 1, and hence this is a Markov chain.

      Somewhat more precisely, the nodes of the *transition diagram*
      are in one-to-one correspondence with the integers $\{0, \pm 1,
      \pm 2, \cdots\}$, and each node `[n]` has two outgoing
      edges. There is an edge `[n] --> [n+1]` labeled with probability
      1/2, and an edge `[n-1] <-- [n]` also labeled with probability
      1/2. Thus, the probabilities on the outgoing edges always sum to 1.
	  
	  And the state of the system evolves each minute by applying the
      rules of this *state machine*; this is the definition of a
      *Markov process* (or *Markov chain*).

	  :::

   b. Can the distance from where you started as a function of time be
      modeled by a Markov process?

      ::: {.solution}
	  
	  Yes. In this case, consider the *transition diagram* whose nodes
	  are *non-negative* integers.  For any node `[n]` with `n>0`,
	  there are *two* outgoing edges: `[n] --> [n+1]` and `[n-1] <--
	  [n]`, both of which are labeled with probability 1/2.
	  
	  If you are standing in front of building
	  `m`, the effect of a `heads` toss and of a `tails` toss depend
	  on the *sign* of `m`. Namely, if `m>0` and you toss `heads`, you
	  move one building to the right and hence increase your distance
	  to the origin by one unit, and if you toss `tails`, you move one
	  building to the left and hence decrease your distance to the
	  origin by one unit.
	  
	  On the other hand, if `m<0` and you toss `heads`, your
      one-building to the right move *increases* your distance to the
      origin by one unit, and if you toss `tails`, your distance to
      the origin *decreases* by one unit. 
	  
	  Finally, if your distance is `0`, there is only one outgoing
	  edge `[0] --> [1]` and it is assigned a probability of 1, since
	  either a `heads` or `tails` results in a distance of 1 unit from
	  the origin.
	  
	  In summary, `distance to the origin` is governed by the
	  transition diagram we just described, hence is a Markov process.
	  
	  :::

   c. Now suppose that every minute you flip two coins. If both are
      heads, you move right, if both are tails you move left and
      otherwise you stay put. Is your distance from where you started
      modeled by a Markov process in this scenario? How do you expect
      this to compare to the process described in part b?
	  
	  ::: {.solution}
	  :::
	  
   d. For both experiments, compute the probability that you are
      standing on an odd number for minute $0,1,2,3,4$.

      ::: {.solution}
	  :::

   e. (Optional food for thought) Suppose your friend is playing the
      same game, but started at position −100. Do you think it is more
      likely that you two will eventually meet or that you two will
      never meet? Does this answer change when your friend starts at
      −1? How about −10000000?  
	  
      ::: {.solution}
	  :::	  
	  
	  
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
	 
	  ::: {.solution}
	  :::
	 
   b. Check whether the conditions for the Perron-Frobenius theorem is
      satisfied for this problem (aperiodic and strongly
      connected). Explain your reasoning.

      ::: {.solution}
	  :::

   c. Do you expect power iteration to be effective for computing the
      greatest eigenvector of your transition matrix?

      ::: {.solution}
	  :::
	  
   d. Find the eigenvalue decomposition for the transition matrix, and
      the associated eigenvectors. Explain why these values confirm
      your answer to part 2.

      ::: {.solution}
	  :::
	  
   e. Suppose that the “weather rules” change so that if its sunny
      today, it is equally likely to be snowy or rainy tomorrow. Write
      out the new transition matrix, associated finite state machine,
      and determine whether the conditions for the Perron-Frobenius
      are satisfied. Compute the eigenvalue decomposition and compare
      to the previous set of eigenvalues.

      ::: {.solution}
	  :::
