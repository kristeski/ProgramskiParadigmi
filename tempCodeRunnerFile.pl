len([], N).
len([_| T], N) :- N is N + 1,
    len(T, N).