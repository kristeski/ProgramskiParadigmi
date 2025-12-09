lichnost(teo).
lichnost(mira).
lichnost(bruno).
lichnost(igor).

:- dynamic hrana/2. % za da moze da dodavame fakti
hrana(mira, pita).
hrana(teo, sendvich).

:-dynamic maica/2.
maica(bruno, zholta).
maica(devojka, bela).

:- dynamic mesto/2. % za da moze da dodavame fakti
mesto(teo, 1).

hobi(mira, krstozbor).
hobi(igor, cita).

devojka(mira).
hobi_vo_hrana(cita, hamburger).

:- dynamic smesten/1.
smesten(teo). %teo e najlevo

%koj nosi maica vo boja B
boja_maica(Lichnost, B):-
    maica(Lichnost, B), lichnost(Lichnost), !;
    devojka(Lichnost), maica(devojka, B), !, assertz(maica(Lichnost, bela)).

%lichnosta sto saka nekoe hobi koe povlekuva hrana
hrana_hobi() :-
    hobi_vo_hrana(Hobi, Hrana), lichnost(L), hobi(L, Hobi), !, assertz(hrana(L, Hrana)).

%lichnosta sto jade pita sedi pokraj teo
lichnosta_do_teo() :-
    lichnost(X), hrana(X, pita), mesto(teo, Y1), Y is Y1 + 1, !,assertz(mesto(X, Y)), !, assertz(smesten(X)).

%Bruno sedi pokraj onoj sto saka pica
smesten(bruno).
bruno_do_pica():-
    lichnost(L), hrana(L, pica), mesto(L, Y1), Y is Y1 + 1, !, assertz(mesto(bruno, Y)).

%lichnosta sto sedi pokraj onaa so bela maica saka pica
lichnosta_do_devojceto() :-
    lichnost(L), \+smesten(L), boja_maica(L1, bela), mesto(L1, Y1), Y is Y1 + 1, !, assertz(hrana(L, pica)), !, assertz(mesto(L, Y)).

%sina maica ima licnosta koja sedi desno od devojkata
desno_dev():-
    devojka(X), mesto(X, Y), Y1 is Y + 1, mesto(L, Y1), !, assertz(maica(L, sina)).

getans(L, Hr, Ho, Ma, Me):-
    hrana(L, Hr), hobi(L, Ho), maica(L, Ma), mesto(L, Me).

reshenie(L) :-
    lichnost(X), getans(X, Hr, Ho, Ma, Me), L = [L|[X, Hr, Ho, Ma, Me]].
