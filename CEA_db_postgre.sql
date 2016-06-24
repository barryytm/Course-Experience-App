DROP SCHEMA IF EXISTS course_experience_app CASCADE;
CREATE SCHEMA course_experience_app;

SET SEARCH_PATH TO course_experience_app;

CREATE TYPE ins_type AS ENUM ('faculty', 'freelancer');
CREATE TYPE fas_type AS ENUM ('research', 'teaching');
CREATE TYPE gen_type AS ENUM ('male', 'female', 'other');
CREATE TYPE area_type AS ENUM ('science', 'social_science', 'humanity', 'engineering');
CREATE TYPE time_type AS ENUM ('morning', 'afternoon', 'evening');
CREATE TYPE au_type AS ENUM ('acquired', 'used');

CREATE DOMAIN four_level AS int CHECK (VALUE BETWEEN 2 AND 5);
CREATE DOMAIN five_level AS int CHECK (VALUE BETWEEN 1 AND 5);
CREATE DOMAIN month AS int CHECK (VALUE BETWEEN 1 AND 12);
CREATE DOMAIN course_digit AS int CHECK (VALUE BETWEEN 0 AND 499);

DROP TABLE IF EXISTS instructors CASCADE;
CREATE TABLE instructors (
    name varchar(30) PRIMARY KEY,
    age int CONSTRAINT check_age CHECK (age BETWEEN 0 AND 200),
    gender gen_type,
    faculty_or_free ins_type
);

DROP TABLE IF EXISTS instructor_expertise CASCADE;
CREATE TABLE instructor_expertise (
    name varchar(30)
        REFERENCES instructors ON UPDATE CASCADE ON DELETE CASCADE,
    expertise varchar(30),
    PRIMARY KEY (name, expertise)
);

DROP TABLE IF EXISTS faculty CASCADE;
CREATE TABLE faculty (
    name varchar(30)
        REFERENCES instructors ON UPDATE CASCADE ON DELETE CASCADE,
    start_year int,
    research_or_teach fas_type,
    PRIMARY KEY (name)
);

DROP TABLE IF EXISTS research_interests CASCADE;
CREATE TABLE research_interests (
    name varchar(30)
        REFERENCES instructors ON UPDATE CASCADE ON DELETE CASCADE,
    interest varchar(30),
    PRIMARY KEY (name, interest)
);

DROP TABLE IF EXISTS departments CASCADE;
CREATE TABLE departments (
    code char(3) PRIMARY KEY,
    name varchar(30)
);

DROP TABLE IF EXISTS courses CASCADE;
CREATE TABLE courses (
    dept_code char(3),
    num course_digit,
    area area_type,
    PRIMARY KEY (dept_code, num)
);

DROP TABLE IF EXISTS prerequisites CASCADE;
CREATE TABLE prerequisites (
    dept_code char(3),
    course_num course_digit,
    pre_dept char(30),
    pre_course int,
    FOREIGN KEY (dept_code, course_num)
        REFERENCES courses (dept_code, num) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (pre_dept, pre_course)
        REFERENCES courses (dept_code, num) ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (dept_code, course_num, pre_dept, pre_course)
);

DROP TABLE IF EXISTS exclusions CASCADE;
CREATE TABLE exclusions (
    dept_code char(3),
    course_num course_digit,
    ex_dept char(30),
    ex_course int,
    FOREIGN KEY (dept_code, course_num)
        REFERENCES courses (dept_code, num) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (ex_dept, ex_course)
        REFERENCES courses (dept_code, num) ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (dept_code, course_num, ex_dept, ex_course)
);

DROP TABLE IF EXISTS course_skills CASCADE;
CREATE TABLE course_skills (
    dept_code char(3),
    course_num course_digit,
    skill varchar(30),
    FOREIGN KEY (dept_code, course_num)
        REFERENCES courses (dept_code, num) ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (dept_code, course_num, skill)
);

DROP TABLE IF EXISTS course_topics CASCADE;
CREATE TABLE course_topics (
    dept_code char(3),
    course_num course_digit,
    topic varchar(30),
    FOREIGN KEY (dept_code, course_num)
        REFERENCES courses (dept_code, num) ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (dept_code, course_num, topic)
);

DROP TABLE IF EXISTS students CASCADE;
CREATE TABLE students (
    username varchar(30) PRIMARY KEY,
    gender gen_type,
    birth_year int,
    birth_month month,
    birth_country varchar(30),
    enrol_year int,
    enrol_month month,
    CONSTRAINT check_birth CHECK (birth_year < enrol_year)
);

DROP TABLE IF EXISTS companies CASCADE;
CREATE TABLE companies (
    name varchar(30) PRIMARY KEY
);

DROP TABLE IF EXISTS company_expertise CASCADE;
CREATE TABLE company_expertise (
    company_name varchar(30)
        REFERENCES companies ON UPDATE CASCADE ON DELETE CASCADE,
    expertise varchar(30),
    PRIMARY KEY (company_name, expertise)
);

DROP TABLE IF EXISTS employments CASCADE;
CREATE TABLE employments (
    username varchar(30) REFERENCES students ON UPDATE CASCADE,
    company_name varchar(30) REFERENCES companies ON UPDATE CASCADE,
    title varchar(30),
    start_date date,
    end_date date,
    PRIMARY KEY (username, company_name, title),
    CONSTRAINT check_work CHECK (start_date < end_date)
);

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
);

DROP TABLE IF EXISTS sections CASCADE;
CREATE TABLE sections (
    dept_code char(3),
    course_num course_digit,
    start_date date,
    section_id int,
    end_date date,
    time_of_day time_type,
    instructor_name varchar(30)
        REFERENCES instructors ON UPDATE CASCADE ON DELETE SET NULL,
    enrol_num int,
    FOREIGN KEY (dept_code, course_num)
        REFERENCES courses (dept_code, num) ON UPDATE CASCADE,
    PRIMARY KEY (dept_Code, course_num, start_date, section_id),
    CONSTRAINT check_section CHECK (start_date < end_date)
);

DROP TABLE IF EXISTS experience CASCADE;
CREATE TABLE experience (
    dept_code char(3),
    course_num course_digit,
    start_date date,
    section_id int,
    username varchar(30) REFERENCES students ON UPDATE CASCADE,
    grade int CONSTRAINT check_grade CHECK (grade BETWEEN 0 AND 100),
    satisfaction five_level,
    rank_of_instructor five_level,
    start_interest five_level,
    end_interest five_level,
    FOREIGN KEY (dept_code, course_num, start_date, section_id)
        REFERENCES sections (dept_code, course_num, start_date, section_id)
        ON UPDATE CASCADE,
    PRIMARY KEY (dept_code, course_num, start_date, section_id, username)
);

DROP TABLE IF EXISTS course_skills CASCADE;
CREATE TABLE course_skills (
    dept_code char(3),
    course_num course_digit,
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
);
