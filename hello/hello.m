:- module hello.

:- interface.

:- import_module io.
:- import_module string.

    :- pred main(io::di, io::uo) is det.
    :- pred greet(string::in, io::di, io::uo) is det.

:- implementation.
:- import_module list.

greet(Name, !IO) :-
    io.write_string("Hello, ", !IO),
    io.write_string(Name, !IO),
    io.write_string("!\n", !IO).

/*
main(!IO) :-
    greet("LitFill", !IO),
    greet("World", !IO).
*/

:- pred person(string::out) is multi.
person("Alice").
person("Bob").
person("Charlie").
person("David").

:- pred likes(string::out, string::out) is multi.
likes("Alice",   "Bob").
likes("Alice",   "Charlie").
likes("Bob",     "David").
likes("Charlie", "David").

% Predicate to find who likes someone who likes another person.
:- pred likes_someone_who_likes(string::in, string::in) is semidet.
likes_someone_who_likes(WhoA, WhoB) :-
    likes(WhoA, SomeoneX), % WhoA likes SomeoneX
    likes(SomeoneX, WhoB).  % And SomeoneX likes WhoB

% --- Main Predicate Implementation ---
% This predicate executes when the program runs.
main(!IO) :-
    io.write_string("--- Mercury Basic Demo ---\n\n", !IO),

    io.write_string("Known people:\n", !IO),
    % ( Goal -> Action ; FailureAction )
    (
        person(P),
        io.format("  - %s\n", [s(P)], !IO),
        fail
    ;
        true
    ),

    io.write_string("\nLikes relationships:\n", !IO),
    ( likes(Liker, Liked)
    ->
        io.format("  - %s likes %s\n", [s(Liker), s(Liked)], !IO),
        fail
    ;
        true
    ),

    io.write_string("\nQuery: Who likes someone who likes David?\n", !IO),
    ( likes_someone_who_likes("Bob", "David")
    ->
        io.format("  - %s\n", [s("Bob")], !IO),
        fail
    ;
        io.write_string("  (No one found)\n", !IO)
    ),

    io.write_string("\n--- End of Demo ---\n", !IO)

    goal(12) => goal(13)
    not (goal(12), not goal(13)).

:- type fruit
    ---> apple
    ;    orange
    ;    banana
    ;    pear
    .

:- type fruit --->
    apple ;
    orange;
    banana;
    pear  .

:- type strange
    --->    foo(int)
    ;       bar(string)
    .

:- type employee --->
    employee(
        name        :: string,
        age         :: int,
        departement :: string
    ).

:- type tree
    --->    empty
    ;       leaf(int)
    ;       branch(tree, tree)
    A =< B.

:- type money == int.
