create database student_management;
use student_management;
create table student(student_id int primary key,student_name varchar(90),place varchar(90),gender enum('male','female'),admission_date date);
create table marksheet(english int,hindi int,history int,mathematics int,science int,student_name varchar(90), student_id int,constraint s_foreignkey foreign key(student_id) references student(student_id) on delete set null);
insert into student values(11,'pavithra','chennai','female','2023-11-14'),
(22,'abinaya','covai','female','2023-06-03'),
(33,'aswini','madurai','female','2023-09-03'),
(44,'murali','chennai','male','2023-11-03'),
(55,'vino','hosur','male','2023-08-11'),
(66,'sirpika','covai','female','2023-01-21'),
(77,'suhani','hosur','female','2023-04-27');
select * from student;
insert into marksheet values(89,78,99,89,90,'pavithra',11),
(90,68,87,98,90,'abinaya',22),
(98,78,96,90,100,'aswini',33),
(90,89,70,60,78,'murali',44),
(90,99,87,76,66,'vino',55),
(99,99,98,100,100,'sirpika',66),
(98,76,56,55,92,'suhani',77); 
select * from marksheet;
select count(*) from marksheet;
alter table marksheet add column total_marks int;
update marksheet set total_marks=english+hindi+history+mathematics+science;
set sql_safe_updates=0;
select ucase(student_name) from student;
delete from student where student_id = 11;
select student.student_id,student.student_name,student.place,student.admission_date,marksheet.student_name from student inner join marksheet on student.student_id=marksheet.student_id;
select student.student_id,student.student_name,student.place,student.admission_date,marksheet.student_name from student left join marksheet on student.student_id=marksheet.student_id;
select student.student_id,student.student_name,student.place,student.admission_date,marksheet.student_name from student right join marksheet on student.student_id=marksheet.student_id;
update student set student_name = 'james' where student_id = 55;
select student_name,total_marks,rank() over(order by total_marks desc) as total_rank from marksheet;