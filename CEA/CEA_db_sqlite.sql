DROP TABLE IF EXISTS instructors;
CREATE TABLE instructors (
    name text PRIMARY KEY,
    age integer CONSTRAINT check_age CHECK (age BETWEEN 0 AND 200),
    gender text,
    faculty_or_free text CONSTRAINT ins_check CHECK (
        faculty_or_free = 'faculty' OR
        faculty_or_free = 'freelancer'
    )
);

DROP TABLE IF EXISTS instructor_expertise;
CREATE TABLE instructor_expertise (
    name text
        REFERENCES instructors ON UPDATE CASCADE ON DELETE CASCADE,
    expertise text,
    PRIMARY KEY (name, expertise)
);

DROP TABLE IF EXISTS faculty;
CREATE TABLE faculty (
    name text
        REFERENCES instructors ON UPDATE CASCADE ON DELETE CASCADE,
    start_year integer,
    research_or_teach text CONSTRAINT fas_check CHECK (
        research_or_teach = 'research' OR
        research_or_teach = 'teaching'
    ),
    PRIMARY KEY (name)
);

DROP TABLE IF EXISTS research_interests;
CREATE TABLE research_interests (
    name text
        REFERENCES instructors ON UPDATE CASCADE ON DELETE CASCADE,
    interest text,
    PRIMARY KEY (name, interest)
);

DROP TABLE IF EXISTS departments;
CREATE TABLE departments (
    code text PRIMARY KEY,
    name text
);

DROP TABLE IF EXISTS courses;
CREATE TABLE courses (
    dept_code text,
    num INTEGER CONSTRAINT course_num_check CHECK (num >= 0 AND num <= 499),
    area text CONSTRAINT area_check CHECK (
        area = 'science' OR
        area = 'humanity' OR
        area = 'social_science' OR
        area = 'engineering'
    ),
    PRIMARY KEY (dept_code, num)
);

DROP TABLE IF EXISTS prerequisites;
CREATE TABLE prerequisites (
    dept_code text,
    course_num INTEGER CONSTRAINT course_num_check CHECK (course_num >= 0 AND course_num <= 499),
    pre_dept text,
    pre_course integer,
    FOREIGN KEY (dept_code, course_num)
        REFERENCES courses (dept_code, num) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (pre_dept, pre_course)
        REFERENCES courses (dept_code, num) ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (dept_code, course_num, pre_dept, pre_course)
);

DROP TABLE IF EXISTS exclusions;
CREATE TABLE exclusions (
    dept_code text,
    course_num INTEGER CONSTRAINT course_num_check CHECK (course_num >= 0 AND course_num <= 499),
    ex_dept text,
    ex_course integer,
    FOREIGN KEY (dept_code, course_num)
        REFERENCES courses (dept_code, num) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (ex_dept, ex_course)
        REFERENCES courses (dept_code, num) ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (dept_code, course_num, ex_dept, ex_course)
);

DROP TABLE IF EXISTS course_topics;
CREATE TABLE course_topics (
    dept_code text,
    course_num INTEGER CONSTRAINT course_num_check CHECK (course_num >= 0 AND course_num <= 499),
    topic text,
    FOREIGN KEY (dept_code, course_num)
        REFERENCES courses (dept_code, num) ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (dept_code, course_num, topic)
);

DROP TABLE IF EXISTS students;
CREATE TABLE students (
    username text PRIMARY KEY,
    gender text CONSTRAINT gen_check CHECK(
        gender = 'male' OR
        gender = 'female' OR
        gender = 'other'
    ),
    birth_year integer,
    birth_month INTEGER CHECK (birth_month >= 1 AND birth_month <= 12),
    birth_country text,
    enrol_year integer,
    enrol_month INTEGER CHECK (enrol_month >= 1 AND enrol_month <= 12),
    CONSTRAINT check_birth CHECK (birth_year < enrol_year)
);

