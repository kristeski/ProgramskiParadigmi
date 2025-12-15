arc(1, 2).
arc(1, 3).
arc(2, 4).
arc(2, 5).
arc(3, 6).
arc(3, 7).
arc(6, 8).
arc(8, 9).
arc(7, 9).
arc(4, 8).

path(A, B) :- 
    arc(A, B); arc(A, C), path(C, B).