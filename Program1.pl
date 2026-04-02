run :-
    write('Введите натуральное число n: '), read(N),
    write('Введите цифру k (0-9): '), read(K),
    
    (N < 0 -> 
        write('Ошибка: n должно быть натуральным числом'), nl
    ;
        (K < 0 ; K > 9) ->
            write('Ошибка: k должна быть цифрой от 0 до 9'), nl
        ;
            dopisat(N, K, Result),
            write('Результат: '), write(Result), nl
    ).

dopisat(N, K, Res) :-
    dopisat_v_konec(N, K, S1),
    dopisat_v_nachalo(S1, K, Res).

dopisat_v_konec(N, K, Res) :-
    Res is N * 10 + K.

dopisat_v_nachalo(N, K, Res) :-
    razryad(N, R),
    Res is K * (10 ** R) + N.

razryad(N, 1) :-
    N < 10,
    !.
razryad(N, R) :-
    N1 is N // 10,
    razryad(N1, R1),
    R is R1 + 1.