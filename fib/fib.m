:- module
    fib.

:- interface.
:- import_module
    io.

:- pred
    main(io::di, io::uo)
    is det.

:- implementation.
:- import_module
    int,
    list,
    string.

:- pred fib(
            int :: in,
            int :: out
        ) is det.
fib(N, X) :-
    (   if N =< 2
        then X = 1
        else fib(N - 1, A), fib(N - 2, B), X = A + B
    ).

:- func fib(int) = int.
fib(N) =
    (if N =< 2 then 1 else fib(N - 1) + fib(N - 2)).

main(!IO) :-

/*
    fib(20, X),
    write_string("fib(20, ", !IO),
    write_int(X, !IO),
    write_string(")\n", !IO),

    write_string("fib(20) = ", !IO),
    write_int(fib(20), !IO),
    write_string("\n", !IO),
*/

/*
    io.read_line_as_string(Result, !IO),
    ( if Result = eof
    then
        write_string("bye mfuxker...\n", !IO)
    else if Result = ok(String), to_int(strip(String), N)
    then
        io.format("fib(%d) = %d\n", [i(N), i(fib(N))], !IO),
        main(!IO)
    else
        io.format("That aint a number tho...\n", [], !IO)
    ).
*/

    io.read_line_as_string(Result, !IO),
    (
        Result = eof,
        write_string("bye mfuxker...\n", !IO)
    ;
        Result = ok(String),
        ( if    to_int(strip(String), N)
        then    io.format("fib(%d) = %d\n", [i(N), i(fib(N))], !IO)
        else    io.format("That aint a number tho...\n", [], !IO)
        ),
        main(!IO)
    ;
        Result = error(ErrorCode),
        io.format("%s\n", [s(io.error_message(ErrorCode))], !IO)
    ).
