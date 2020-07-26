connected(1,2).
connected(3,4).
connected(5,6).
connected(7,8).
connected(9,10).
connected(12,13).
connected(13,14).
connected(15,16).
connected(17,18).
connected(19,20).
connected(4,1).
connected(6,3).
connected(4,7).
connected(6,11).
connected(14,9).
connected(11,15).
connected(16,12).
connected(14,17).
connected(16,19).
connected(20,16).

path(X,Y):-connected(X,Y).
path(X,Y):-connected(X,Z), path(Z,Y), !.

path(X,Y,[X,Y]):- connected(X,Y).
path(X,Y,[X|Route]):- connected(X,Z), path(Z,Y,Route),!.



child(anna,bridget).
child(bridget,caroline).
child(caroline,donna).
child(donna,emily).

descend(X,Y):- child(X,Z),descend(Z,Y).
descend(X,Y):- child(X,Y).

