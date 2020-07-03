% combine2

combine2([],[],[]).
combine2([H1|R1],[H2|R2],[H3|R3]):- H3 = [H1,H2], combine2(R1,R2,R3).

% combine3
combine3([],[],[]).
combine3([H1|R1],[H2|R2],[H3|R3]):- H3 = j(H1,H2), combine3(R1,R2,R3).
