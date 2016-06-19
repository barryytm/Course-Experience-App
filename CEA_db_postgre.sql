DROP SCHEMA IF EXISTS course_experience_app;
CREATE SCHEMA course_experience_app;

SET SEARCH_PATH TO course_experience_app;

CREATE TYPE ins_type AS ENUM ("faculty", "freelancer");
CREATE TYPE fas_type AS ENUM ("research", "teaching");
CREATE TYPE gen_type AS ENUM ("male", "female", "other");
CREATE TYPE area_type AS ENUM ("science", "social_science", "humanity", "engineering");
CREATE TYPE time_type AS ENUM ("morning", "afternoon", "evening");
CREATE TYPE au_type AS ENUM ("acquired", "used");
CREATE TYPE four_level AS ENUM (2, 3, 4, 5);
CREATE TYPE five_level AS ENUM (1, 2, 3, 4, 5);

DROP TABLE IF EXISTS instructors CASCADE;
CREATE TABLE instructors (
    name varchar(30) PRIMARY KEY,
    age int,
    gender gen_type,
    faculty_or_free ins_type
)

DROP TABLE IF EXISTS instructor_expertise CASCADE;
CREATE TABLE instructor_expertise (
    name varchar(30) 
        REFERENCES instructors ON UPDATE CASCADE ON DELETE CASCADE,
    expertise varchar(30),
    PRIMARY KEY (name, expertise)
)

DROP TABLE IF EXISTS faculty CASCADE;
CREATE TABLE faculty (
    name varchar(30) 
        REFERENCES instructors ON UPDATE CASCADE ON DELETE CASCADE,
    start_year int,
    research_or_teach fas_type,
    PRIMARY KEY (name)
)

DROP TABLE IF EXISTS research_interests CASCADE;
CREATE TABLE research_interest (
    name varchar(30) 
        REFERENCES instructors ON UPDATE CASCADE ON DELETE CASCADE,
    interest varchar(30),
    PRIMARY KEY (name, interest)
)

DROP TABLE IF EXISTS departments CASCADE;
CREATE TABLE departments (
    code varchar(3) PRIMARY KEY,
    name varchar(30)
)

DROP TABLE IF EXISTS courses CASCADE;
CREATE TABLE courses (
    dept_code varchar(3),
    num int,
    area area_type,
    PRIMARY KEY (dept, num)
)

DROP TABLE IF EXISTS prerequisites CASCADE;
CREATE TABLE prerequisites (
    dept_code varchar(3),
    course_num int,
    pre_dept varchar(30),
    pre_course varchar(30),
    FOREIGN KEY (dept_code, course_num) 
        REFERENCES courses (dept_code, num) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (pre_dept, pre_course) 
        REFERENCES courses (dept_code, num) ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (dept_code, course_num, pre_dept, pre_course)
)

DROP TABLE IF EXISTS exclusions CASCADE;
CREATE TABLE exclusions (
    dept_code varchar(3),
    course_num int,
    ex_dept varchar(30),
    ex_course varchar(30),
    FOREIGN KEY (dept_code, course_num) 
        REFERENCES courses (dept_code, num) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (ex_dept, ex_course) 
        REFERENCES courses (dept_code, num) ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (dept_code, course_num, ex_dept, ex_course)
)

DROP TABLE IF EXISTS course_skills CASCADE;
CREATE TABLE course_skills (
    dept_code varchar(3),
    course_num int,
    skill varchar(30),
    FOREIGN KEY (dept_code, course_num) 
        REFERENCES courses (dept_code, num) ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (dept_code, course_num, skill)
)

DROP TABLE IF EXISTS course_topics CASCADE;
CREATE TABLE course_topics (
    dept_code varchar(3),
    course_num int,
    topic varchar(30),
    FOREIGN KEY (dept_code, course_num) 
        REFERENCES courses (dept_code, num) ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (dept_code, course_num, topic)
)

DROP TABLE IF EXISTS students CASCADE;
CREATE TABLE students (
    username varchar(30) PRIMARY KEY,
    gender gen_type, 
    birth_year int, 
    birth_month int, 
    birth_country varchar(30), 
    enrol_year int, 
    enrol_month int
)

DROP TABLE IF EXISTS companies CASCADE;
CREATE TABLE companies (
    name varchar(30) PRIMARY KEY
)

DROP TABLE IF EXISTS company_expertise CASCADE;
CREATE TABLE company_expertise (
    company_name varchar(30) 
        REFERENCES companies ON UPDATE CASCADE ON DELETE CASCADE,
    expertise varchar(30),
    PRIMARY KEY (company_name, expertise)
)

DROP TABLE IF EXISTS employments CASCADE;
CREATE TABLE employments (
    username varchar(30) REFERENCES students ON UPDATE CASCADE,
    company_name varchar(30) REFERENCES companies ON UPDATE CASCADE,
    title varchar(30),
    start_date date,
    end_date date,
    PRIMARY KEY (username, company_name, title)
)

DROP TABLE IF EXISTS employment_skill CASCADE;
CREATE TABLE employment_skill (
    username varchar(30),
    company_name varchar(30),
    title varchar(30),
    acquired_or_used au_type,
    level four_level,
    FOREIGN KEY (username, company_name, title) 
        REFERENCES employments (username, company_name, title),
    PRIMARY KEY (username, company_name, title)
)

DROP TABLE IF EXISTS sections CASCADE;
CREATE TABLE sections (
    dept_code varchar(3),
    course_num int,
    start_date date,
    section_id int,
    end_date date,
    time_of_day time_type,
    instructor_name string 
        REFERENCES instructors ON UPDATE CASCADE ON DELETE SET NULL,
    enrol_num int,
    FOREIGN KEY (dept_code, course_num) 
        REFERENCES courses (dept_code, num) ON UPDATE CASCADE,
    PRIMARY KEY (dept_Code, course_num, start_date, section_id)
)

DROP TABLE IF EXISTS experience CASCADE;
CREATE TABLE experience (
    dept_code varchar(3),
    course_num int,
    start_date date,
    section_id int,
    username varchar(30) REFERENCES students ON UPDATE CASCADE,
    grade int,
    satisfaction five_level,
    rank_of_instructor five_level,
    start_interest five_level,
    end_interest five_level,
    FOREIGN KEY (dept_code, course_num, start_date, section_id) 
        REFERENCES sections (dept_code, course_num, start_date, section_id) 
        ON UPDATE CASCADE,
    PRIMARY KEY (dept_code, course_num, start_date, section_id, username)
)

DROP TABLE IF EXISTS course_skills CASCADE;
CREATE TABLE course_skills (
    dept_code varchar(3),
    course_num int,
    start_date date,
    section_id int,
    username varchar(30),
    skill varchar(30),
    start_level five_level,
    end_level five_level,
    FOREIGN KEY (dept_code, course_num, start_date, section_id, username) 
        REFERENCES experience (dept_code, course_num, start_date, section_id, username) 
        ON UPDATE CASCADE,
    PRIMARY KEY (dept_code, course_num, start_date, section_id, username)
)