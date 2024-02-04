import numpy as np
from scipy.optimize import linprog


food_specs = { 'beans': { 'cost': 12,
                          'nutrition_value': 9,
                          'storage': 1
                         },
               'rice': { 'cost': 5,
                         'nutrition_value': 5,
                         'storage': 1
                        }
              }
          
resource_specs = { 'storage': 7,
                   'cost': 60
                  }

# food_specs = { 'lentils': { 'cost': 2.25,
#                             'nutrition_value': 3.0,
#                             'storage': 1
#                            },
#                'garbanzos':  { 'cost': 3.50,
#                                'nutrition_value': 5,
#                                'storage': 1
#                               },
#                'rice': { 'cost': .75,
#                          'nutrition_value': 2,
#                          'storage': 1
#                         },
#               }
          
# resource_specs = { 'storage': 250,
#                    'cost': 400
#                   }

obj = np.array([ food_specs[food]['nutrition_value'] for food in food_specs.keys()])

A = np.array([ [ food_specs[food][res] for food in food_specs.keys() ]
               for res in resource_specs.keys() ])

b = np.array([ resource_specs[res] for res in resource_specs.keys() ])

primal = linprog((-1)*obj,
                 A_ub = A,
                 b_ub = b
                 )

dual = linprog(b,
               A_ub = (-1)*A.T,
               b_ub = (-1)*obj
               )

print(f"primal {primal.fun} - {primal.x}")
print(primal.slack)
print(f"dual {dual.fun} - {dual.x}")
print(dual.slack)
