run :-
    % Животные
    petr(P),
    lena(L),
    tanya(T),
    
    % Все разные
    P \= L,
    P \= T,
    L \= T,
    
    % Условия
    P \= koshka,           % Петя не любит кошек
    P \= homyak,           % Петя не хозяин хомячка
    T = koshka,            % Таня гуляет с кошкой
    
    % Вывод
    write('Петя гуляет с '), write(P), nl,
    write('Лена гуляет с '), write(L), nl,
    write('Таня гуляет с '), write(T), nl.

petr(sobaka).
petr(koshka).
petr(homyak).

lena(sobaka).
lena(koshka).
lena(homyak).

tanya(sobaka).
tanya(koshka).
tanya(homyak).