% 7.2
s1 --> [a],s1,[b].
s1 --> [].

% 7.3
s2 --> [a],s2,[b,b].
s2 --> [].
% 8.1
s3 --> np,vp.
s3 --> np1,vp1.

np --> det,n.
np --> det1,n.
np1 --> det1,n1.

vp --> v,np.
vp --> v.
vp1 --> v1,np.
vp1 --> v1.

det1 --> [the].
det --> [a].

n  -->  [woman].
n  -->  [man].
n  -->  [apple].
n  -->  [pear].
n1 -->  [men].

v -->  [eats]. 
v1 --> [eat].
v1 --> [know].

% 8.1 Parametrizadas

s4(S) --> np(S),vp(S).
np(S) --> det(S),n(S).

vp(S) --> v(S),np(_).
vp(S) --> v(S).

det(_) --> [the].
det(singular) --> [a].

n(singular)  -->  [woman].
n(singular)  -->  [man].
n(plurar)  -->  [men].
n(singular)  -->  [apple].
n(singular)  -->  [pear].

v(singular)  -->  [eats]. 
v(plurar) --> [eat].
v(plurar) --> [know].
