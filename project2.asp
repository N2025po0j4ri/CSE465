% Facts
parent(john, mary).    % John is Mary's parent
parent(john, jack).    % John is Jack's parent
parent(susan, mary).  % Susan is Mary's parent
parent(susan, jack).  % Susan is Jack's parent
parent(jack, lisa).   % Jack is Lisa's parent
parent(lisa, mike).   % Lisa is Mike's parent
parent(mary, anna).   % Mary is Anna's parent
parent(mary, tom).    % Mary is Tom's parent

% Gender-specific facts
male(jack).    % Jack is male
male(mike).    % Mike is male
male(tom).     % Tom is male

% Sibling relationship
sibling(X, Y) :- parent(P1, X), parent(P1, Y), parent(P2, X), parent(P2, Y), X != Y.

% Grandmother relationship
grandmother(X, Y) :- parent(X, Z), parent(Z, Y), X != Z.

% Nephew relationship
nephew(X, Y) :- parent(P, X), sibling(P, Y), male(X).

% Full sibling relationship
full_sibling(X, Y) :- sibling(X, Y).

% Half sibling relationship
half_sibling(X, Y) :- (parent(P1, X), parent(P1, Y); parent(P2, X), parent(P2, Y)), not full_sibling(X, Y), X != Y.

% Cousin relationship
cousin(X, Y) :- parent(P1, X), parent(P2, Y), sibling(P1, P2), X != Y.

% Ensuring symmetric sibling relationships
sibling(Y, X) :- sibling(X, Y).
