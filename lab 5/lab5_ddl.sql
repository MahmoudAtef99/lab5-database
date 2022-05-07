use lab5;

create table department(
	dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name varchar(100) not null
);

create table student(
	student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name varchar(100) not null,
    major varchar(100) not null,
    `level`  varchar(100) not null,
    age int not null
);

create table professor(
	prof_id INT PRIMARY KEY AUTO_INCREMENT,
    prof_name varchar(100) not null,
    dept_id int,
    foreign key(dept_id) references department(dept_id)
);

create table course(
	course_code varchar(50) PRIMARY KEY,
    `name`  varchar(50) not null
);

create table semester_course(
	course_code varchar(50),
    `quarter` varchar(50),
    `year` year,
    primary key(course_code , `quarter` , `year`),
    prof_id int,
    foreign key(course_code) references course(course_code),
    foreign key(prof_id) references professor(prof_id)
);

create table enrolled(
	student_id int,
    course_code varchar(50),
    `quarter` varchar(50),
    `year` year,
    primary key(student_id , course_code , `quarter` , `year`),
    enrolled_at date,
    foreign key(course_code) references course(course_code),
    foreign key(student_id) references student(student_id)
);