/* test Cases
A boy runs exists(x1,boy(x1) & run(x1))
All girls eat some apple all(x1, girl(x1) => exists(x2, apple(x2), eat(x1,x2)))
*/

% %% Grammar
% s(X) --> np(X), vp(X).

% np(X) --> det(X), noun(X).
% np(X) --> det(both), noun(X).
% np(X) --> det(X), noun(X), relcl(X).
% np(X) --> det(both), noun(X), relcl(X).
% np(X) --> noun(X).
% np(_) --> det(both), adj, noun(_).
% np(X) --> det(X), adj, noun(_).

% vp(X) --> verb(X).
% vp(X) --> verb(X), adj.
% vp(X) --> verb(X), adj, noun(_).
% vp(X) --> verb(X), np(_).
% vp(X) --> beVerb(X), adj.

% relcl(_) --> rel, vp(_).
% relcl(X) --> rel, np(_), verb(X).

% % Nouns database.
% noun(singular) --> [boy].
% noun(singular) --> [girl].
% noun(singular) --> [apple].
% noun(singular) --> [flavor].
% noun(singular) --> [government].
% noun(plural) --> [rabbits].
% noun(plural) --> [girls].
% noun(plural) --> [carrots].
% noun(plural) --> [watermelons].
% noun(plural) --> [boys].
% noun(plural) --> [governments].
% noun(plural) --> [people].

% % Verbs database
% verb(singular) --> [runs].
% verb(singular) --> [eats].
% verb(singular) --> [conscripts].
% verb(plural) --> [run].
% verb(plural) --> [like].
% verb(plural) --> [contain].
% verb(plural) --> [eat].
% verb(plural) --> [conscript].
% verb(plural) --> [taste].

% beVerb(singular) --> [is].
% beVerb(plural) --> [are].

% % Determiners database
% det(plural) --> [all].
% det(singular) --> [a].
% det(both) --> [some].
% det(both) --> [the].

% % Adjectives database
% adj --> [divine].
% adj --> [pacifist].
% adj --> [evil].
% adj --> [good].

% % Relative pronouns database
% rel --> [that].

%% Tokenizer
go(Out) :-
    read(X),
    name(X, L),
	tokenize(L, Out).

tokenize([], []) :- !.
tokenize(L, [Word | Out]) :- 
    L\==[],
    tokenize(L, Rest, WordChs),
    name(Word, WordChs),
    tokenize(Rest, Out).

tokenize([], [], []) :- !.
tokenize([46 | _], [], []) :- !.
tokenize([32 | T], T, []) :- !.

tokenize([H | T], Rest, [H | List]) :-
    tokenize(T, Rest, List).

?- op(500, xfy, &).
?- op(600, xfy, ->).

main(X):- go(S), reset_gensym, gensym(x, Var), s(X, Var, S, []).

s(P, Var) --> np(Number, Var, P1, P), vp(Number, Var, P1).

np(Number, Var, P1, P) --> det(Number, Var, P2, P1, P), noun(Number, Var, P2).
np(Number, Var, P1, P) --> det(both, Var, P2, P1, P), noun(Number, Var, P2).
np(Number, Var, P1, P) --> det(Number, Var, P3, P2, P), noun(Number, Var, P3), relcl(Number, Var, P1, P2).
np(Number, Var, P1, P) --> det(both, Var, P3, P2, P), noun(Number, Var, P3), relcl(Number, Var, P1, P2).
np(Number, Var, P1, (P1, P)) --> noun(Number, Var, P).

np(_, Var, P1, P) --> det(both, Var, (P2 & P3) , P1, P), adj(Var, P3), noun(_, Var, P2).
np(Number, Var, P1, P) --> det(Number, Var, (P2 & P3), P1, P), adj(Var, P3), noun(_, Var, P2).

vp(Number, Var, P) --> verb(Number, Var, P).

vp(Number, Var, (P1, P)) -->  verb(Number, Var, Var1, P), adj(Var1, P1),{gensym(x, Var1)}.
vp(Number, Var, (P1, P)) -->  verb(Number, Var, Var1, P2), adj(Var1,P1), np(_, Var1, P2, P), {gensym(x, Var1)}.
vp(Number, Var, P) -->  verb(Number, Var, Var1, P1), np(_, Var1, P1, P), {gensym(x, Var1)}.
vp(Number, Var, (P1, P)) -->  beVerb(Number, Var, Var1, P), adj(Var1, P1), {gensym(x, Var1)}.

relcl(_, Var, P1, (P2, P1)) --> rel, vp(_, Var, P2).
relcl(Number, Var, P1, (P2, P1)) --> rel, np(Number, Var, P1, P2), verb(Number, Var, _, P2).

% Nouns
noun(singular, Var, boy(Var)) --> [boy].
noun(singular, Var, girl(Var)) --> [girl].
noun(singular, Var, apple(Var)) --> [apple].
noun(singular, Var, flavor(Var)) --> [flavor].
noun(singular, Var, government(Var)) --> [government].
noun(plural, Var, rabbits(Var)) --> [rabbits].
noun(plural, Var, girls(Var)) --> [girls].
noun(plural, Var, carrots(Var)) --> [carrots].
noun(plural, Var, watermelons(Var)) --> [watermelons].
noun(plural, Var, boys(Var)) --> [boys].
noun(plural, Var, governments(Var)) --> [governments].
noun(plural, Var, people(Var)) --> [people].

% Relative pronouns
rel --> [that].

% Transitive Verbs
verb(singular, Var, runs(Var)) --> [runs].
verb(singular, Var, eats(Var)) --> [eats].
verb(plural, Var, run(Var)) --> [run].
verb(plural, Var, eat(Var)) --> [eat].
verb(singular, Var, conscripts(Var)) --> [conscripts].
verb(plural, Var, contain(Var)) --> [contain].

verb(singular, Var, Var1, conscripts(Var, Var1)) --> [conscripts].
verb(singular, Var, Var1, eats(Var, Var1)) --> [eats].

% Intransitive Verbs
verb(plural, Var, Var1, like(Var, Var1)) --> [like].
verb(plural, Var, Var1, contain(Var, Var1)) --> [contain].
verb(plural, Var, Var1, eat(Var, Var1)) --> [eat].
verb(plural, Var, Var1, conscript(Var, Var1)) --> [conscript].
verb(plural, Var, Var1, taste(Var, Var1)) --> [taste].

% To be Verbs
beVerb(singular, Var, Y, is(Var, Y)) --> [is].
beVerb(plural, Var, Y, are(Var, Y)) --> [are].

% Determiners
det(plural, Var, P1, P2 , all(Var, (P1 -> P2))) --> [all].
det(singular, Var, P1, P2, exists(Var, (P1 & P2))) --> [a].
det(both, Var, P1, P2, exists(Var, (P1 & P2))) --> [some].
det(both, Var, P1, P2, exists(Var, (P1 & P2))) --> [the].

% Adjectives
adj(Var, divine(Var)) --> [divine].
adj(Var, pacifist(Var)) --> [pacifist].
adj(Var, evil(Var)) --> [evil].
adj(Var, good(Var)) --> [good].

%?- main(X).
%|: 'All boys run'.

%?- main(X).
%|: 'All boys like all watermelons that contain some divine flavor'.

%?- main(X).
%|: 'Some boy eats some apple'.