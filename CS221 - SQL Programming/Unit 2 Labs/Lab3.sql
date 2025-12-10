-- Write a SELECT statement to select the year and the total number of movies for that year.
SELECT Year, COUNT(*)
FROM Movie
GROUP BY Year;