child(ann,anne).
child(anne,mig).
child(mig,santi).

descend(X,Y)  :-  child(X,Y).
descend(X,Y)  :-  descend(X,Z),descend(Z,Y). 
