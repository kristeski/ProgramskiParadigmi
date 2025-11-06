%zadaca 1
nep_pal(List) :- length(List, N),
    1 is (N mod 2),
    reverse(List, List).
%zadaca 2
clen(X, []) :- fail.
clen(X, [X | Y]) :- !.
clen(X, [H | T]) :- clen(X, T).

concat([], L, L).
concat([H | T], L, [H | R]) :- concat(T, L, R).

podredena([X]).
podredena([X, Y | Z]) :-
    X =< Y,
    podredena([Y | Z]),
    write([Y | Z]), nl,
    write([Y | Z]), nl,
    concat([Y], Z, L),
    write(L), nl.

n_clen(X, [X|_], 1).
n_clen(X, [_|T], N) :-
    N > 1,
    N1 is N - 1,
    n_clen(X, T, N1).

pos(X, [X]).
pos(X, [_|T]) :- pos(X, T).
    
sosedni(X, Y, [X, Y|_]).
sosedni(X, Y, [_|T]):-sosedni(X, Y, T).

br_p(X, [X|T], T).
br_p(X, [Y|T], [Y|R]) :-
    br_p(X, T, R).



br_s(_, [], []).
br_s(X, [X|T], R):-
    br_s(X, T, R),!.
br_s(X, [Y|T], [Y|R]):-
    br_s(X, T, R).

rev([], []).
rev([X|T], L):- rev(T, R), concat(R, [X], L).