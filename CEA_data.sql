INSERT INTO departments VALUES ('CSC', 'Computer Science');
INSERT INTO departments VALUES ('BIO', 'Biology');
INSERT INTO departments VALUES ('BCH', 'Biochemistry');
INSERT INTO departments VALUES ('MAT', 'Mathemetics');
INSERT INTO departments VALUES ('CHM', 'Chemistry');
INSERT INTO departments VALUES ('PHY', 'Physics');
INSERT INTO departments VALUES ('STA', 'Statistics');
INSERT INTO departments VALUES ('GGR', 'Geography');
INSERT INTO departments VALUES ('PHL', 'Philosophy');
INSERT INTO departments VALUES ('CLA', 'Classics');
INSERT INTO departments VALUES ('PHL', 'Philosophy');
INSERT INTO departments VALUES ('ANT', 'Anthopology');

INSERT INTO courses VALUES ('CSC', 120, 'science');
INSERT INTO courses VALUES ('BIO', 120, 'science');
INSERT INTO courses VALUES ('BIO', 130, 'science');
INSERT INTO courses VALUES ('CHM', 138, 'science');
INSERT INTO courses VALUES ('CHM', 139, 'science');
INSERT INTO courses VALUES ('PHY', 131, 'science');
INSERT INTO courses VALUES ('PHY', 132, 'science');
INSERT INTO courses VALUES ('MAT', 135, 'science');
INSERT INTO courses VALUES ('MAT', 136, 'science');
INSERT INTO courses VALUES ('CSC', 120, 'science');
INSERT INTO courses VALUES ('MAT', 223, 'science');
INSERT INTO courses VALUES ('BIO', 230, 'science');
INSERT INTO courses VALUES ('CSC', 148, 'science');
INSERT INTO courses VALUES ('CSC', 165, 'science');
INSERT INTO courses VALUES ('BCH', 210, 'science');
INSERT INTO courses VALUES ('BCH', 311, 'science');
INSERT INTO courses VALUES ('CSC', 207, 'science');
INSERT INTO courses VALUES ('CSC', 209, 'science');
INSERT INTO courses VALUES ('CSC', 236, 'science');
INSERT INTO courses VALUES ('CSC', 263, 'science');
INSERT INTO courses VALUES ('CSC', 258, 'science');
INSERT INTO courses VALUES ('STA', 247, 'science');
INSERT INTO courses VALUES ('PHY', 151, 'science');
INSERT INTO courses VALUES ('GGR', 124, 'social_science');
INSERT INTO courses VALUES ('PHL', 245, 'humanity');
INSERT INTO courses VALUES ('GGR', 101, 'science');
INSERT INTO courses VALUES ('CLA', 201, 'humanity');
INSERT INTO courses VALUES ('ANT', 100, 'humanity');

INSERT INTO students VALUES ('jiananya', 'male', 1995, 11, 'china', 2014, 09);
INSERT INTO students VALUES ('yungtsz', 'male', 1996, 01, 'canada', 2014, 09);

INSERT INTO instructors VALUES('Wright', 42, 'female', 'faculty');
INSERT INTO instructors VALUES('Ford', 60, 'male', 'faculty');
INSERT INTO instructors VALUES('Truman', 53, 'male', 'faculty');
INSERT INTO instructors VALUES('William', 35, 'male', 'freelancer');
INSERT INTO instructors VALUES('Young', 68, 'female', 'faculty');
INSERT INTO instructors VALUES('Lee', 77, 'male', 'faculty');
INSERT INTO instructors VALUES('phill', 46, 'female', 'freelancer');

INSERT INTO instructor_expertise VALUES('Wright', 'AI');
INSERT INTO instructor_expertise VALUES('Wright', 'Database');
INSERT INTO instructor_expertise VALUES('Ford', 'Archeology');
INSERT INTO instructor_expertise VALUES('Truman', 'Greek');
INSERT INTO instructor_expertise VALUES('Truman', 'Latin');
INSERT INTO instructor_expertise VALUES('William', 'Zoology');

INSERT INTO faculty VALUES('Wright', 1998, 'teaching');
INSERT INTO faculty VALUES('Ford', 1999, 'teaching');
INSERT INTO faculty VALUES('Truman', 1980, 'research');
INSERT INTO faculty VALUES('Young', 1970, 'teaching');
INSERT INTO faculty VALUES('Lee', 1998, 'research');

INSERT INTO research_interests VALUES('Wright', 'algorithms');
INSERT INTO research_interests VALUES('Wright', 'NvsNP');
INSERT INTO research_interests VALUES('Truman', 'Latin Translation');
INSERT INTO research_interests VALUES('Lee', 'Relativity');

INSERT INTO exclusions VALUES('csc', 108, 'csc', 120);

INSERT INTO prerequisites VALUES('csc', 207, 'csc', 148);
INSERT INTO prerequisites VALUES('csc', 209, 'csc', 207);
INSERT INTO prerequisites VALUES('csc', 309, 'csc', 209);
INSERT INTO prerequisites VALUES('csc', 343, 'csc', 207);
INSERT INTO prerequisites VALUES('csc', 369, 'csc', 209);
INSERT INTO prerequisites VALUES('csc', 369, 'csc', 258);

INSERT INTO course_skills VALUES('csc', 343, 'PostgreSQL');
INSERT INTO course_skills VALUES('csc', 207, 'Java');

INSERT INTO course_topics VALUES('csc', 343, 'Database');
INSERT INTO course_topics VALUES('csc', 148, 'object oriented programming');

INSERT INTO companies VALUES('A&B ltd');
INSERT INTO companies VALUES('North America Corporation');

INSERT INTO company_expertise VALUES('A&B ltd', 'energy');
INSERT INTO company_expertise VALUES('North America Corporation', 'mining');
