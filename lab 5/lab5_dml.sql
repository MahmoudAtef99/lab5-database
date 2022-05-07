/*Q1*/
select distinct(s.student_name) from student s
natural left join enrolled e 
natural left join semester_course sc
where s.`level`='SR' and e.`year` = sc.`year` and sc.prof_id = 1;

/*Q2*/
select max(s.age) from student s
natural left join enrolled e
natural left join semester_course sc
natural left join professor p
where p.prof_name='Michael Miller' or s.major = 'History';

/*Q3*/
select s.student_name , c.`name` from student s
natural left join enrolled e natural left join course c;

/*Q4*/
select p.prof_name , count(distinct sc.course_code ,  sc.`quarter` , sc.`year`) as x from professor p
natural left join semester_course sc
group by (p.prof_id)
having x < 5;

/*Q6*/
select c.`name` from course c
where not exists(
	select * from semester_course sc
    where c.course_code = sc.course_code
)
union
select c.`name` from semester_course sc
natural left join course c
where exists(
	select p.prof_id from professor p
	natural left join department d
	where d.dept_name='Computer Science'
    and sc.prof_id = p.prof_id
);

/*Q7*/
select s.student_name from student s
where s.student_name like 'M%' and s.age < 20
union
select p.prof_name from professor p
where p.prof_name like 'M%' and exists(
    select count(*) as x from (
		select distinct sc.course_code , sc.`quarter` , sc.`year` , sc.prof_id from semester_course sc
    )as result
    where result.prof_id = p.prof_id
    group by(result.prof_id)
    having x > 2
);

/*Q8*/
select result.prof_id , count(distinct result.course_code) courses from (
	select sc.prof_id , sc.course_code from semester_course sc
	natural left join professor p 
	natural left join department d
    where d.dept_id between 1 and 4
) as result
group by (result.prof_id)
having courses < 2;

/*Q9*/
 select s.student_name, p.prof_name from student s 
 natural left join enrolled e
 left join semester_course sc on e.course_code = sc.course_code and e.`quarter` = sc.`quarter` and e.`year` = sc.`year` 
 natural left join professor p
 union
 select s.student_name, p.prof_name from student s
 natural join enrolled e 
 left join semester_course sc on e.course_code = sc.course_code and e.`quarter` = sc.`quarter` and e.`year` = sc.`year`
 natural right join professor p;


/*Q10*/
select sc.course_code , c.`name` , p.prof_name, sc.prof_id from semester_course sc
natural join professor p
natural join course c ;

select sc.course_code , c.`name` , p.prof_name, sc.prof_id , count(sc.course_code) course_taught from semester_course sc
natural join professor p natural join course c
group by sc.prof_id , sc.course_code
having course_taught>=2;

/*Q11*/
select d.dept_name from department d 
natural left join professor 
natural left join semester_course sc 
group by d.dept_id 
having COUNT(sc.course_code)<3;



