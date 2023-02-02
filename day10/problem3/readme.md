#sql-problems
##day 10

Write a sql query to report the students being quiet in all exams
A quiet student is one who didn't score neither the top score or the least score in the exam

Students table:
student_id --id
student_name --name

Exams table:
exam_id     -primary_key
student_id  -foreign key with the students table
score       -marks scored by the student