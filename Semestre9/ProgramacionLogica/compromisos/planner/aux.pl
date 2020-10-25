
:- dynamic test1/1.
% Simple STRIPS-like planner

test0(Plan):-
    solve(
        [
            % Intial state
            connects(door1, room1, corridor),
            connects(door2, room2, corridor),
            connects(door3, room3, corridor),
            connects(door4, room4, corridor),
            connects(door1, corridor, room1), 
            connects(door2, corridor, room2),
            connects(door3, corridor, room3),
            connects(door4, corridor, room4),

            % Shakey initial position
            pos(shakey, room3),
            
            % % Boxes initial status
            at(box1, room1),
            at(box2, room1),

            on(shakey, floor),

            sRoom(switch1, room1),
            sRoom(switch2, room2),
            sRoom(switch3, room3),
            sRoom(switch4, room4),
            sRoom(switch5, corridor),

            % Status of the light
            turnedOn(switch1),
            turnedOn(switch2),
            turnedOn(switch3),
            turnedOn(switch4),
            turnedOn(switch5)
        ],
        [
            % Shakey Final position
            pos(shakey, room1),

            % Boxes Final position
            at(box1, room1),
            at(box2, room2),

            on(shakey, floor),

            % Status of the light
            turnedOn(switch1),
            turnedOn(switch2),
            turnedOn(switch3),
            turnedOn(switch4),
            turnedOn(switch5)
        ],
        Plan).

test(Plan):-
    solve(
        [
            % Intial state
            connects(door1, room1, corridor),
            connects(door2, room2, corridor),
            connects(door3, room3, corridor),
            connects(door4, room4, corridor),
            connects(door1, corridor, room1), 
            connects(door2, corridor, room2),
            connects(door3, corridor, room3),
            connects(door4, corridor, room4),

            % Shakey initial position
            pos(shakey, room3),
            
            % % Boxes initial status
            at(box1, room1),
            at(box2, room2),

            on(shakey, floor),

            sRoom(switch1, room1),
            sRoom(switch2, room2),
            sRoom(switch3, room3),
            sRoom(switch4, room4),
            sRoom(switch5, corridor),

            % Status of the light
            turnedOff(switch1),
            turnedOff(switch2),
            turnedOn(switch3),
            turnedOn(switch4),
            turnedOn(switch5)
        ],
        [
            % Shakey Final position
            pos(shakey, room4),

            % Boxes Final position
            at(box1, room2),
            at(box2, room1),

            on(shakey, floor),

            % Status of the light
            turnedOn(switch1),
            turnedOn(switch2),
            turnedOn(switch3),
            turnedOn(switch4),
            turnedOn(switch5)
        ],
        Plan).

test1(Plan):-
    solve(
        [
            % Intial state
            connects(door1, room1, corridor),
            connects(door2, room2, corridor),
            connects(door3, room3, corridor),
            connects(door4, room4, corridor),
            connects(door1, corridor, room1), 
            connects(door2, corridor, room2),
            connects(door3, corridor, room3),
            connects(door4, corridor, room4),

            % Shakey initial position
            pos(shakey, room3),
            
            % % Boxes initial status
            at(box1, room1),
            at(box2, room2),

            on(shakey, floor),

            sRoom(switch1, room1),
            sRoom(switch2, room2),
            sRoom(switch3, room3),
            sRoom(switch4, room4),
            sRoom(switch5, corridor),

            % Status of the light
            turnedOff(switch1),
            turnedOff(switch2),
            turnedOn(switch3),
            turnedOn(switch4),
            turnedOn(switch5)
        ],
        [
            % Shakey Final position
            pos(shakey, room4),

            % Boxes Final position
            at(box1, room1),
            at(box2, room1),

            on(shakey, floor),

            % Status of the light
            turnedOn(switch1),
            turnedOn(switch2),
            turnedOn(switch3),
            turnedOn(switch4),
            turnedOn(switch5)
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

opn(go(X, Y),
    [pos(shakey, X), connects(_, X, Y), on(shakey,floor), sRoom(S,X), turnedOn(S)],
    [pos(shakey, X)],
    [pos(shakey, Y)]
).

opn(climbOn(B), 
    [at(B, X), pos(shakey, X), on(shakey, floor), sRoom(S,X), turnedOff(S)],
    [on(shakey, floor)],
    [on(shakey, B)]
).

opn(turnOn(S), 
    [sRoom(S, X), at(B, X), on(shakey, B),turnedOff(S)],
    [turnedOff(S)],
    [turnedOn(S)]
).

opn(getDown(B),
    [at(B, X), pos(shakey, X), on(shakey, B)],
    [on(shakey, B)],
    [on(shakey, floor)]
).


opn(push(X, Y, B),
    [pos(shakey, X), at(B,X), connects(_, X, Y), on(shakey,floor), sRoom(S,X), turnedOn(S)],
    [pos(shakey, X), at(B, X)],
    [pos(shakey, Y), at(B, Y)]
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

main :- 
    test(P),
    test1(P).