-- Selecting and Subquery and Difference - Shows the movies that have a higher PriorityRating than the movie Pan
SELECT MovieName FROM Reviewer
WHERE PriorityRating >
(SELECT PriorityRating FROM Reviewer
WHERE MovieName='Pan');

-- Intersection - Movie names that have been reviewed by the Reviewer and put into the Movie Table
SELECT MovieName 
FROM Reviewer
INTERSECT
SELECT MovieName
FROM Movie;

-- Union - The number of each screen that has a Movie being played 
SELECT ScreenNo FROM Screen
UNION
SELECT ScreenNo FROM Performances
ORDER BY ScreenNo;

-- Inner Join - Shows the rating of each Movie
SELECT  MovieName, MovieRating
FROM Movie
INNER JOIN Performances
ON Movie.MovieID = Performances.MovieID;

-- Outer Join - Shows the total number of screens the cinema has
SELECT Cinema.CinemaID, Screen.ScreenNo
FROM Cinema
FULL OUTER JOIN Screen
ON Cinema.CinemaID=Screen.ScreenNo
ORDER BY Cinema.CinemaID;

-- Aggregation - The current money that the cinema has earned
SELECT SUM(Price) AS CurrentMoney FROM Sale;