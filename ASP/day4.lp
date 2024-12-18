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

%#show parent/2.

% brother(x, y) - x is a brother of y
% X is a brother of Y if the gender of X is male
% and Z is a parent of X and Z is also the parent of Y
% and X and Y are different.
brother(X, Y) :- gender_of(X, male), 
                 parent(Z, X), parent(Z, Y),
                 X != Y.
%#show brother/2.   

% uncle(X, Y) – X is an uncle of Y
% X is an uncle of Y if X is a brother of a parent of Y
person(sandra).
gender_of(sandra, female).
father(sam, bob).
father(bill, sandra).
person(mary).
gender_of(mary, female).
mother(alice, mary).
father(john, mary).

uncle(X, Y) :- brother(X, Z), parent(Z, Y).

%uncle(X, Y) :- gender_of(X, male), 
%               brother(X, Z), parent(Z, Y),
%               X != Y.

% This is a directive for clingo, indicating that 
% I want to include in the output (filter)
% uncle predicates, which have arity 2 (# of params.)
%#show uncle/2.

% ancestor(X, Y) – X is an ancestor of Y

% Base case:
% X is an ancestor of Y is X is a parent of Y
ancestor(X, Y) :- parent(X, Y).

% Recursive case:
% Option 1
% X is an ancestor of Y if Z is an ancestor of Y and 
%                 X is a parent of Z
ancestor(X, Y) :- ancestor(Z, Y), parent(X, Z).
%ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).

% Option 2:
% ancestor(X, Y) :- ancestor(X, Z), parent(Z, Y).

% Option 3:
% ancestor(X, Y) :- ancestor(X, Z), ancestor(Z, Y).

%#show ancestor/2.

% mother_known(x) -- we know who the mother of x is
known_mother(X) :- mother(M, X).

% unknown_mother(x) -- the mother of X is unknown
% "not" is read as "unknwon" or 
%                   "there is no reason to believe" or
%                   "there is no way to prove"
% "not" is a keyword of ASP
% We don't have information about the mother of X if
% there is no reason to believe that known_mother 
% is true for X
unknown_mother(X) :- not known_mother(X), person(X).

%#show unknown_mother/1.

% X is never a father of themselves.
% It is false that X is a father of X.
% "-" means false
-father(X, X) :- person(X).

%#show -father/2.

person(taylor).
person(trish).
gender_of(taylor, female).
gender_of(trish, female).

% I don't remember who is bob's mother: taylor or trish
% "|" means "or" -- DO NOT translate it as either ... or 
% Online Glingo: to see multiple answer sets, select 
% "enumerate all" under "reasoning mode"
% For teh desktop version or ceclnx01
% clingo day4.txt 0
mother(taylor, bob) | mother(trish, bob).

%#show mother/2.

% age is within the range of integers from 0 to 120,
% inclusive
age(0..120).

% age_of(x, a) -- the age of x is a
age_of(john, 64).
age_of(alice, 62).

% Age is unique
% A person does not have more than one age at a time
-age_of(X, A1) :- age_of(X, A2),
                  A1 != A2,
                  age(A1).
#show -age_of/2.
#show age_of/2.
