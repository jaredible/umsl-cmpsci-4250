male(pete).
male(mark).
male(john).
male(frank).
male(tom).
male(matt).
male(henry).
male(todd).

female(lilly).
female(kate).
female(anne).
female(alice).
female(jenny).

parent(pete, mark).
parent(pete, tom).
parent(pete, anne).
parent(mark, lilly).
parent(mark, john).
parent(mark, frank).
parent(tom, kate).
parent(anne, alice).
parent(anne, matt).
parent(alice, henry).
parent(matt, jenny).
parent(matt, todd).

sister(Sis, Sibling) :- female(Sis), parent(Parent, Sis), parent(Parent, Sibling), Sis \= Sibling.

brother(Bro, Sibling) :- male(Bro), parent(Parent, Bro), parent(Parent, Sibling), Bro \= Sibling.

sibling(Sibling1, Sibling2) :- parent(Parent, Sibling1), parent(Parent, Sibling2), Sibling1 \= Sibling2.

father(Dad, Child) :- male(Dad), parent(Dad, Child).

mother(Mom, Child) :- female(Mom), parent(Mom, Child).

grandparent(GrandParent, Child) :- parent(Parent, Child), parent(GrandParent, Parent).
