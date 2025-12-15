lista([a, b, c, d]).

kurcat([], L, L).
kurcat([X|T], L, [X|R]) :- kurcat(T, L, R).

rev([],[]).
rev([X|T], L) :- rev(T, R), kurcat(R, [X], L).

pod([_]).
pod([X, Y|T]) :- X =< Y, pod([Y|T]).

nc(X, [], Y) :- Y \= 0, fail, !.
nc(X, [X|_], 1).
nc(X, [Y|T], N) :- N1 is N - 1, nc(X, T, N1).

pos(X, [X]).
pos(X, [_]):- fail, !.
pos(X, [_|T]):- pos(X, T).

sos(X, Y, [X, Y|_]).
sos(X, Y, [Y, X|_]).
sos(X, Y, [_|L]):- sos(X, Y, L).

p(X, [X|T], T):-!.
p(X, [Y|T], [Y|Z]):- p(X, T, Z).

s(_, [], []).
s(X, [X|T], L):- s(X, T, L), !.
s(X, [Y|T], [Y|R]):- s(X, T, R).

revi([], []).
revi([X|T], L):- revi(T, L1), kurcat(L1, [X], L).


sl([X|L1], [X|L2]) :- pf(L1, L2).
sl(L1, [X2|L2]) :- sl(L1, L2).

pf([X|L1], [X|L2]) :-pf(L1, L2).
pf([],_):-!.

c(X, [X|_]).
c(X, [Y|T]):- c(X, T).

od([], []).
od([X|T], L):- c(X, T), od(T, L), !.
od([X|T], [X|L]):- \+c(X,T), od(T, L).

d1([], 0).
d1([_|L], N):- N1 is N - 1, d1(L, N1). 

d2([], 0).
d2([_|L], N1):- d2(L, N), N1 is N + 1.

mx([X], X).
mx([X|T], L):- mx(T, L1), mex(L1, X, L), !.

mex(X, Y, Z):- (X - Y =< 0 ->
    Z = Y
    ; Z = X
    ).

el([]).
el([_|_]).

ir([], []).
ir([X|T], [X|L]):- not(el(X)), !, ir(T, L).
ir([X|T], L3):-ir(X, L1), ir(T, L2), kurcat(L1, L2, L3).

cn(X, [X|_]):.
cn(X, [O|Y]):- not(el(O)), !, cn(X, Y).
cn(X, [O|Y]):- cn(X, O); cn(X, Y).

mxn([X], X).
mxn([], 0).
mxn([H|T], X):- not(el(H)), !, mxn(T, Y), X is max(H, Y).
mxn([H|T], X):- mxn(H, Hr), mxn(T, Tr), X is max(Hr, Tr). 



c(X, [X|_]):- !.
c(X,[_|L]):- c(X, L).

con([], L, L).
con([X|O], L, [X|LN]):- con(O, L, LN).

pod([_]).
pod([X, Y|L]):- X =< Y, pod([Y|L]).

nc(X, [X|_], 1).
nc(X, [_|L], N):- nc(X, L, M), N is M + 1.

