-- Log Table
CREATE TABLE Reviewer_Log (
  Table_name varchar(20),
  ReviewerID number(6),
  MovieName varchar2(50),
  Rev char(3) CHECK (Rev IN ('INS','UPD','DEL')),
  s_date DATE
)

-- Audit Trigger
create or replace trigger "REVIEW_AI"
AFTER
insert on "REVIEWER"
for each row
begin

    INSERT INTO Reviewer_Log (Table_name,ReviewerID,MovieName,Rev,s_date) values('REVIEWS', 'INS', :new.ReviewerID, :new.MovieName, SYSDATE);

end;


-- Constraint Trigger
CREATE OR REPLACE TRIGGER Review_AI_2
BEFORE INSERT ON Reviewer
FOR EACH ROW
BEGIN
  DBMS_OUTPUT.PUT_LINE('Executing Review_AI_2');
END;