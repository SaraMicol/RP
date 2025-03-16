import clingo
import sys

### Main program

if len(sys.argv)<2:
    print("decode.py file1 [file2 ... ]")
    sys.exit()

# Loading files and grounding
ctl = clingo.Control()
ctl.add("base", [], "size(n).")
for arg in sys.argv[1:]:
    ctl.load(arg)
ctl.ground([("base", [])])
ctl.configuration.solve.models="2" # This retrieves 2 models at most

# Solving    
size=0
trees=[]
tents=[]
nummodels=0
with ctl.solve(yield_=True) as handle:
  for model in handle:
      if nummodels>0: print("Warning: more than 1 model"); break
      for atom in model.symbols(atoms=True):
          if (atom.name=="dim" 
          and len(atom.arguments)==1 
          and atom.arguments[0].type is clingo.SymbolType.Number):
            size=atom.arguments[0].number
          elif (atom.name=="tree"
          and len(atom.arguments)==2):
              trees.append((atom.arguments[0].number,atom.arguments[1].number))
          elif (atom.name=="tent"
          and len(atom.arguments)==2):
              tents.append((atom.arguments[0].number,atom.arguments[1].number))
      a=[]
      for i in range(size):
        a.append(['.']*size)
      for p in trees:
         a[p[0]][p[1]]='t'
      for p in tents:
         a[p[0]][p[1]]='x'
      for line in a:
         for el in line:
            print(el,end='')
         print()
      nummodels=1 
if nummodels==0: print("UNSATISFIABLE")
