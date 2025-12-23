lice(1,petko,petkovski,m,datum(1,3,1950),kratovo,skopje). 
lice(2,marija,petkovska,z,datum(30,5,1954),kumanovo,skopje). 
lice(3,ljubica,petkovska,z,datum(29,11,1965),skopje,skopje). 
lice(4,vasil,vasilev,m,datum(8,4,1954),bitola,bitola). 
lice(5,elena,vasileva,z,datum(19,6,1958),resen,bitola). 
lice(6,krste,krstev,m,datum(9,8,1948),veles,veles). 
lice(7,biljana,krsteva,z,datum(13,8,1949),veles,veles). 
lice(8,igor,krstev,m,datum(26,10,1971),veles,skopje). 
lice(9,kristina,krsteva,z,datum(30,5,1974),kumanovo,skopje). 
lice(10,julija,petrova,z,datum(30,5,1978),skopje,skopje). 
lice(11,bosko,petkovski,m,datum(13,11,1981),skopje,skopje). 
lice(12,gjorgji,vasilev,m,datum(15,7,1978),bitola,bitola). 
lice(13,katerina,petkovska,z,datum(11,12,1979),bitola,skopje). 
lice(14,petar,vasilev,m,datum(21,2,1982),skopje,skopje). 
lice(15,andrej,krstev,m,datum(3,8,1998),skopje,skopje). 
lice(16,martina,petkovska,z,datum(5,12,2005),skopje,skopje).

familija(1,2,[9,10]). 
familija(1,3,[11]). 
familija(4,5,[12,13,14]). 
familija(6,7,[8]). 
familija(8,9,[15]). 
familija(11,13,[16]).

clen(X, [X|_]).
clen(X, [_|T]) :- clen(X, T).

dolzina([], 0).
dolzina([_|T], N) :-
    dolzina(T, N1),
    N is N1 + 1.

rodeni_razlicen_grad(Ctr) :-
    findall(Mrd,
        (
            familija(St, Sm, Lsm),
            lice(St, _, _, _, _, Mrt, _),        
            lice(Sm, _, _, _, _, Mrm, _),        
            clen(Child, Lsm),                    
            lice(Child, _, _, _, _, Mrd, _),     
            Mrd \= Mrt,
            Mrd \= Mrm
        ),
    L),
    sort(L, Unik),    
    dolzina(Unik, Ctr).
//

den(D, M, Dens) :-
    Dens is (M - 1) * 30 + D.

ok(D1, M1, D2, M2) :-
    den(D1, M1, Dens1),
    den(D2, M2, Dens2),
    Diff is abs(Dens1 - Dens2),
    Diff =< 7.

tatkovci(Child, Tatko) :-
    lice(Child, _, _, _, datum(Dc, Mc, _), _, _),
    familija(Tatko, _, Children),
    clen(Child, Children),
    lice(Tatko, _, _, _, datum(Df, Mf, _), _, _),
    ok(Dc, Mc, Df, Mf).

majki(Child, Majka) :-
    lice(Child, _, _, _, datum(Dc, Mc, _), _, _),
    familija(_, Majka, Children),
    clen(Child, Children),
    lice(Majka, _, _, _, datum(Dm, Mm, _), _, _),
    ok(Dc, Mc, Dm, Mm).

predci(Sifra, L) :-
    lice(Sifra, _, _, Pol, _, _, _),
    ( Pol == m -> findall(F, tatkovci(Sifra, F), L)
    ; Pol == z -> findall(M, majki(Sifra, M), L)
    ; L = []
    ).
