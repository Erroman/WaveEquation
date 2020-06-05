import math
import numpy as np
import matplotlib.pyplot as plt
def on_boundary(t):
    return 3*math.sin(2*math.pi*f*t)*math.exp(-t)
L=1 # string length 
c=1 # wave velocity
f=5 # frequency of the input wave

time=4   # total simulation time
dx=0.005 # step in position
dt=0.005 # time step

nx=math.ceil(L/dx)+1     # total number of columns
nt=math.ceil(time/dt)+1  # total number of rows
u=np.zeros((nt,nx))      # initializing matrix u with zeros 

r=pow(c*dt/dx,2)
for i in range(1,nt):
    u[i,0] = on_boundary(i*dt)
    print("u[i,0] = "+str(u[i,0]))
for j in range(2,nx-1):  #loop for every column
    u[2,j] = u[1,j]+1/2*r*(u[1,j+1] - 2*u[1,j]+ u[1,j-1]) # solution for the first time step
for i in range(2,nt):        # complete this part. For loop for  time (rows)
    for j in range(2,nx-1):  # complete this part. For loop for space (columns)
        # use eq. 9 to complete this part
        u[i,j]=2*u[i-1,j]-u[i-2,j]+r*(u[i-1,j+1]-2*u[i-1,j]+u[i-1,j-1])
#plt.plot(u[:100])
#plt.show()

