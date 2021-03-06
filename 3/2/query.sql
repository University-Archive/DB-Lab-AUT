DECLARE @view TABLE(
name varchar(50),
student_id int,
old_grade float,
new_grade float);

UPDATE students
SET grade = grade + 2
OUTPUT deleted.name, deleted.student_id, deleted.grade, inserted.grade
into @view
WHERE grade < 15;
SELECT * FROM @view;