DROP TABLE IF EXISTS companies;
CREATE TABLE companies (
    name text PRIMARY KEY
);

DROP TABLE IF EXISTS company_expertise;
CREATE TABLE company_expertise (
    company_name text
        REFERENCES companies ON UPDATE CASCADE ON DELETE CASCADE,
    expertise text,
    PRIMARY KEY (company_name, expertise)
);

DROP TABLE IF EXISTS employments;
CREATE TABLE employments (
    username text REFERENCES students ON UPDATE CASCADE,
    company_name text REFERENCES companies ON UPDATE CASCADE,
    title text,
    start_date date,
    end_date date,
    PRIMARY KEY (username, company_name, title),
    CONSTRAINT check_work CHECK (start_date < end_date)
);

DROP TABLE IF EXISTS employment_skill;
CREATE TABLE employment_skill (
    username text,
    company_name text,
    title text,
    acquired_or_used text CONSTRAINT au_check CHECK (
        acquired_or_used = 'acquired' OR
        acquired_or_used = 'used'
    ),
    level INTEGER CHECK (level <= 5 AND level >= 2),
    FOREIGN KEY (username, company_name, title)
        REFERENCES employments (username, company_name, title),
    PRIMARY KEY (username, company_name, title)
);

DROP TABLE IF EXISTS sections;
CREATE TABLE sections (
    dept_code text,
    course_num INTEGER CONSTRAINT course_num_check CHECK (course_num >= 0 AND course_num <= 499),
    start_date date,
    section_id integer,
    end_date date,
    time_of_day text CONSTRAINT time_check CHECK (
        time_of_day = 'morning' OR
        time_of_day = 'afternoon' OR
        time_of_day = 'evening'
    ),
    instructor_name text
        REFERENCES instructors ON UPDATE CASCADE ON DELETE SET NULL,
    enrol_num integer,
    FOREIGN KEY (dept_code, course_num)
        REFERENCES courses (dept_code, num) ON UPDATE CASCADE,
    PRIMARY KEY (dept_Code, course_num, start_date, section_id),
    CONSTRAINT check_section CHECK (start_date < end_date)
);

DROP TABLE IF EXISTS experience;
CREATE TABLE experience (
    dept_code text,
    course_num INTEGER CONSTRAINT course_num_check CHECK (course_num >= 0 AND course_num <= 499),
    start_date date,
    section_id integer,
    username text REFERENCES students ON UPDATE CASCADE,
    grade integer CONSTRAINT check_grade CHECK (grade BETWEEN 0 AND 100),
    satisfaction INTEGER CHECK (satisfaction <= 5 AND satisfaction >= 1),
    rank_of_instructor INTEGER CHECK (rank_of_instructor <= 5 AND
        rank_of_instructor >= 1
    ),
    start_interest INTEGER CHECK (start_interest <= 5 AND start_interest >= 1),
    end_interest INTEGER CHECK (end_interest <= 5 AND end_interest >= 1),
    FOREIGN KEY (dept_code, course_num, start_date, section_id)
        REFERENCES sections (dept_code, course_num, start_date, section_id)
        ON UPDATE CASCADE,
    PRIMARY KEY (dept_code, course_num, start_date, section_id, username)
);

DROP TABLE IF EXISTS course_skills;
CREATE TABLE course_skills (
    dept_code text,
    course_num INTEGER CONSTRAINT course_num_check CHECK (course_num >= 0 AND course_num <= 499),
    start_date date,
    section_id integer,
    username text,
    skill text,
    start_level INTEGER CHECK (start_level <= 5 AND start_level >= 1),
    end_level INTEGER CHECK (end_level <= 5 AND end_level >= 1),
    FOREIGN KEY (dept_code, course_num, start_date, section_id, username)
        REFERENCES experience (dept_code, course_num, start_date, section_id, username)
        ON UPDATE CASCADE,
    PRIMARY KEY (dept_code, course_num, start_date, section_id, username, skill)
);
