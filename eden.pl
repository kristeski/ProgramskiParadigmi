bigger(elephant, horse).
bigger(horse, donkey).
bigger(donkey, dog).
bigger(donkey, monkey).

is_bigger(X, Y) :- bigger(X, Y).
is_bigger(X, Y) :- bigger(X, Z), is_bigger(Z, Y).

[elephant, horse, donkey, dog]
[a, X, [], f(X,y), 47, [a,b,c], bigger(cow,dog)]
