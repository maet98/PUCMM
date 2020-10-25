% Simple STRIPS-like planner

test1(Plan):-
    solve(
        [
            connects(door1, room1, corridor),
            connects(door2, room2, corridor),
            connects(door3, room3, corridor),
            connects(door4, room4, corridor),
            connects(door1, corridor, room1), 
            connects(door2, corridor, room2),
            connects(door3, corridor, room3),
            connects(door4, corridor, room4),

            pos(shakey, room3),
            
            at(box1, room1),
            at(box2, room1),
            at(box3, room3),
            at(box4, room1),

            on(shakey, floor),
            
            sRoom(switch1, room1),
            sRoom(switch2, room2),
            sRoom(switch3, room3),
            sRoom(switch4, room4),
            sRoom(switch5, corridor),

            status(switch1, on),
            status(switch2, off),
            status(switch3, off),
            status(switch4, off),
            status(switch5, on)
        ],
        [
            pos(shakey, room4),
            
            at(box1, room1),
            at(box2, room2),
            at(box3, room1),
            at(box4, room1),

            onS(shakey, floor),

            status(switch1, on),
            status(switch2, on),
            status(switch3, on),
            status(switch4, off),
            status(switch5, on)
        ],
        Plan).

solve(State, Goal, Plan):-
    solve(State, Goal, [], Plan).

% This predicate produces the plan. Once the Goal list is a subset
% of the current State the plan is complete and it is written to
% the screen using write_sol/1.

solve(State, Goal, Plan, Plan):-
	is_subset(Goal, State), nl,
	write_sol(Plan).

solve(State, Goal, Sofar, Plan):-
	opn(Op, Preconditions, Delete, Add),
    % write(Op), nl,
	is_subset(Preconditions, State),
	\+ member(Op, Sofar),
	delete_list(Delete, State, Remainder),
	append(Add, Remainder, NewState),
	% write(Op), nl,   % Show the operators it is trying to apply
	solve(NewState, Goal, [Op|Sofar], Plan), !.

% Operators.

opn(go(X, Y, S),
    [on(shakey, floor), pos(shakey, X), connects(_, X, Y), sRoom(S, X), status(S, on), unloaded(shakey)],
    [pos(shakey, X)],
    [pos(shakey, Y)]
).

opn(push(X, Y, B, S),
    [onS(shakey, floor), on(B, shakey), pos(shakey, X), at(B, X), connects(_, X, Y), sRoom(S, X), status(S, on), loaded(shakey)],
    [pos(shakey, X), at(B, X)],
    [pos(shakey, Y), at(B, Y)]
).

opn(climbOn(X, B), 
    [at(B, X), pos(shakey, X), onS(shakey, floor), on(B, floor), unloaded(shakey)],
    [onS(shakey, floor)],
    [onS(shakey, B)]
).

opn(turnOn(X, B, S), 
    [at(B, X), onS(shakey, B), on(B, floor), pos(shakey, X), sRoom(S, X), status(S, off), unloaded(shakey)],
    [status(S, off)],  
    [status(S, on)]
).

opn(getDown(B),
    [onS(shakey, B), on(B, floor)],
    [onS(shakey, B)],
    [onS(shakey, floor)]
).

opn(pickUp(B, X),
    [pos(shakey, X), at(B, X), onS(shakey, floor), on(B, floor), unloaded(shakey)],
    [on(B, floor), unloaded(shakey)],
    [on(B, shakey), loaded(shakey)]
).

opn(putDown(B, X),
    [at(B, X), pos(shakey, X), on(B, shakey), loaded(shakey)],
    [on(B, shakey), loaded(shakey)],
    [on(B, floor), unloaded(shakey)] 
).


% Utility predicates.

% Check is first list is a subset of the second

is_subset([H|T], Set):-
    member(H, Set),
    is_subset(T, Set).
is_subset([], _).

% Remove all elements of 1st list from second to create third.

delete_list([H|T], List, Final):-
    remove(H, List, Remainder),
    delete_list(T, Remainder, Final).
delete_list([], List, List).

remove(X, [X|T], T).
remove(X, [H|T], [H|R]):-
    remove(X, T, R).

write_sol([]).
write_sol([H|T]):-
	write_sol(T),
	write(H), nl.

% main :- 
%     test(P),
%     reverse(P, Ans),
%     write(Ans),
%     test1(P1),
%     reverse(P1, Ans1),
%     write(Ans1).