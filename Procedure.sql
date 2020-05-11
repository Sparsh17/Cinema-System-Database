-- Procedure that adds Priority Rating to the Movie 
-- that hasn't been reviewed in the MOVIE TABLE
create or replace procedure "ADD_PRIORITY_RATING"
(mv_name IN REVIEWER.MOVIENAME%TYPE,
priority_rating REVIEWER.PRIORITYRATING%TYPE)
is
begin
BEGIN
  IF movie_name_availability(mv_name) THEN
      INSERT INTO Reviewer (MovieName,PriorityRating)
      VALUES(mv_name, priority_rating);
    ELSE
      DBMS_OUTPUT.PUT_LINE('No movie with such a name');
  END IF;
  EXCEPTION
  WHEN others THEN
  DBMS_OUTPUT.PUT_LINE('An Error occurred.');
END;
end;
