% In the group stage, a draw is possible.
match(   group, country1-country2, 0-0, draw).
match(   group, country1-country2, 1-0, country1).
match(   group, country1-country2, 0-1, country2).
% ...

% In the knockout stage, there is always a winner and
% score at the end of regular time is recorded.
match(knockout, country1-country2, 0-0, countr1).
match(knockout, country1-country2, 1-0, country1).
match(knockout, country1-country2, 0-1, country2).
% ...

% The countries that qualified for the knockout stage.
qualifier(country).
% ...

% The predictions per person (identified by name) for the
% group stage.
prediction(name, country1-country2, 0-0, draw).
prediction(name, country1-country2, 1-0, country1).
prediction(name, country1-country2, 0-1, country2).
% ...

% Ten selected teams per person. The person received points
% for wins, losses, draws, and for goals scored.
selected_team(name, country).
% ...

% Sixteen qualifiers per person.
selected_qualifier(name, country).
% ...
