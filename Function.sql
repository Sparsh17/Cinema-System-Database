-- Function for the Reviewer who checks if the 
-- Movie is available in the cinema (Movie Table) or not
CREATE OR REPLACE FUNCTION movie_name_availability
  (
    movie_name MOVIE.MOVIENAME%TYPE
  )
  RETURN BOOLEAN
IS
  movie_id MOVIE.MOVIEID%TYPE;
BEGIN
  SELECT MOVIEID INTO movie_id FROM MOVIE WHERE MOVIENAME = movie_name;
  RETURN TRUE;
EXCEPTION
WHEN NO_DATA_FOUND THEN
  RETURN FALSE;
END movie_name_availability;