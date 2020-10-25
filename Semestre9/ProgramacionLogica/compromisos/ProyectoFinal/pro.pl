go(Out):-read(X),
    name(X,L),
    tokenize(L,Out).


tokenize([],[]):-!.
tokenize(L,[Word|Out]):- L\==[],
    tokenize(L,Rest,WordChs),
    name(Word,WordChs),
    tokenize(Rest,Out).

tokenize([],[],[]):-!.
tokenize([46|_],[],[]):-!.
tokenize([32|T],T,[]):-!.

tokenize([H|T],Rest,[H|List]):- tokenize(T,Rest,List).


?- op(500, xfy, &).
?- op(600, xfy, ->).



% iniciales
s(P) --> npp(X, P1, P), vpp(X, P1).
s(P) --> nps(X, P1, P), vps(X, P1).

% noun phrases singular
nps(X, P1, P) --> det(X, P2, P1, P), noun_s(X, P3), relc(X, P3, P2).
nps(X, P1, P) --> det(X, P2, P1, P), c_noun(X, P3), relc(X, P3, P2).

%noun phrases plural
npp(X, P1, P) --> det(X, P2, P1, P), noun_p(X, P3), relc(X, P3, P2).
npp(X, P1, P) --> det(X, P2, P1, P), c_noun(X, P3), relc(X, P3, P2).


% verb phrases en singular
vps(X, P) --> transv_s(X, Y, P1), nps(Y ,P1, P).
vps(X, (P1&P2)) --> transv_s(X, Y, P1), noun_s(Y, P2).
vps(X, P) --> intransv_s(X, P).
vps(X, (P1&P2)) --> beVerb(X, P1, P2), adj(X, P1).

% verb phrases en plural
vpp(X, P) --> transv_p(X, Y, P1), npp(Y ,P1, P).
% esta regla fue anadida para que no se necesite un
% cuantificar obligatoriamente seguido de un verbo transitivo, ejemplo
% 'all girls eat apples'.
vpp(X, P) --> transv_p(X, Y, P1), noun_p(Y, P2), relc(P1, P2, P).
%
vpp(X, P) --> intransv_p(X, P).
vpp(X, (P1&P2)) --> beVerb(X, Y, P2), adj(Y, P1).


relc(_, P1, (P1 -> P2)) --> [that], vpp(P1, P2).
relc(_, P1, (P1 -> P2)) --> [that], vps(P1, P2).
relc(_, P, P) --> [].

% cuantificadores
det(X, P1, P2, all(X, (P1->P2))) --> [all].
det(X, P1, P2, exists(X, (P1&P2))) --> [a].
det(X, P1, P2, exists(X, (P1&P2))) --> [some].

% esto es para sustantivos que vienen acompanados de un adjetivo
c_noun(X, (P1&P2)) --> adj(X, P1), noun_s(X, P2).
c_noun(X, (P1&P2)) --> adj(X, P1), noun_p(X, P2).

% sustantivos en singular
noun_s(X, boy(X)) --> [boy].
noun_s(X, apple(X)) --> [apple].
noun_s(X, girl(X)) --> [girl].
noun_s(X, flavor(X)) --> [flavor].
noun_s(X, government(X)) --> [government].
noun_s(X, watermelon(X)) --> [watermelon].
% sustantivos en plural
noun_p(X, girl(X)) --> [girls].
noun_p(X, apple(X)) --> [apple].
noun_p(X, flavor(X)) --> [flavor].
noun_p(X, boy(X)) --> [boys].
noun_p(X, governments(X)) --> [governments].
noun_p(X, rabbits(X)) --> [rabbits].
noun_p(X, carrots(X)) --> [carrots].
noun_p(X, watermelon(X)) --> [watermelon].
noun_p(X, people(X)) --> [people].
noun_p(X, apples(X)) --> [apples].


% verbos no transitivos
intransv_s(X, runs(X)) --> [runs].
intransv_p(X, eat(X)) --> [eat].
intransv_p(X, runs(X)) --> [run].
intransv_p(X, runs(X)) --> [eats].

% verbos transitivos
transv_p(X, Y, like(X,Y)) --> [like].
transv_p(X, Y, eat(X,Y)) --> [eat].
transv_p(X, Y, contain(X,Y)) --> [contain].
transv_p(X, Y, conscript(X,Y)) --> [conscript].
transv_s(X, Y, eats(X,Y)) --> [eats].
transv_s(X, Y, likes(X,Y)) --> [likes].
transv_s(X, Y, conscripts(X,Y)) --> [conscripts].



%be verbs: taste, are
beVerb(X, Y, taste(X, Y)) --> [taste].
beVerb(X, Y, are(X, Y)) --> [are].

%adjetivos
adj(X, good(X)) --> [good].
adj(X, divine(X)) --> [divine].
adj(X, pacifist(X)) --> [pacifist].
adj(X, evil(X)) --> [evil].



















