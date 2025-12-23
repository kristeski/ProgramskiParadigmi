arc(1, 2).
arc(1, 3).
arc(2, 4).
arc(2, 5).
arc(5, 6).
arc(3, 7).
arc(6, 8).
arc(8, 9).
arc(7, 9).
arc(4, 8).

path(A, B) :- arc(A, B).
path(A, B) :- arc(A, C), path(C, B).

getp(A, B, [A, B]) :- arc(A, B).
getp(A, B, [A|L]) :- arc(A, C), getp(C, B, L).

pathc(A, B, [B]) :- arc(A, B).
pathc(A, C, [B|L]) :- arc(A, B), pathc(B, C, L).

tocka(1, 1).
tocka(2, 3).
tocka(4,1).
tocka(5, 3).
tocka(6, 1).
otsecka(tocka(1, 1), tocka(2, 3)).
triagolnik(tocka(4, 1), tocka(6, 1), tocka(5, 3)).
cetv(tocka(X, Y), tocka(X1, Y1), tocka(X2, Y2), tocka(X3, Y3)).

vertikalna(otsecka(tocka(X,_), tocka(X,_))).
horizontalna(otsecka(tocka(_,Y), tocka(_, Y))).

pojavuva(_, [], 0).
pojavuva(H, [H|T], M) :- pojavuva(H, T, N),!, M is N + 1.
pojavuva(H, [_|T], M) :- pojavuva(H, T, M).

pravoagolnik(tocka(X,Y), tocka(X1, Y1), tocka(X2, Y2), tocka(X3, Y3)) :-
    xS = [X, X1, X2, X3], yS = [Y, Y1, Y2, Y3],
    pojavuva(X, xS, N1), pojavuva(X1, xS, N2), pojavuva(X2, xS, N3),
    pojavuva(Y, yS, N6), pojavuva(Y1, yS, N5), pojavuva(Y2, yS, N4), N1 == 2, N2 == 2, N3 == 2, N4 == 2, N5 == 2, N6 == 2.

% pravoagolnik(+P1,+P2,+P3,+P4) succeeds if the four points form an axis-aligned rectangle
pravoago(P1, P2, P3, P4) :-
    P1 = tocka(X1,Y1), P2 = tocka(X2,Y2),
    P3 = tocka(X3,Y3), P4 = tocka(X4,Y4),

    % get the distinct X and Y values
    sort([X1,X2,X3,X4], Xs), Xs = [XA,XB],
    sort([Y1,Y2,Y3,Y4], Ys), Ys = [YA,YB],

    % build the expected 4 corner points (all combinations)
    Expected = [tocka(XA,YA), tocka(XA,YB), tocka(XB,YA), tocka(XB,YB)],

    % compare sorted lists of given points vs expected points
    sort([P1,P2,P3,P4], GivenSorted),
    sort(Expected, ExpectedSorted),
    GivenSorted == ExpectedSorted.


sem(tat, maj, l_dec).
lic(ime, prez, data, job).

sem(lic(trajko,trajkovski,data(7,maj,1950),raboti(mrtv,20000)), 
lic(persa,trajkovska,data(1,jan,1952),nevraboteno),  
[lic(petko,trajkovski,data(5,maj,1973),nevraboteno)]). 

data_na_rag(lice(_,_,Data,_), Data).

plata_lic(lice(_,_,_,job(_, Y)), Y). 
plata_lic(lice(_,_,_,nevraboteno), 0).
rod_1990(X) :- dete(X), data_na_rag(X, data(_, _, 1990)).

dete(zoki,kiro). 
dete(kiro,pero). 
dete(pero,joco). 
dete(joco,mile). 
dete(toso,kocev). 
dete(caci,karov). 
potomok(X,Y) :- dete(X,Y).        
potomok(X,Y) :- dete(X,Z), potomok(Z,Y).

covek(X) :- dete(X,_).
covek(X) :- dete(_,X).


tim(ime,grad,lista_na_igraci,lista_na_natprevari)
tim(vardar,skopje,[igrac(nikolov,napad,data(10,6,1980)),igrac(stoev,odbrana,data(23,8,1992)
)],[natprevar(pelister,rezultat(3,1)),natprevar(pobeda,rezultat(2,2))]). 

tim(pobeda,prilep,[igrac(meglenski,napad,data(27,6,1975)),igrac(stanoev,odbrana,data(23,8,1
991))],[natprevar(pelister,rezultat(2,1)),natprevar(vardar,rezultat(0,2))]). 

tim(pelister,bitola,[igrac(micevski,napad,data(12,6,1970)),igrac(nakov,odbrana,data(21,2,197
8))],[natprevar(vardar,rezultat(1,0)),natprevar(pobeda,rezultat(0,1))]).

tim(rabotnicki,skopje,[igrac(andov,napad,data(12,5,1980)),igrac(stojanov,odbrana,data(23,8,
1988))],[natprevar(pelister,rezultat(0,1)),natprevar(pobeda,rezultat(2,2))]). 

clen(X,[X|_]). 
clen(X,[Y|L]):- X\==Y, clen(X,L). 
prezime(X) :- tim(_, _, L, _), clen(igrac(X, _, data(_,_,Y)), L), Y > 1990.