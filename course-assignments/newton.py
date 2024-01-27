
def newtonStep(x,b):
    return 2*x - b*x*x

def approx(b,x0,num):
    x = x0*1.0
    for i in range(num):
        xnew = newtonStep(x,b*1.0)
        x = xnew
    return x



from pprint import pprint
results = [ f"{i} - {approx(4242,.0001,i)}"
            for i in range(10)]
pprint(results)
