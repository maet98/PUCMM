/**
 * -------------------- TOKENIZER CODE -----------------------------
 * */

read_in([W|Ws]) :- get_char(C), readword(C,W,C1), restsent(W,C1,Ws).

restsent(W, _, []) :- lastword(W),!.
restsent(_, C, [W1|Ws]) :- readword(C,W1,C1), restsent(W1,C1,Ws).

readword(C,C,C1) :- single_character(C),!,get_char(C1).
readword(C,W,C2) :- in_word(C, NewC),!, get_char(C1), restword(C1,Cs,C2), atom_chars(W,[NewC|Cs]).
readword(_,W,C2):-get_char(C1),readword(C1,W,C2). % skipping blank spaces.

restword(C,[NewC|Cs],C2) :- in_word(C,NewC), !,get_char(C1),restword(C1,Cs,C2).
restword(C,[],C).

in_word(C,C) :- letter(C,_).
in_word(C,L) :- letter(L,C).
in_word(C,C) :- digit(C).
in_word(C,C) :- special_character(C).

special_character('-').
special_character('''').

single_character(',').          
single_character(':').
single_character('.').          
single_character('?').
single_character(';').          
single_character('!').

letter(a,'A').		  
letter(n,'N').
letter(b,'B').		  
letter(o,'O').
letter(c,'C').		  
letter(p,'P').
letter(d,'D').		  
letter(q,'Q').
letter(e,'E').		  
letter(r,'R').
letter(f,'F').		  
letter(s,'S').
letter(g,'G').		  
letter(t,'T').
letter(h,'H').		  
letter(u,'U').
letter(i,'I').		  
letter(v,'V').
letter(j,'J').		  
letter(w,'W').
letter(k,'K').		  
letter(x,'X').
letter(l,'L').		  
letter(y,'Y').
letter(m,'M').		  
letter(z,'Z').

digit('0').        
digit('5').
digit('1').        
digit('6').
digit('2').        
digit('7').
digit('3').        
digit('8').
digit('4').        
digit('9').

lastword('.').
lastword('!').
lastword('?').

% -------------------------- END OF TOKENIZER -------------------------------- %

%--------------------------- ORIGINAL GRAMMAR -------------------------------- %

/* s --> np(X), vp(X), finisher.

np(X) --> det(X), noun(X).
np(X) --> det(hybrid), noun(X).
np(X) --> det(X), noun(X), relCl(X).
np(X) --> det(hybrid), noun(X), relCl(X).
np(X) --> noun(X).
np(_) --> det(hybrid), adj, noun(_).
np(X) --> det(X), adj, noun(_).

vp(X) --> verb(X).
vp(X) --> verb(X), adj.
vp(X) --> verb(X), adj, np(X).
vp(X) --> verb(X), np(_).
vp(X) --> beVerb(X), adj.

relCl(_) --> rel, vp(_).
relCl(X) --> rel, np(_), verb(X).

% Nouns database.

noun(singular) --> [boy].
noun(singular) --> [girl].
noun(singular) --> [apple].
noun(singular) --> [flavor].
noun(singular) --> [government].
noun(plural) --> [rabbits].
noun(plural) --> [girls].
noun(plural) --> [carrots].
noun(plural) --> [watermelons].
noun(plural) --> [boys].
noun(plural) --> [governments].
noun(plural) --> [people].

% Verbs database
verb(singular) --> [runs].
verb(singular) --> [eats].
verb(singular) --> [conscripts].
verb(plural) --> [run].
verb(plural) --> [like].
verb(plural) --> [contain].
verb(plural) --> [eat].
verb(plural) --> [conscript].
verb(plural) --> [taste].

beVerb(singular) --> [is].
beVerb(plural) --> [are].

% Determiners database
det(plural) --> [all].
det(singular) --> [a].
det(hybrid) --> [some].
det(hybrid) --> [the].


% Adjectives database
adj --> [divine].
adj --> [pacifist].
adj --> [evil].
adj --> [good].

% Relative pronouns database
rel --> [that].

% End of sentence.
finisher --> ['.'].
finisher --> ['?'].
finisher --> ['!'].
*/

%--------------------------- END OF ORIGINAL GRAMMAR -------------------------------- %

%--------------------------- MODIFIED GRAMMAR -------------------------------- %

?- op(500, xfy, &).
?- op(600, xfy, ->).

sentence(X):- read_in(S), s(X, S, []).
s(P) --> np(X, Y, P1, P), vp(X, Y, P1), finisher.

np(X, Y, P1, P) --> det(X, Y, P2, P1, P), noun(X, Y, P2).
np(X, Y, P1, P) --> det(hybrid, Y, P2, P1, P), noun(X, Y, P2).
np(X, Y, P1, P) --> det(X, Y, P3, P2, P), noun(X, Y, P3), relCl(X, Y, P1, P2).
np(X, Y, P1, P) --> det(hybrid, Y, P3, P2, P), noun(X, Y, P3), relCl(X, Y, P1, P2).
np(X, Y, P, (P1,P)) --> noun(X, Y, P1).
np(_, Y, P1, P) --> det(hybrid, Y, (P2&Z), P1, P), adj(Y, Z), noun(_, Y, P2).
np(X, Y, P1, P) --> det(X, Y, (P2&Z), P1, P), adj(Y,Z), noun(_, Y, P2).

vp(X, Y, P) --> verb(X, Y, _, P).
vp(X, Y, (Z,P)) --> verb(X, Y, Q, P), adj(Q, Z).
vp(X, Y, (Z,P)) --> verb(X, Y, W, P1), adj(W, Z), np(_, W, P1, P).
vp(X, Y, P) --> verb(X, Y, W, P1), np(_,W, P1, P).
vp(X, Y, (Z,P)) --> beVerb(X, Y, Q, P), adj(Q, Z).

relCl(_, X, P1, (P2 , P1)) --> rel, vp(_, X, P2).
relCl(X, Y, P1, (P2 , P1)) --> rel, np(X, Y, P1, P2), verb(X, Y, _, P2).

%------------- Nouns database.

noun(singular, X, boy(X)) --> [boy].
noun(singular, X, girl(X)) --> [girl].
noun(singular, X, apple(X)) --> [apple].
noun(singular, X, flavor(X)) --> [flavor].
noun(singular, X, government(X)) --> [government].
noun(plural, X, rabbit(X)) --> [rabbits].
noun(plural, X, girl(X)) --> [girls].
noun(plural, X, carrot(X)) --> [carrots].
noun(plural, X, watermelon(X)) --> [watermelons].
noun(plural, X, boy(X)) --> [boys].
noun(plural, X, government(X)) --> [governments].
noun(plural, X, people(X)) --> [people].

%------------ Verbs database

% Intransitive verbs
verb(singular, X, _, run(X)) --> [runs].
verb(singular, X, _, eat(X)) --> [eats].
verb(plural, X, _,run(X)) --> [run].
verb(plural, X, _, eat(X)) --> [eat].

% Transitive verbs
verb(singular, X, Y, conscript(X,Y)) --> [conscripts].
verb(plural, X, Y, contain(X,Y)) --> [contain].
verb(plural, X, Y, like(X,Y)) --> [like].
verb(plural, X, Y, conscript(X,Y)) --> [conscript].
verb(plural, X, Y, taste(X,Y)) --> [taste].

% Be verbs (transitive verbs)
beVerb(singular, X, Y, is(X,Y)) --> [is].
beVerb(plural, X, Y, are(X,Y)) --> [are].

%------------- Determiners database
det(hybrid, X, P1, P2, all(X, (P1 -> P2))) --> [all].
det(singular, X, P1, P2, exists(X, (P1 & P2))) --> [a].
det(hybrid, X, P1, P2, exists(X, (P1 & P2))) --> [some].
det(hybrid, X, P1, P2, exists(X, (P1 & P2))) --> [the].


%------------- Adjectives database
adj(X, divine(X)) --> [divine].
adj(X, pacifist(X)) --> [pacifist].
adj(X, pacifist(X)) --> [pacifists].
adj(X, evil(X)) --> [evil].
adj(X, good(X)) --> [good].

%-------------- Relative pronouns database
rel --> [that].

%-------------- End of sentence.
finisher --> ['.'].
finisher --> ['?'].
finisher --> ['!'].

%?- sentence(S).
%|: All boys run.
% s(np(det(all),noun(boys)),vp(verb(run)))
%S = all(_4326, boy(_4326)->run(_4326)) 

%?- sentence(S).
%|: All boys like all watermelons that contain some divine flavor.
%S = all(_4620, boy(_4620)->all(_4638, watermelon(_4638)->(exists(_4666,  (flavor(_4666)&divine(_4666))&contain(_4638, _4666)), like(_4620, _4638))))

%?- sentence(S).
%|: Some boy eats some apple.
%S = exists(_6284, boy(_6284)&exists(_6304, apple(_6304)&eat(_6284)))

%?- sentence(S).
%|: Some government conscripts some pacifist people.
%S = exists(_6416, government(_6416)&exists(_6434,  (people(_6434)&pacifist(_6434))&conscript(_6416, _6434)))

%?- sentence(S).
%|: All government that conscripts pacifist people are evil.
%false.
