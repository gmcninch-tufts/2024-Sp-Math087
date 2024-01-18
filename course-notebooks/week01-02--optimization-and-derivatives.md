::: {#9370c408-0db3-49bb-8c5c-f359902aa62a .cell .markdown}
# [George McNinch](http://gmcninch.math.tufts.edu) Math 87 - Spring 2024

# § Week 1.3 {#-week-13}

# Optimization & derivatives of functions {#optimization--derivatives-of-functions}
:::

::: {#a7f22aa0-3b59-4880-ab4b-95cfd6244e72 .cell .markdown}
# Using code to calculate derivatives

In our discussion of the `oil spill` problem, you may have been
disappointed to have to do calculations with paper-and-pencil.

There are two possible ways around this, which I\'d like to discuss
briefly (with examples).

-   We can use software for symbolic calculation of derivatives.

-   Alternatively, we can *numerically approximate* derivatives.

This `notebook` will discuss these possibilities. For each method, we
first treat some simple examples, and then we apply the method to the
`oil spill` problem.
:::

::: {#d8c6c55e-e921-43ac-8e81-10b63c28e4dd .cell .markdown}
# Symbolic calculations

First, let\'s investige how `python` can make symbolic calculations
using the `sympy` package.

For more details about symbolic calculations in python consult the
[symbolic mathematics package](https://www.sympy.org/en/index.html).
:::

::: {#d9a9ec4c-0abc-4290-a9d9-67370e504158 .cell .markdown}
## A simple example

Let\'s find and classify the critical points for the cubic polynomial

$$G(t) = t^3 - 4t^2 - 5t - 2.$$
:::

::: {#33616bbc-f439-42cc-b4af-865e9e25df9f .cell .markdown}
Let\'s import the `sympy` package, and declare `tt` to be a *symbol*:
:::

::: {#6d438a59-0df7-4091-9610-0b9334c51c94 .cell .code execution_count="1"}
``` python
import sympy as sp
sp.init_printing()

tt = sp.Symbol('t') 
```
:::

::: {#3b42aee5-80b1-41bc-82cf-03348d6a1874 .cell .markdown}
We now define the function $G$, and we create a corresponding *symbolic*
version of $G$ by evaluating the function $G$ at the symbol `tt`.
:::

::: {#81105534-abe3-4c7e-a996-968231d3fec5 .cell .code execution_count="2"}
``` python
def G(t): return t**3 - 4*t**2 - 5*t - 2
    
Gs = G(tt)
Gs
```

::: {.output .execute_result execution_count="2"}
![](course-notebooks/f92b3ed2eb938bbf25b7d5dfcf1c9c1faae98aae.png)
:::
:::

::: {#d2e5d0c9-a858-4bba-97f9-e9deb300bce1 .cell .markdown}
Now we symbolically find the first and second derivative of $G$, using
the function `diff` from the `sympy` package:
:::

::: {#420938c1-0b3f-483c-8fe5-8d9fb420fd5b .cell .code execution_count="3"}
``` python
DGs = sp.diff(Gs,tt)           # first derivative
DDGs = sp.diff(DGs,tt)         # second derivative
```
:::

::: {#723d4032-6164-4281-acf7-622096edc7ff .cell .markdown}
For example, we can see the first derivative:
:::

::: {#a7bc13b2-6334-47b9-ae0c-15fe776e3501 .cell .code execution_count="4"}
``` python
DGs
```

::: {.output .execute_result execution_count="4"}
![](course-notebooks/beb6082c6e399ba35d39c5424c265d072dd54b43.png)
:::
:::

::: {#f8f456e3-0d75-46b6-a5a0-8543c631f413 .cell .markdown}
Now we use the `sympy` solver to find the critical points of $G$ - i.e
the solutions of the equation `DGs == 0`
:::

::: {#1636c6a2-d68c-4ae4-945e-e1d9340a8d9c .cell .code execution_count="5"}
``` python
crits = sp.solve(DGs,tt)
crits
```

::: {.output .execute_result execution_count="5"}
![](course-notebooks/6bf0a8070034571e432a5bd2c2f2febf671becef.png)
:::
:::

::: {#c4887e3a-e3a4-4a2d-881d-01c9f1bacbbd .cell .code execution_count="7"}
``` python
list(map(lambda c: c.evalf(),crits))
```

::: {.output .execute_result execution_count="7"}
![](course-notebooks/63d240ad7ae5e6692472ab849bd8b6c0c85e7da7.png)
:::
:::

::: {#f833bb4c-3c7b-4912-a13f-3e820ba8ccc7 .cell .markdown}
Using the fuction `lambdify`, we make an actual function `DDG` out of
the symbolic expression `DDGs` and apply this function to each critical
point:
:::

::: {#d4905dd7-0ee1-4fe9-8a0a-04a19358f08f .cell .code}
``` python
DDG = sp.lambdify(tt,DDGs)
list(map(DDG,crits))
```
:::

::: {#9c5e1199-1406-4c25-adfd-972c9898befb .cell .markdown}
Since the value of `DDG` is *negative* at the first critical point, we
see that $G$ has a local max at $t=\dfrac{4}{3} - \dfrac{\sqrt{31}}{3}$.

Similarly, $G$ has a local min at
$t=\dfrac{4}{3} +\dfrac{\sqrt{31}}{3}$.

We confirm this with a sketch of the graph of $G$:
:::

::: {#7cd3fd9e-174a-4d96-a677-f84199b5e3f3 .cell .code}
``` python
import matplotlib.pyplot as plt
import numpy as np

t = np.linspace(-3,6)

fig, ax = plt.subplots()  
ax.plot(t,G(t),label="G")

for t in crits:
        ax.axvline(x=t, color="red", dashes=[1,4])
```
:::

::: {#63cddc08-9c69-4e63-af5d-07ce384148b6 .cell .markdown}
## A trig example

Let $H1(t) = \sin(5t)$ and $H2(t) = \sin(5t + 3\pi/8)$. Let\'s classify
the critical points of $H1(t)$ and $H2(t)$ on the interval $[-\pi,\pi]$.

This time, we use the `sin` function from the `sympy` library.
:::

::: {#1091b541-0211-4290-a03d-f578dbf06fc2 .cell .code}
``` python
import sympy as sp
sp.init_printing()

tt = sp.Symbol('t') 

H1s = sp.sin(5*tt)

H2s = sp.sin(5*tt + 3*sp.S.Pi/8)
```
:::

::: {#edd482ef-d732-4f7a-ba29-6a2400de4cac .cell .code}
``` python
DH1s = sp.diff(H1s)
DH1s
```
:::

::: {#70ca2619-96b9-45d7-b6d9-7f780b6e6a05 .cell .code}
``` python
DH2s = sp.diff(H2s)
DH2s
```
:::

::: {#db1c165b-696f-4c7a-a9be-b23aae6c6614 .cell .code}
``` python
DDH1s = sp.diff(DH1s)
DDH1s
```
:::

::: {#1ca44d6c-3e46-485a-905d-8c8f0b9e5701 .cell .code}
``` python
DDH2s = sp.diff(DH2s)
DDH2s
```
:::

::: {#a1c7d04c-8a12-4dc8-960f-35636f3d38b8 .cell .markdown}
Now, we want to find the critical points in the interval $[-\pi,\pi]$.
For this, we first define this `interval` and use the `solveset`
function to find the solutions to `DHs==0` on this interval:
:::

::: {#51de2160-1a06-4922-a8d6-fdc2639929f7 .cell .code}
``` python
int = sp.sets.sets.Interval(-np.pi,np.pi)

crits1 = sp.solveset(DH1s,tt,domain=int)
list(crits1)
```
:::

::: {#a773e568-a605-4572-b413-8ebc6ac63863 .cell .code}
``` python
crits2 = sp.solveset(DH2s,tt,domain=int)
crits2
```
:::

::: {#c5cc6fcd-b673-466d-96d0-bc8c4faefcf2 .cell .markdown}
We now use the second derivative test to classify the critical points as
a (local) `min` or `max`
:::

::: {#a693c257-138d-45f3-873a-94588517bcb4 .cell .code}
``` python
def classify(DD,cp): 
    if DD.subs(tt,cp)>0:
        return "min"
    elif DD.subs(tt,cp)<0:
        return "max"
    else: return "inconclusive"

list(map(lambda x: (x,classify(DDH1s,x)),crits1.evalf()))
```
:::

::: {#16b074b4-680c-40b6-aa15-3b4c3f298f96 .cell .code}
``` python
results = list(map(lambda x: (x,classify(DDH2s,x)),crits2.evalf()))
results
```
:::

::: {#dcfbb3c8-bd4a-4a15-bc14-25108c125739 .cell .markdown}
Let\'s confirm our classification using graphs:
:::

::: {#d37ed067-78a0-4d05-9089-b01547ee175b .cell .code}
``` python
import matplotlib.pyplot as plt
import numpy as np

tl = np.linspace(-np.pi,np.pi,200)

def H1(t): return np.sin(5*t)
def H2(t): return np.sin(5*t + 3*np.pi/8)

fig, ax = plt.subplots()  
ax.set_title("Graph of H1(t) = sin(5t)")
ax.plot(tl,H1(tl),label="H1")

for t in crits1:
        ax.axvline(x=t, color="red", dashes=[1,4])
```
:::

::: {#9057983a-c662-4e7f-a7d1-7799100b2cd5 .cell .code}
``` python
fig, ax = plt.subplots()  
ax.plot(tl,H2(tl),label="H2")
ax.set_title("Graph of H2(t) = sin(5t + 3pi/8)")

for t in crits2:
        ax.axvline(x=t, color="red", dashes=[1,4])
```
:::

::: {#2a3e5f73-e1e5-4b27-acd6-a85a3c4ad785 .cell .markdown}
## Return to the \"oil spill\" problem

Recall the `python` expressions for the main function of interest:

-   \$C\_{tot}(n) \$ `c.cost(n)`

We will make a "symbolic variable" we'll call `y`.

We would like to make a symbolic version the `python` function
`c.cost(n)` by valuation at `n=y`.

Unfortunately, our definition of `c.cost(n)` involved a test of
inequality (to decide whether the fine calculation applied). But it is
not "legal" to test inequalities with the symbol `y`. (More precisely,
such tests can't be sensibly interpreted).

For small enough $n$, `c.cost(n)` is equal to
`c.crew_costs(n) + c.fine_per_day * (c.time(n)-14)`. And this latter
expression *can* be evaluated at the symbolic variable `y`.

And *sympy* permits us to symbolically differentiate the resulting
expression:

In the next cell, we load the *definitions* from the `oil spill`
notebook.
:::

::: {#868c1292-0c3a-433e-a863-05332ed0798b .cell .code}
``` python
%%capture

%run week01-02--optimization.ipynb import *
```
:::

::: {#7dbd73cd-744f-46db-99ac-da9e0fb1f89e .cell .code}
``` python

import sympy as sp
sp.init_printing()

c = OilSpillCleanup()

y = sp.Symbol('y')    # symbolic variable

def lcost(n):
    return c.crew_costs(n) + c.fine_per_day * (c.time(n) - 14)

lcost_symb = lcost(y)
D_lcost_symb = sp.diff(lcost_symb,y)  # first derivative, for n<19
DD_lcost_symb = sp.diff(D_lcost_symb,y) # second derivative, for n<19

lcost_symb
```
:::

::: {#05590baa-42c2-4b22-b1ea-1b86825579aa .cell .code}
``` python
D_lcost_symb
```
:::

::: {#40eb970d-f100-469b-8ab4-fe022cea70c2 .cell .code}
``` python
DD_lcost_symb
```
:::

::: {#cc4cd615-e326-47b3-a4df-552384fac771 .cell .markdown}
Now e.g. `sympy` solvers are able to find the critical point for the
symbolic derivative `D_lcost_symb`, as follows:
:::

::: {#2d9d4dfb-9609-4b7e-9a65-ebdc0c761116 .cell .code}
``` python
crits = sp.solve(D_lcost_symb,y)
print(crits)
```
:::

::: {#704afbc0-1546-4cb7-91d3-e3b756f5e86c .cell .markdown}
Notice that the value of the second derivative at the positive critical
point $11.28$ is positive:
:::

::: {#a8400ffe-4e21-4483-9b83-e7dcfc286dc6 .cell .code}
``` python
DD_lcost = sp.lambdify(y,DD_lcost_symb)

DD_lcost(crits[1])>0
```
:::

::: {#60af21bb-92b9-4393-89d1-065fa129aaf6 .cell .markdown}
This the second derivative test shows that our postive critical point of
11.28 determines a *local minimum* for the cost function; this is the
conclusion we came to previously.

Note that this symbolic method doesn\'t completely solve the problem: we
still require analysis about the interval $19 < n$ (where the cost
function isn't modeled by our symbolic function `lcost_symb`).
:::

::: {#025f9490-7663-4d32-9ec4-88edd7fde59b .cell .markdown}
# Numerical calculations

In another direction, rather than relying on symbolic calculations, we
can use numerical methods to approximate derivatives.

Let\'s see what this might look like. We import the `numpy` package, and
define some functions to extract critical points. These functions depend
on the `numpy` function `gradient` which - in the case of a function of
a single variable - approximates the derivative.
:::

::: {#0ad5e8ef-5867-499a-9d34-55f0fd9697d6 .cell .code execution_count="9"}
``` python
import numpy as np

def crit_pts(ff,xx,tol=1E-5):
    gg = np.gradient(ff,xx)
    res = [ x for (x,g) in zip(xx,gg)
            if np.abs(g)<tol ]
    return res

def crit_pts_fun(f,a,b,n,tol=1E-5):
    xx=np.arange(a,b,1/n)
    ff=f(xx)
    return crit_pts(ff,xx,tol)
    
```
:::

::: {#339d1c31-dadc-4d43-a8ce-a642837b8dfb .cell .markdown}
Let use these functions on our cubic polynomial $G(t)$ from above.
Remember that the `sympy` solve found the critical points to be
$\dfrac{4}{3} \pm \dfrac{\sqrt{31}}{3}$.
:::

::: {#d1ea771b-87f0-40f6-8e3a-09ea1f7fd31a .cell .code execution_count="10"}
``` python
def G(t): return t**3 - 4*t**2 - 5*t - 2

crit_pts_fun(G,-2,6,5E3,tol=1E-3)
```

::: {.output .execute_result execution_count="10"}
![](course-notebooks/b9eb0e7894a01c8e2ef5169ec7ce9d221c72a326.png)
:::
:::

::: {#a7089ab3-fb59-459a-a5c1-f3019c9ab3f0 .cell .markdown}
Compare with:
:::

::: {#9179e3c1-6fda-47b2-9bab-9fae26509fdf .cell .code execution_count="12"}
``` python
[4/3 - np.sqrt(31)/3,4/3 + np.sqrt(31)/3]
```

::: {.output .execute_result execution_count="12"}
![](course-notebooks/63d240ad7ae5e6692472ab849bd8b6c0c85e7da7.png)
:::
:::

::: {#a972ad55-21bc-4ecd-945c-da3be6125eb0 .cell .markdown}
**But**: if we change the tolerances in the argument to `crit_pts_fun`,
we get redundant critical points, or we miss critical points.
:::

::: {#f6b48135-7ed6-42e9-ba78-108faf6a7ec2 .cell .code execution_count="22"}
``` python
crit_pts_fun(G,-2,6,5E3,tol=5E-3)
```

::: {.output .execute_result execution_count="22"}
![](course-notebooks/775b95a96a0ce35325ff4075641d3ae4598f054d.png)
:::
:::

::: {#9a3eadb8-04e0-4a45-97ee-a66d62c0649e .cell .code execution_count="23"}
``` python
crit_pts_fun(G,-2,6,5E3,tol=1E-4)
```

::: {.output .execute_result execution_count="23"}
![](course-notebooks/b3e0e0375316ee30e796bb5300ad2e52dc75c77b.png)
:::
:::

::: {#9c5942e4-3aab-404e-9ae8-e069aefec84e .cell .markdown}
Let\'s return to our `oil spill` problem.
:::

::: {#168729e5-9bdb-494b-9721-c01c1bd522c0 .cell .code execution_count="19"}
``` python
%%capture

%run week01-01--optimization.ipynb import *
```
:::

::: {#f538e286-ab4b-4421-b28f-32d6e51ba632 .cell .markdown}
If we make good choices of tolerances, we can get a pretty good estimate
for the critical point of the cost function:
:::

::: {#9dcfe343-57fc-464d-9284-b32188e95b79 .cell .code execution_count="32"}
``` python
c = OilSpillCleanup()

f = np.vectorize(c.cost)

res=crit_pts_fun(f,0,19,1E4,1E-1)
res
```

::: {.output .execute_result execution_count="32"}
![](course-notebooks/36c7bfc7e90531d9187b20b17e2b22c2a488c99d.png)
:::
:::

::: {#933fe3c5-bbbc-454d-b9a7-08f074859fa3 .cell .markdown}
But in some sense, this required us to already know the answer!

with the wrong tolerances, it is easy to miss the critical point:
:::

::: {#413f1151-24ad-4c2d-96a2-95664e541b63 .cell .code execution_count="37"}
``` python
res=crit_pts_fun(f,0,19,1E4,1E-2)
res
```

::: {.output .execute_result execution_count="37"}
![](course-notebooks/b3e0e0375316ee30e796bb5300ad2e52dc75c77b.png)
:::
:::

::: {#a334e536-3772-4ecf-977b-42a0fa5f0009 .cell .markdown}
And it is easy to get redundant reported critical points:
:::

::: {#2e1ab6fe-1e3c-461f-9382-409880822133 .cell .code execution_count="36"}
``` python
res=crit_pts_fun(f,0,19,1E4,4E-1)
res
```

::: {.output .execute_result execution_count="36"}
![](course-notebooks/180923d75e3b701be5b1433d11fa5135e04ecfc4.png)
:::
:::
