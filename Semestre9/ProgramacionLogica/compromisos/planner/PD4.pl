% Operators
opn(unstack(X,Y),
    [on(X,Y), clear(X), handempty],
    [clear(Y), holding(X)],
    [on(X,Y), clear(X), handempty]).

opn(putdown(X),
    [holding(X)],
    [ontable(X), clear(X), handempty],
    [holding(X)]).

opn(pickup(X),
    [ontable(X), clear(X), handempty],
    [holding(X)],
    [ontable(X), clear(X), handempty]).

opn(stack(X,Y),
    [clear(Y), holding(X)],
    [on(X,Y), clear(X), handempty],
    [clear(Y), holding(X)]).

% Utilities for LBS
is_subset([], _).
is_subset([H|T], S) :-
    member(H, S),
    is_subset(T, S).

delete_list([], _, []).
delete_list([H|T], S, T_new) :-
    member(H, S),
    delete_list(T, S, T_new),!.
delete_list([H|T], S, [H|T_new]) :-
    delete_list(T, S, T_new), !.

% Utilities for MBS
check([]).
check([H|T]) :-
    H, check(T).

deleteFH([]).
deleteFH([H|T]) :-
     retract(H),
    deleteFH(T).

addTH([]).
addTH([H|T]) :-
    assertz(H),
    addTH(T).

getResult(X, Res) :- X, Res = true, !.
getResult(_, false).


% Planner LBS
solveLS(State, Goal, SoFar, Plan):-
    is_subset(Goal, State),
    reverse(SoFar, Plan).

solveLS(State, Goal, Sofar, Plan):-
    opn(Op, Precons, Add, Delete),
    is_subset(Precons, State),
    \+ member(Op, Sofar),
    delete_list(State, Delete, Remainder),
    append(Add, Remainder, NewState),
    solveLS(NewState, Goal, [Op|Sofar], Plan),
    !.

getPlanLS(State, Goal, Plan) :-
    solveLS(State, Goal, [], Plan).


% Planner MBS
solveMS(Goal, SoFar, Plan):-
    check(Goal),
    reverse(SoFar, Plan).

solveMS(Goal, Sofar, Plan):-
    opn(Op, Precons, Add, Delete),
    check(Precons),
    \+member(Op, Sofar),
    deleteFH(Delete),
    addTH(Add),
    getResult(solveMS(Goal, [Op|Sofar], Plan), R),
    deleteFH(Add),
    addTH(Delete),
    R = true,
    !.

getPlanMS(State, Goal, Plan) :-
    addTH(State),
    solveMS(Goal, [], Plan),
    deleteFH(State).

testCase([ontable(a), on(c, a), clear(c), ontable(b), clear(b), handempty],
         [ontable(c), on(b, c), on(a, b), clear(a), handempty]).

testCase([ontable(c), on(b, c), on(a, b), clear(a), handempty],
         [ontable(a), on(c, a), clear(c), ontable(b), clear(b), handempty]).

testCase([ontable(d), on(a, d), on(b, a), clear(b), ontable(c), clear(c), handempty],
         [ontable(d), on(c, d), on(b, c), on(a, b), clear(a), handempty]).

testCase([ontable(a), clear(a), ontable(b), clear(b), ontable(c), clear(c), handempty], [ontable(c), on(b,c), on(a,b), clear(a), handempty]).


run :-
    testCase(State, Goal),
    write(' ===== Testcase ======'), nl,
    write(' State: '), write(State), nl,
    write(' Goal: '), write(Goal), nl, nl,
    write(' == LBS == '), nl,
    time(getPlanLS(State, Goal, PlanLS)),
    write(' Plan: '), write(PlanLS), nl, nl,
    write(' == MBS == '), nl,
    time(getPlanMS(State, Goal, PlanMS)),
    write(' Plan: '), write(PlanMS), nl,
    write(' ===== End TestCase ======'), nl, nl.