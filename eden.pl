listicka([elephant, horse, monkey])
drugalista([monkey, dog, donkey])

list1([a, b, c]).
list2([c, d, e]).

my_append([], L, L).
my_append([H|T], L, [H|R]) :-
    my_append(T, L, R).

father(vladimir, kristijan).
father(zoran, marko).
father(miki, marika).
father(martin, petar).
father(kristijan, peso).
father(kristijan, damjan).

mother(maja, marika).
mother(daniela, kristijan).
mother(strumfeta, damjan).
mother(biljana, peso).
mother(marina, marko).


parent(X, Y) :-
    father(X, Y);
    mother(X, Y).

ancestor(X, Y) :-
    parent(X, Y).

ancestor(X, Y) :-
    parent(X, Z),
    ancestor(Z, Y).

