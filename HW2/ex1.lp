% "John Doe" is a person
person("John Doe").
% "Jane Doe" is a person
person("Jane Doe").

% "John Doe" has the uniqueID 1
assigned_uniqueID("John Doe", 1).

% The person with uniqueID 1 is a faculty
undergraduate_student(1).

% The person with uniqueID 1 is (also) a student
graduate_student(1).

% ------------------------------------

% TODO: Add the English reading for the rule below.
% Answer: uniqueID is within the range of integers from 1 to 1000,
% inclusive

uniqueID(1..1000).

% TODO: Add the English reading for the rule below.
% Answer: There is no reason to believe x is unique,
% if y is assigned same value.

-assigned_uniqueID(X, I) :- assigned_uniqueID(Y, I),
                            person(X),
                            person(Y),
                            X != Y.

% TODO: Add the English reading for the rule below.
% Answer: If an entity X has been assigned a unique identifier I,
% then X has a unique ID. 

has_uniqueID(X) :- assigned_uniqueID(X, I).


% TODO: Add the English reading for the rule below.
% Answer: If a person `X` exists but does not have a unique ID,
% then `X` is missing a unique ID."

missing_uniqueID(X) :- person(X), not has_uniqueID(X).

% TODO: Add the English reading for the rule below.
% Answer: If a person X has been assigned a unique ID I,
% then I must belong to either an undergraduate student,
% a graduate student, a faculty member, or a staff member.

undergraduate_student(I) | graduate_student(I) | faculty(I) | staff(I) :- 
	person(X), assigned_uniqueID(X, I).

#show missing_uniqueID/1.

