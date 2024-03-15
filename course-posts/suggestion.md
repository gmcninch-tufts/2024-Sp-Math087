---
title: |
  Midterm Report 2 - coding suggestion
date: 2024-03-165
---

In carrying out work for [midterm report 2](MidRep2--2024-03-15.html), at some point you will
have found a list of probabilities which correspond to "*web pages*". You then need to find the *top 10 pages*. The following example will show you some techniques to use to do this in `python`.

If you have a list in python, you'd like to be able to extract (say)
the top 10 elements of this list.

This is reasonably straightforward. Let me show how.
I'll use `numpy` to generate a (random) list of 20 numbers:

``` python
import numpy as np

L = np.random.rand(20)
L
=>
array([0.59888876, 0.8826809 , 0.42848286, 0.18837597, 0.30193246,
       0.40512774, 0.4572338 , 0.9270912 , 0.86225708, 0.64631983,
       0.31700121, 0.89030269, 0.9270727 , 0.63719131, 0.74485076,
       0.84501848, 0.66773513, 0.60551784, 0.69047995, 0.70457981])
```

To extract (say) the top 5, I can *sort* the list.

``` python
L.sort()
L
=>
array([0.18837597, 0.30193246, 0.31700121, 0.40512774, 0.42848286,
       0.4572338 , 0.59888876, 0.60551784, 0.63719131, 0.64631983,
       0.66773513, 0.69047995, 0.70457981, 0.74485076, 0.84501848,
       0.86225708, 0.8826809 , 0.89030269, 0.9270727 , 0.9270912 ])
```

This gives the numbers in low-to-high order. We can reverse this if we like:

``` python
np.flip(L)
=>
array([0.9496391 , 0.91727302, 0.91398948, 0.82344881, 0.77745334,
       0.70005671, 0.66957984, 0.57729601, 0.53240024, 0.5023616 ,
       0.47431738, 0.46758215, 0.45056234, 0.42273064, 0.40681106,
       0.40064446, 0.2809288 , 0.26337749, 0.05807318, 0.05140198])
```

And then easily extract the top 5:

```python
np.flip(L)[0:5]
=>
array([0.9496391 , 0.91727302, 0.91398948, 0.82344881, 0.77745334])
```

However, this leaves us with a problem. After sorting, we no longer
know the *original positions* of these top-five values.

Consider a list of 20 identifiers (I've scraped up some *color names* to use as identifiers),
and let's generate a new list of 20 numbers.


``` python
colors = [ "Gainsboro",
           "Gamboge",
           "Glossy grape",
           "Gold (metallic)",
           "Gold (Crayola)",
           "Golden poppy",
           "Golden yellow",
           "Goldenrod",
           "Gotham green",
           "Granite gray",
           "Granny Smith apple",
           "Gray (web)",
           "Gray (X11 gray)",
           "Green",
           "Green (Crayola)",
           "Green (web)",
           "Green (Munsell)",
           "Green (pigment)",
           "Green-blue",
           "Green Lizard"
           ]

M = np.random.rand(20)
=>
array([0.54271742, 0.08356579, 0.84459914, 0.31623228, 0.83783749,
       0.08603638, 0.58023307, 0.73584079, 0.48756939, 0.15952226,
       0.49337045, 0.50012207, 0.83147688, 0.19603904, 0.56062997,
       0.2623    , 0.12932203, 0.53814636, 0.26040894, 0.51886249])
```

Let's assume that the `i`th entry of the array `M` corresponds to the
*popularity* `i`th entry of `colors`.

We want to know the top 5 most popular colors, in order. 

Well, we start by creating an auxiliary list of numbers `MM` whose
entries have the form `(i,M[i])`. Sorting the list `MM` will allow us
to keep track of the index to which the numerical entry belongs.

``` python
MM = [ (i,M[i]) for i in range(len(M)) ]
MM
=>
[(0, 0.5427174230907871),
 (1, 0.08356578675164472),
 (2, 0.8445991409147532),
 (3, 0.3162322837557817),
 (4, 0.8378374910762032),
 (5, 0.08603638182768714),
 (6, 0.5802330689338201),
 (7, 0.7358407928154617),
 (8, 0.48756938882888645),
 (9, 0.1595222604249248),
 (10, 0.4933704534494878),
 (11, 0.5001220683132755),
 (12, 0.8314768835810168),
 (13, 0.19603903842858328),
 (14, 0.5606299700383907),
 (15, 0.2623000018631262),
 (16, 0.12932203084493898),
 (17, 0.5381463621629631),
 (18, 0.2604089399287458),
 (19, 0.5188624872343434)]
 ```
 
 Now we sort the array `MM` using a `key`. Namely, we sort by the
 negative of component 1 of each tuple in `MM` (we use negative
 because we want to sort from high-to-low).
 
 ``` python
 MM.sort( key = lambda x: -x[1] )
 MM[0:5]
 =>
 [(2, 0.8445991409147532),
  (4, 0.8378374910762032),
  (12, 0.8314768835810168),
  (7, 0.7358407928154617),
  (6, 0.5802330689338201)]
 ```

And now we can see the colors with their popularity scores!

``` python
[ (colors[i],m) for (i,m) in MM[0:5] ]
=>
[('Glossy grape', 0.8445991409147532),
 ('Gold (Crayola)', 0.8378374910762032),
 ('Gray (X11 gray)', 0.8314768835810168),
 ('Goldenrod', 0.7358407928154617),
 ('Golden yellow', 0.5802330689338201)]
```

In fact, we could have skipped using the numerical index altogether:

``` python
M = np.array([0.54271742, 0.08356579, 0.84459914, 0.31623228, 0.83783749,
       0.08603638, 0.58023307, 0.73584079, 0.48756939, 0.15952226,
       0.49337045, 0.50012207, 0.83147688, 0.19603904, 0.56062997,
       0.2623    , 0.12932203, 0.53814636, 0.26040894, 0.51886249])

MMM = list(zip(colors,M))
MMM
=>
[('Gainsboro', 0.54271742),
 ('Gamboge', 0.08356579),
 ('Glossy grape', 0.84459914),
 ('Gold (metallic)', 0.31623228),
 ('Gold (Crayola)', 0.83783749),
 ('Golden poppy', 0.08603638),
 ('Golden yellow', 0.58023307),
 ('Goldenrod', 0.73584079),
 ('Gotham green', 0.48756939),
 ('Granite gray', 0.15952226),
 ('Granny Smith apple', 0.49337045),
 ('Gray (web)', 0.50012207),
 ('Gray (X11 gray)', 0.83147688),
 ('Green', 0.19603904),
 ('Green (Crayola)', 0.56062997),
 ('Green (web)', 0.2623),
 ('Green (Munsell)', 0.12932203),
 ('Green (pigment)', 0.53814636),
 ('Green-blue', 0.26040894),
 ('Green Lizard', 0.51886249)]
 
MMM.sort(key=lambda x: -x[1])
MMM[0:5]
=>
[('Glossy grape', 0.84459914),
 ('Gold (Crayola)', 0.83783749),
 ('Gray (X11 gray)', 0.83147688),
 ('Goldenrod', 0.73584079),
 ('Golden yellow', 0.58023307)]
```

