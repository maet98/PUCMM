:- dynamic test1/1.
% Simple STRIPS-like planner

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
            unloaded,
            
            % % Boxes initial status
            at(box1, room1),
            at(box2, room1),
            at(box3, room1),
            at(box4, room1),

            on(shakey, floor),
            on(box1, floor),
            on(box2, floor),
            on(box3, floor),
            on(box4, floor),

            sRoom(switch1, room1),
            sRoom(switch2, room2),
            sRoom(switch3, room3),
            sRoom(switch4, room4),
            sRoom(switch5, corridor),

            % Status of the light
            status(switch1, on),
            status(switch2, on),
            status(switch3, on),
            status(switch4, on),
            status(switch5, on)
        ],
        [
            % Shakey initial status
            pos(shakey, room4),
            unloaded,

            % Boxes initial position
            at(box1, room1),
            at(box2, room2),
            at(box3, room1),
            at(box4, room1),

            on(shakey, floor),
            on(box1, floor),
            on(box2, floor),
            on(box3, floor),
            on(box4, floor),

            % Status of the light
            status(switch1, on),
            status(switch2, on),
            status(switch3, on),
            status(switch4, on),
            status(switch5, on)
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
            unloaded,
            
            % % Boxes initial status
            at(box1, room1),
            at(box2, room1),
            at(box3, room1),
            at(box4, room1),

            on(shakey, floor),
            on(box1, floor),
            on(box2, floor),
            on(box3, floor),
            on(box4, floor),

            sRoom(switch1, room1),
            sRoom(switch2, room2),
            sRoom(switch3, room3),
            sRoom(switch4, room4),
            sRoom(switch5, corridor),

            % Status of the light
            status(switch1, on),
            status(switch2, on),
            status(switch3, on),
            status(switch4, on),
            status(switch5, on)
        ],
        [
            % Shakey initial status
            pos(shakey, room2),
            unloaded,

            % Boxes initial position
            at(box1, room1),
            at(box2, room2),
            at(box3, room3),
            at(box4, room4),

            on(shakey, floor),
            on(box1, floor),
            on(box2, floor),
            on(box3, floor),
            on(box4, floor),

            % Status of the light
            status(switch1, on),
            status(switch2, on),
            status(switch3, on),
            status(switch4, on),
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

opn(go(X, Y),
    [pos(shakey, X), connects(_, X, Y), sRoom(S, X), status(S, on), unloaded],
    [pos(shakey, X)],
    [pos(shakey, Y)]
).

opn(push(X, Y, B),
    [pos(shakey, X), connects(_, X, Y), sRoom(S, X), status(S, on), on(B, shakey), loaded],
    [pos(shakey, X), at(B, X)],
    [pos(shakey, Y), at(B, Y)]
).

opn(pickUp(B),
    [pos(shakey, X), at(B, X), on(shakey,floor), on(B, floor), unloaded],
    [on(B, floor), unloaded],
    [on(B, shakey), loaded]
).

opn(putDown(B),
    [on(B, shakey), loaded],
    [on(B, shakey), loaded],
    [on(B, floor), unloaded]
).

opn(climbOn(X, B), 
    [at(B, X), pos(shakey, X), on(shakey, floor), on(B, floor), unloaded],
    [on(shakey, floor)],
    [on(shakey, B)]
).
opn(getDown(B),
    [on(shakey, B), on(B, floor)],
    [on(shakey, B)],
    [on(shakey, floor)]
).

opn(turnOn(X, B), 
    [at(B, X), on(shakey, floor),  pos(shakey, X), sRoom(S, X), status(S, off)],
    [status(S, off)],
    [status(S, on)]
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