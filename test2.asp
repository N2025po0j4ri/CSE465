
% Input
gender(female).
gender(male).
gender(gnc).
person(john).
person(sam).
person(bill).
person(alice).
person(bob).
% gender_of(x, y) - the gender of x is y
gender_of(john, male).
gender_of(sam, male).
gender_of(bill, male).
gender_of(alice, female).
gender_of(bob, male).
% father(x, y) - x is the father of y
father(john, sam).
father(john, bill).
% mother(x, y) - x is the mother of y
mother(alice, sam).
mother(alice, bill).
% Rules
% parent(x, y) - x is a parent of y
parent(X, Y) :- father(X, Y).
parent(X, Y) :- mother(X, Y).
% Variables are placeholders for constants in the program
% Possible substitutions of variables:
% X = john, Y = sam
% parent(john, sam) :- mother(john, sam). -- not useful
% X = alice, Y = sam
% parent(alice, sam) :- mother(alice, sam).
% X = john, Y = alice
% X = male, Y = alice
% parent(male, alice) :- mother(male, alice).
%#show parent/2.
% brother(x, y) - x is a brother of y
brother(X, Y) :- gender_of(X, male),
parent(Z, X), parent(Z, Y),
X != Y.
#show brother/2.
brother(X, Y) :- gender_of(X, male),
                 parent(Z, X), parent(Z, Y),
                 X != Y.
#show brother/2.
person(sandra).
gender_of(sandra, female).
father(sam, bob).
father(bill,sandra).
uncle(X,Y) :- brother(X, Z), parent(Z, Y).
#show uncle/2.

%uncle(X,Y) :- gender(X,male),
%             brother(X,Z),
%              parent(Z, Y),
%              X!=Y.

%ancestor(X,Y) - X is an ancestory of Y

% Base Case:
% X is an Ancestor of Y is X is a Parent of Y
%ancestor(X, Y) :- parent(X, Y).

%Recursive Case:
%Option 1
%X is an ancestor of Y if Z is an ancestor of Y and X is the ancestor of Z
%ancestor(X, Y) :- parent(Z,Y), parent(X,Z).
%ancestor(X, Y) :- parent(X,Z), parent(Z,Y).

%Option 2:
%ancestor(X, Y) :- ancestor(X, Z), parent(Z,Y).

%Option 3: 
%ancestor(X, Y) :- ancestor(X, Z), parent(Z,Y).
%#show ancestor/2.

%mother_known -- we know who the mother of x is
%known_mother(X) :- mother(M, X).

%unknown_mother(X) -- the mother of X is unknown
% "not" is not read s "unknown" or 
%                      "there is no reason to believe" or 
%                      "there is no way to prove"
% "not" is a keyword of ASP
% We don't have information about the mother about the mother of X if
% there is no reaon to believe that known mother
% is true for X
%unknown_mother(X).

%#show unknown_mother/1.

-father(X, X) :- person(X).

#show -father/2.
person(talyor).
person(trish).
gender_of(taylor, female).
gender_of(trish, female).

%"|" means "or"
mother(taylor, bob) | mother (trish, bob).

%#show mother/2.

% age is within the range of integers from 0 to 100
% inclusive
age(0..120).

%age of(x, a) -- the age of x is a
age_of(john, 64).
age_of(alice, 62).

% Age is unique
% A person does not have more than one age at a time
-age_of(X, A1) :- age_of(X, A2),
                  A1 != A2,
                  age(A1).
#show -age_of/2.
#show age_of/2.

