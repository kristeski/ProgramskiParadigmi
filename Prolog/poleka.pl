relation(a, b).
relation(b, c).
relation(c, d).
relation(d, e).
relation(e, f).
relation(f, g).
relation(g, h).
relation(h, i).

hom(g).
hom(e).
e_ped(X) :- hom(X); rel(X, Y), hom(Y).
rel(X, Y) :- relation(X, Y); relation(X, Z), rel(Z, Y).

is_r(X, Y) :- relation(X, Y); relation(Y, X);
    X = Y;
    relation(X, Z) , is_r(Z, Y);
    is_r(Y, X).


per([a, b, c, d, e, f]).

concat_lists([], L, L).
concat_lists([H | T], L, [H | R]) :- concat_lists(T, L, R).

show(List) :-
    member(Element, List),
    write(Element),
    nl,
    fail.

:- write('Brej'), nl.

:- op(500, xfy, '++').

'++'(X, Y) :-
    concat_lists(X, Y, R),
    write(R), nl.

%add element if not in list
add(Element, List, R) :-
    member(Element, List), !.
add(Element, List, [Element | List]).


site_zafateni(Persons) :-
    findall(X, vrska(X, _); vrska(_,X), L),
    sort(L, Persons).

