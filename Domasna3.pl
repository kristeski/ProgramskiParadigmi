ime(teo).   ime(mira).  ime(bruno).  ime(igor).
hrana(sendvic).
hrana(pita).
hrana(hamburger).
hrana(pica).
hobi(krstozbori).
hobi(pishuvanje).
hobi(citanje).
hobi(fotografija).
maica(bela).
maica(zolta).
maica(sina).
maica(crvena).
dev(mira). 
fakt1_pos(teo, 1).
fakt1_hrana(teo, sendvic).
fakt2_hobi(mira, krstozbori).
fakt2_hrana(mira, pita).
fakt3_maica(bela).
fakt4_maica(bruno, zolta).
fakt5_relation(pishuvanje, hamburger).
fakt6_pokrajteo(pita).
fakt7_sosed_bruno(pica).
fakt8_bela_sosed_pica(bela).
fakt9_hobi(igor, citanje).
fakt10_desno_sina(sina).
sosed(1,2).
sosed(2,1).
sosed(2,3).
sosed(3,2).
sosed(3,4).
sosed(4,3).
all_diff([]).
all_diff([H|T]) :- + member(H,T), all_diff(T).
reshenie(L) :-
    PosT = 1,
    member(PosM, [2,3,4]),
    member(PosB, [2,3,4]),
    member(PosI, [2,3,4]),
    all_diff([PosT,PosM,PosB,PosI]),
    HrT = sendvic,
    HrM = pita,
    hrana(HrB),
    hrana(HrI),
    HobM = krstozbori,
    HobI = citanje,
    hobi(HobT),
    hobi(HobB),
    MaiM = bela,
    MaiB = zolta,
    maica(MaiT),
    maica(MaiI),
    (HobT = pishuvanje -> HrT = hamburger ; true),
    (HobB = pishuvanje -> HrB = hamburger ; true),
    (HobI = pishuvanje -> HrI = hamburger ; true),
    (HobM = pishuvanje -> HrM = hamburger ; true),
    sosed(PosT, PosM),
    (HrT = pica -> sosed(PosB, PosT) ; true),
    (HrM = pica -> sosed(PosB, PosM) ; true),
    (HrI = pica -> sosed(PosB, PosI) ; true),
    sosed(PosM, PosP),
    (
        (PosP = PosT, HrT = pica);
        (PosP = PosB, HrB = pica);
        (PosP = PosI, HrI = pica)
    ),
    PosSina is PosM + 1,
    (
        (PosSina = PosT, MaiT = sina);
        (PosSina = PosB, MaiB = sina);
        (PosSina = PosI, MaiI = sina)
    ),
    all_diff([HrT,HrM,HrB,HrI]),
    all_diff([HobT,HobM,HobB,HobI]),
    all_diff([MaiT,MaiM,MaiB,MaiI]),
    L = [
        (teo,  HrT, HobT, MaiT),
        (mira, HrM, HobM, MaiM),
        (igor, HrI, HobI, MaiI),
        (bruno,HrB, HobB, MaiB)
    ].