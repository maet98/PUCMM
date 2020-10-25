% Tokenizer

go1(Out):-
    read(X),
    name(X,L),
	tokenize(L,Out).

tokenize([],[]):- !.
tokenize(L,[Word|Out]):- L\==[],
    tokenize(L,Rest,WordChs),
    name(Word,WordChs),
    tokenize(Rest,Out).

tokenize([],[],[]):- !.
tokenize([46|_],[],[]):- !.
tokenize([32|T],T,[]):- !.

tokenize([H|T],Rest,[H|List]):-
    tokenize(T,Rest,List).

% Main predicate
go :-
    %go1(X),
    readln(X, _, _, _, lowercase),
    reset_gensym,
    sentence(P, X, []),
    translator(P, R),
    write(R).

%Operator's definition
:- op(600,xfy,=>).
:- op(500,xfy,&).

%Grammar + Parser
sentence(sentence(NP, VP)) --> noun_phrase(Num, NP), verb_phrase(Num, VP).
noun_phrase(Num, np(DET, N)) --> determiner(Num, DET), noun(Num, N).
noun_phrase(Num, np(ADJ, N)) --> adjective(ADJ), noun(Num, N).
noun_phrase(Num, np(DET, ADJ, N)) --> determiner(Num, DET), adjective(ADJ), noun(Num, N).
noun_phrase(Num, np(DET, N, RCL)) --> determiner(Num, DET), noun(Num, N), relative_clause(Num, RCL).
noun_phrase(Num, np(N)) --> noun(Num, N).

verb_phrase(Num, vp(V)) --> verb(Num, itrans, V).
verb_phrase(Num, vp(V, NP)) --> verb(Num, trans, V), noun_phrase(_, NP).
verb_phrase(Num, vp(BV, ADJ)) --> beVerb(Num, BV), adjective(ADJ).

relative_clause(Num, rcl(REL, VP)) --> rel(REL), verb_phrase(Num,VP).
relative_clause(Num, rcl(REL, NP, V)) --> rel(REL), noun_phrase(Num,NP), verb(Num, itrans, V).

adjective(adj(good)) --> [good].
adjective(adj(evil)) --> [evil].
adjective(adj(big)) --> [big].
adjective(adj(divine)) --> [divine].
adjective(adj(pacifist)) --> [pacifist].
adjective(adj(nice)) --> [nice].

is_det(plural, all).
is_det(singular, a).
is_det(_, the).
is_det(_, some).
determiner(Num, determiner(D)) --> [D], {is_det(Num, D)}.

is_noun(plural, boys).
is_noun(singular, boy).
is_noun(plural, girls).
is_noun(singular, girl).
is_noun(plural, people).
is_noun(singular, person).
is_noun(plural, apples).
is_noun(singular, apple).
is_noun(plural, watermelons).
is_noun(singular, watermelon).
is_noun(plural, rabbits).
is_noun(plural, carrots).
is_noun(plural, evil).
is_noun(plural, governments).
is_noun(singular, government).
is_noun(singular, flavor).
noun(Num,noun(N)) --> [N], {is_noun(Num,N)}.

is_verb(plural, trans, like).
is_verb(singular, trans, likes).
is_verb(plural, _, eat).
is_verb(singular, _, eats).
is_verb(plural, itrans, run).
is_verb(singular, itrans, runs).
is_verb(plural, trans, contain).
is_verb(singular, trans, contains).
is_verb(plural, trans, conscript).
is_verb(singular, trans, conscripts).
verb(Num, Tp, v(V)) --> [V], {is_verb(Num, Tp, V)}.

beVerb(plural, bv(tastes)) --> [taste].
beVerb(plural, bv(iss)) --> [are].
beVerb(singular, bv(iss)) --> [iss].
beVerb(singular, bv(sounds)) --> [sounds].

rel(rel(that)) --> [that].

% Rules for translator

translator(sentence(NP,VP),F) :-
    gensym(x,Var),
    np(Var,NP,T),
    vp(Var,T,VP,F).

% Translation of noun phrase
np(Var, np(DET,N), R) :-
    n(Var, N, P1),
    det(DET, P1, R).

np(Var, np(DET,ADJ,N), R) :-
    adj(Var, ADJ, P1),
    n(Var, N, P1, P2),
    det(DET, P2, R).

np(Var, np(ADJ, N), R) :-
    adj(Var, ADJ, P1),
    n(Var, N, P1, R).

np(Var, np(DET, N, RCL), R) :-
    n(Var, N, P1),
    rcl(Var, RCL, P1, P2),
    det(DET, P2, R).

np(Var, np(N), R) :-
    n(Var, N, R).

rcl(Var, rcl(_, VP), T, R) :- vp(Var, T, VP, R).

% This predicate add an implication or conjuction between F1 and F2
q_join(all, V, F1, F2, all(V, F1 => F2)).
q_join(exists, V, F1, F2, exists(V, F1 & F2)).

% Translation of verb phrase
vp(Var, P, vp(V), R) :-
    P =.. [Q, V1, F1],
    v(Var, V, C),
    q_join(Q, V1, F1, C, R).

vp(Var, P, vp(bv(BVERB), adj(ADJ)), R) :-
    P =.. [Q, V1, F1],
    C =.. [BVERB, Var, ADJ],
    q_join(Q, V1, F1, C, R).

vp(Var, P, vp(V, NP), R) :-
    P =.. [Q1, V1, F1],
    gensym(x,X),
    v(Var, X, V, C),
    np(X, NP, T),
    T =.. [Q2, V2, F2],
    q_join(Q2, V2, F2, C, R1),
    q_join(Q1, V1, F1, R1, R).

% Terminals symbols, they create functors

det(determiner(all), P, R) :-
    P =.. [_, V, F],
    R =.. [all, V, F],
    !.

det(determiner(_), P, P).

n(Var, noun(N), exists(Var, P)) :- P =.. [N, Var].

n(Var, noun(N), A, exists(Var, (P & A))) :- P =.. [N, Var].

v(Var, v(V), P) :- P =.. [V, Var].

v(V1, Var, v(V), P) :- P =.. [V, V1, Var].

adj(Var,adj(ADJ),P) :- P =.. [ADJ, Var].












