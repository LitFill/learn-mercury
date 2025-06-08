:- module rot13.

:- interface.
:- import_module io.

:- pred main(io::di, io::uo) is det.

:- implementation.
:- import_module char, list, string.

:- func rot13(char) = char.
rot13(Char) =
    ( if    Char = 'a' then 'n'
    else if Char = 'b' then 'o'
    % ...
    else    Char
    ).

:- func rot13_1(char) = char.
rot13_1(CharIn) =
    ( if    rot13_aux(CharIn, CharOut)
    then    CharOut
    else    CharIn
    ).

:- pred rot13_aux(char :: in, char :: out) is semidet.
rot13_aux('a', 'n').
rot13_aux('b', 'o').
rot13_aux('c', 'p').
rot13_aux('d', 'q').
rot13_aux('e', 'r').
rot13_aux('f', 's').
rot13_aux('g', 't').
rot13_aux('h', 'u').
rot13_aux('i', 'v').
rot13_aux('j', 'w').
rot13_aux('k', 'x').
rot13_aux('l', 'y').
rot13_aux('m', 'z').
rot13_aux('n', 'a').
rot13_aux('o', 'b').
rot13_aux('p', 'c').
rot13_aux('q', 'd').
rot13_aux('r', 'e').
rot13_aux('s', 'f').
rot13_aux('t', 'g').
rot13_aux('u', 'h').
rot13_aux('v', 'i').
rot13_aux('w', 'j').
rot13_aux('x', 'k').
rot13_aux('y', 'l').
rot13_aux('z', 'm').
rot13_aux('A', 'N').
rot13_aux('B', 'O').
rot13_aux('C', 'P').
rot13_aux('D', 'Q').
rot13_aux('E', 'R').
rot13_aux('F', 'S').
rot13_aux('G', 'T').
rot13_aux('H', 'U').
rot13_aux('I', 'V').
rot13_aux('J', 'W').
rot13_aux('K', 'X').
rot13_aux('L', 'Y').
rot13_aux('M', 'Z').
rot13_aux('N', 'A').
rot13_aux('O', 'B').
rot13_aux('P', 'C').
rot13_aux('Q', 'D').
rot13_aux('R', 'E').
rot13_aux('S', 'F').
rot13_aux('T', 'G').
rot13_aux('U', 'H').
rot13_aux('V', 'I').
rot13_aux('W', 'J').
rot13_aux('X', 'K').
rot13_aux('Y', 'L').
rot13_aux('Z', 'M').

main(!IO) :-
    io.read_char(Result, !IO),
    (
        Result = ok(Char),
        io.write_char(rot13_1(Char), !IO),
        main(!IO)
    ;
        Result = eof
    ;
        Result = error(ErrorCode),
        io.format("%s\n", [s(io.error_message(ErrorCode))], !IO)
    ).
