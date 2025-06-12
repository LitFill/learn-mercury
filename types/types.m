:- module types.

:- interface.
:- import_module io.
:- import_module list.

:- pred main(io::di, io::uo) is det.

:- func mymap(func(T1) = T2, list(T1)) = list(T2).

:- implementation.

main(!IO) :-
    io.write_string("Hello, Mercury!", !IO).

mymap(_, [])       = [].
mymap(F, [X | Xs]) = [F(X) | map(F, Xs)].
