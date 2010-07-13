% Correct score
points(Name, 7) :-
  prediction(Name, Teams, PredScores, _PredResult),
  match(group, Teams, PredScores, _Result).

% Incorrect score, correct winner
points(Name, 2) :-
  prediction(Name, Teams, PredScores, PredResult),
  match(group, Teams, Scores, PredResult),
  PredScores \= Scores.

% Incorrect score, points correct
points(Name, 1) :-
  prediction(Name, Teams, PredScore1-PredScore2, _PredResult),
  match(group, Teams, PredScore1-Score2, _Result),
  PredScore2 \= Score2.
points(Name, 1) :-
  prediction(Name, Teams, PredScore1-PredScore2, _PredResult),
  match(group, Teams, Score1-PredScore2, _Result),
  PredScore1 \= Score1.

% Selected team won
points(Name, 5) :-
  selected_team(Name, Team),
  match(_Stage, _Teams, _Scores, Team).

% Selected team drawed
points(Name, 3) :-
  selected_team(Name, Team),
  match(_Stage, Team-_Team2, _Scores, draw).
points(Name, 3) :-
  selected_team(Name, Team),
  match(_Stage, _Team1-Team, _Scores, draw).

% Selected team lost
points(Name, 1) :-
  selected_team(Name, Team),
  match(_Stage, Team-Team2, _Scores, Team2).
points(Name, 1) :-
  selected_team(Name, Team),
  match(_Stage, Team1-Team, _Scores, Team1).

% Points for goals scored
points(Name, Points) :-
  selected_team(Name, Team),
  match(_Stage, Team-_Team2, Points-_Score2, _Result).

points(Name, Points) :-
  selected_team(Name, Team),
  match(_Stage, _Team1-Team, _Score1-Points, _Result).

% Correct qualifier
points(Name, 2) :-
  selected_qualifier(Name, Team),
  qualifier(Team).

% Sum of a list
sum([], 0).
sum([E|L], Sum) :-
  sum(L, Sum2),
  Sum is Sum2 + E.

% All points for a person
all_points(Name, AllPoints) :-
  name(Name),
  findall(Points, points(Name, Points), PointList),
  sum(PointList, AllPoints).

:- include('data/data.pl').

wc :-
  setof(P-N, all_points(N, P), List),
  member(Points-Name, List),
  format("~6a : ~d~n", [Name, Points]),
  fail.
