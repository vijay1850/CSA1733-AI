% Facts and Rules
parent(john, mary).
parent(john, sam).
parent(mary, alice).
parent(mary, bob).
parent(sam, tom).
parent(susan, mary).
parent(susan, sam).
parent(alice, charlie).

male(john).
male(sam).
male(bob).
male(tom).
male(charlie).

female(mary).
female(susan).
female(alice).

father(F, C) :-
    parent(F, C),
    male(F).

mother(M, C) :-
    parent(M, C),
    female(M).

grandparent(GP, GC) :-
    parent(GP, P),
    parent(P, GC).

% Grandparent and Great-grandparent rule
grandparent_or_great(GP, GC) :-
    grandparent(GP, GC).
grandparent_or_great(GP, GC) :-
    parent(GP, P),
    grandparent_or_great(P, GC).

sibling(P1, P2) :-
    parent(X, P1),
    parent(X, P2),
    P1 \= P2.

brother(B, S) :-
    sibling(B, S),
    male(B).

sister(S, Sib) :-
    sibling(S, Sib),
    female(S).

% Predicate to print relationships including grandparents and great-grandparents
print_relationships(Name) :-
    format("Parents of ~w:~n", [Name]),
    findall(Parent, parent(Parent, Name), Parents),
    print_list(Parents),

    format("~nSisters/Brothers of ~w:~n", [Name]),
    findall(Sibling, sibling(Sibling, Name), Siblings),
    print_list(Siblings),

    format("~nGrandparents of ~w:~n", [Name]),
    findall(Grandparent, grandparent_or_great(Grandparent, Name), Grandparents),
    print_list(Grandparents).

print_list([]) :- !.
print_list([H | T]) :-
    format("  ~w~n", [H]),
    print_list(T).
