#I(x)=a+b*(cos(x+c))**2
#a=-10
#fit I(x) "hor_pol_pinck.dat"  via a, b,c
#plot I(x), "hor_pol_pinck.dat"
#d=c+90
#show var d

set fit quiet
#set fit logfile fitsript
set ang deg
f(x)=a*(cos(x-b))**2+c
c=10
a=35
b=30

set fit nolog
fit f(x) ARG1 u 1:2:3:4 xyerrors via b
fit f(x) ARG1 u 1:2:3:4 xyerrors via a
fit f(x) ARG1 u 1:2:3:4 xyerrors via c
set fit logfile default
fit f(x) ARG1 u 1:2:3:4 xyerrors via a,b,c


set print ARG2
print "a", "b", "c", "aerr", "berr", "cerr"
print a, b, c, a_err, b_err, c_err
set print
