run :-
    write('Введите список: '), read(List),
    sort_select(List, Sorted),
    write('Отсортированный список: '), write(Sorted).

sort_select([], []).
sort_select(List, [Min|Rest]) :-
    find_min(List, Min),
    delete_one(List, Min, NewList),
    sort_select(NewList, Rest).

find_min([X], X).
find_min([H|T], Min) :-
    find_min(T, Min1),
    (H < Min1 -> Min = H ; Min = Min1).

delete_one([H|T], H, T).
delete_one([H|T], X, [H|R]) :-
    H \= X,
    delete_one(T, X, R).