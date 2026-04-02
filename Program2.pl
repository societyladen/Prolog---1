run :-
    write('Введите список: '), read(List),
    
    % Находим положительные числа
    pos(List, P),
    
    (P = [] -> 
        write('Нет положительных элементов')
    ;
        min(P, Min),
        max(P, Max),
        
        % Проверяем, все ли числа от Min до Max положительные
        (all_positive(Min, Max, List) ->
            step(Min, Low),
            step(Max, High),
            write('Ответ: между '), write(Low), write(' и '), write(High)
        ;
            write('Нет такого случая - не все числа в диапазоне положительные')
        )
    ).

% Все ли числа от A до B присутствуют и положительные
all_positive(A, B, List) :-
    A =< B,
    member(A, List),
    A > 0,
    Next is A + 1,
    all_positive(Next, B, List).
all_positive(A, B, _) :- A > B.

% Выбираем положительные числа
pos([], []).
pos([H|T], [H|R]) :- H > 0, pos(T, R).
pos([H|T], R) :- H =< 0, pos(T, R).

% Минимум
min([X], X).
min([H|T], M) :- min(T, M1), (H < M1 -> M = H ; M = M1).

% Максимум  
max([X], X).
max([H|T], M) :- max(T, M1), (H > M1 -> M = H ; M = M1).

% Степень числа
step(N, 1) :- N =< 2, !.
step(N, S) :- step(N, 1, 2, S).

step(N, S, P, S) :- P >= N, !.
step(N, S, P, Res) :- S1 is S + 1, P1 is P * 2, step(N, S1, P1, Res).

% Проверка принадлежности элементу списка
member(H, [H|_]).
member(H, [_|T]) :- member(H, T).