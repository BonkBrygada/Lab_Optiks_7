set fit quiet
#set fit logfile fitsript
set ang deg
f(x)=a*((n**2*cos(x-b)-sqrt(n**2-(sin(x-b))**2))/(n**2*cos(x-b)+sqrt(n**2-(sin(x-b))**2)))**2+c
n=1.2
a=30
b=1
c=20

set fit nolog
fit f(x) ARG1 u 1:2:3:4 xyerrors via a,c
#fit f(x) ARG1 u 1:2:3:4 xyerrors via c
#fit f(x) ARG1 u 1:2:3:4 xyerrors via b
#fit f(x) ARG1 u 1:2:3:4 xyerrors via n
set fit logfile default
fit f(x) ARG1 u 1:2:3:4 xyerrors via a,b,c,n

set print ARG2
print "n", "a", "b", "c", "nerr", "aerr", "berr", "cerr"
print n, a, b, c, n_err, a_err, b_err, c_err

#plot f(x), ARG1 u 1:2:3:4 w xyerrorbars
