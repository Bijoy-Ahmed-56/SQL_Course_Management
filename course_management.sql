CREATE DATABASE Course_management;
show databases;
use Course_management;
CREATE TABLE Course (
    Course_id CHAR(8) PRIMARY KEY,
    Course_name VARCHAR(30) NOT NULL,
    credit SMALLINT CHECK (credit BETWEEN 1 AND 8),
    semester SMALLINT CHECK (semester BETWEEN 1 AND 12),
    Course_type VARCHAR(10)
        CHECK (Course_type IN ('compulsory', 'optional')),
    Exam_type CHAR(8)
        CHECK (Exam_type IN ('exam', 'report')),
    Class_hour SMALLINT CHECK (Class_hour <= 72),
    Practice_hour SMALLINT
);
CREATE TABLE Teacher (
    Teacher_id CHAR(10) PRIMARY KEY,
    Teacher_name CHAR(20) NOT NULL,
    gender CHAR(10)
        CHECK (gender IN ('male', 'female')),
    title CHAR(20)
        CHECK (title IN (
            'assistant',
            'lecturer',
            'associate professor',
            'professor'
        )),
    degree CHAR(12)
        CHECK (degree IN ('bachelor', 'master', 'doctor')),
    department CHAR(20)
);
CREATE TABLE Course_take (
    Course_id CHAR(8),
    Teacher_id CHAR(10),
    Take_year CHAR(4) NOT NULL,
    Take_semester SMALLINT NOT NULL,
    Teacher_role CHAR(20)
        CHECK (Teacher_role IN (
            'speaker',
            'assistant',
            'experiment_instructor'
        )),
    Class_hour SMALLINT,

    PRIMARY KEY (Course_id, Teacher_id),

    FOREIGN KEY (Course_id)
        REFERENCES Course(Course_id),

    FOREIGN KEY (Teacher_id)
        REFERENCES Teacher(Teacher_id)
);
show tables;


-- 1. Insert data into Course table
INSERT INTO Course (Course_id, Course_name)
VALUES
('CSE101', 'Database Systems'),
('CSE102', 'Data Structures'),
('CSE103', 'Computer Networks');


select * 
from Course;

INSERT INTO Teacher (Teacher_id, Teacher_name)
VALUES
('T001', 'Rahim'),
('T002', 'Karim'),
('T003', 'Sakib');

select * from Teacher ;

INSERT INTO Course_take
    (Course_id, Teacher_id, Take_year, Take_semester,
     Teacher_role, Class_hour)
VALUES
    ('CSE101', 'T001', '2026', 1, 'speaker', 3),
    ('CSE102', 'T002', '2026', 1, 'assistant', 2),
    ('CSE103', 'T003', '2026', 2, 'speaker', 4);
    
select * from Course_take;