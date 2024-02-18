from graphviz import Digraph

dg = Digraph()
#dg = Digraph(engine='neato')

dg.attr(rankdir='LR')

V = [ 's', 'a', 'b', 'c', 'd', 't' ]

weights = { ('s','a'):   16,
            ('s','c'):   13,
            ('c','a'):    4,
            ('a','c'):   10,
            ('a','b'):   12,
            ('c','d'):   14,
            ('d','b'):    7,
            ('b','d'):    6,
            ('b','t'):   20,
            ('d','t'):    4
           } 

c.node('t')

with dg.subgraph() as c:
    c.attr(rank='same')
    for x in ['a','c']:
        c.node(x)

with dg.subgraph() as c:
    c.attr(rank='same')
    for x in ['b','d']:
        c.node(x)

c.node('s')        
        
for (f,t) in weights.keys():
    wt = f"{weights[(f,t)]}"
    dg.edge(f,t,wt)

dg.filename='PS4--graph'
dg.format='png'
dg.render()



