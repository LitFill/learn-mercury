:- module card.

:- interface.
:- import_module io.

:- pred main(io::di, io::uo) is det.

:- type playing_card
    --->    card(rank, suit)
    ;       joker.

:- type rank
    --->    ace     ; two   ; three ; four  ; five
    ;       six     ; seven ; eight ; nine  ; ten
    ;       jack    ; queen ; king.

:- type suit
    --->    clubs ; diamonds ; hearts ; spades.

:- pred display_card(playing_card::in, io::di, io::uo) is det.
:- func show_rank(rank) = string.
:- pred show_rank(rank::in, string::out) is det.
:- func show_suit(suit) = string.
:- pred show_suit(suit::in, string::out) is det.

:- implementation.
:- import_module list, string.

main(!IO) :-
    display_card(joker, !IO),
    display_card(card(three, hearts), !IO),
    io.write_string("Hello, Mercury!", !IO).

display_card(joker, !IO) :-
    io.format("this is joker\n", [], !IO).
display_card(Card, !IO) :-
    Card = card(Rank, Suit),
    io.format(
        "this card is a %s %s\n",
        [ s(show_rank(Rank))
        , s(show_suit(Suit)) ],
        !IO
    ).

show_rank(ace)   = "ace".
show_rank(two)   = "two".
show_rank(three) = "three".
show_rank(four)  = "four".
show_rank(five)  = "five".
show_rank(six)   = "six".
show_rank(seven) = "seven".
show_rank(eight) = "eight".
show_rank(nine)  = "nine".
show_rank(ten)   = "ten".
show_rank(jack)  = "jack".
show_rank(queen) = "queen".
show_rank(king)  = "king".

show_rank(Rank, Name) :-
    Name = show_rank(Rank).

show_suit(clubs)    = "clubs".
show_suit(diamonds) = "diamonds".
show_suit(hearts)   = "hearts".
show_suit(spades)   = "spades".

show_suit(Suit, Name) :-
    Name = show_suit(Suit).
