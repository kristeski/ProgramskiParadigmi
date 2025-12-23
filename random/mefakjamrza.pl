tim(vardar,skopje,[igrac(nikolov,napad,data(10,6,1980)),igrac(stoev,odbrana,data(23,8,1992))],[natprevar(pelister,rezultat(1,1)),natprevar(pobeda,rezultat(3,2))]). 
tim(pobeda, prilep, [igrac(meglenski, napad, data(27, 6, 1975)), igrac(stanoev, odbrana, data(23, 8, 1991))], [natprevar(pelister, rezultat(2, 1)), natprevar(vardar, rezultat(0, 2))]).
tim(pelister,bitola,[igrac(micevski,napad,data(12,6,1970)),igrac(nakov,odbrana,data(21,2,1978))],[natprevar(vardar,rezultat(1,0)),natprevar(pobeda,rezultat(0,1))]). 
tim(rabotnicki,skopje,[igrac(andov,napad,data(12,5,1980)),igrac(stojanov,odbrana,data(23,8, 1988))],[natprevar(pelister,rezultat(0,1)),natprevar(pobeda,rezultat(2,2))]). 

clen(X,[X|_]). 
clen(X,[_|L]):- clen(X,L). 
pobeda_doma(X):-tim(X,_,_,L), clen(natprevar(_,rezultat(P1,P2)), L), P1 > P2.
starci(X) :- tim(_,_, L, _), clen(igrac(X,_,data(_, _, G)), L), G > 1990.
rodeni1980napad(G, Prez) :- tim(_, G, L, _), clen(igrac(Prez, napad, data(_,_,God)), L), God >= 1980.

nereseno(X) :- tim(X, _, _, Natp), clen(natprevar(_, rezultat(A, A)), Natp).
neres(X, L) :- findall(X, nereseno(X), L).

pobedaa(X, L) :- findall(X, pobedi_gosti(X), L).
pobedi_gosti(X) :- tim(_, _, _, L), clen(natprevar(X, rezultat(A, B)), L), A < B.

broj_dom(X) :- tim(X,_,_,L), clen(natprevar(_, rezultat(A, B)), L), A - B > 3.
dom_dom(L) :- findall(X, broj_dom(X), N), length(N, L).
f(A, B, C) :- A > B, C is 3; A < B, C is 0; A == B, C is 1.
bodovi(T, B) :- tim(T, _, _, N), clen(natprevar(_, rezultat(A, B)), N), f(A, B, Poen), append(B, [Poen], B).

poencinja([X], X).
poencinja([X|T], Y) :- Y is X + poencinja(T, Y1).