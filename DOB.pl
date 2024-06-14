
% Facts about people: person(Name, date(Year, Month, Day)).
person(john, date(1990, 5, 15)).
person(emma, date(1985, 12, 8)).
person(michael, date(1995, 3, 22)).

% Predicate to query the date of birth for a person
dob_for_person(Name, DOB) :-
    person(Name, DOB).

% Predicate to check if a person exists in the database
is_person_in_db(Name) :-
    person(Name, _).

% Example queries:
% dob_for_person(john, DOB).  % Querying date of birth for John
% is_person_in_db(emma).       % Checking if Emma is in the database
