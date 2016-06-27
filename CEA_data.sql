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
INSERT INTO departments VALUES ('ANT', 'Anthropology');

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

INSERT INTO exclusions VALUES('CSC', 108, 'CSC', 120);

INSERT INTO prerequisites VALUES('CSC', 207, 'CSC', 148);
INSERT INTO prerequisites VALUES('CSC', 209, 'CSC', 207);
INSERT INTO prerequisites VALUES('CSC', 309, 'CSC', 209);
INSERT INTO prerequisites VALUES('CSC', 343, 'CSC', 207);
INSERT INTO prerequisites VALUES('CSC', 369, 'CSC', 209);
INSERT INTO prerequisites VALUES('CSC', 369, 'CSC', 258);

INSERT INTO course_skills VALUES('CSC', 343, '2015-05-30', 01, 'jiananya', 'PostgreSQL', 2, 5);
INSERT INTO course_skills VALUES('CSC', 207, '2015-09-10', 01, 'yungtsz', 'Java', 1, 4);

INSERT INTO course_topics VALUES('CSC', 343, 'Database');
INSERT INTO course_topics VALUES('CSC', 148, 'object oriented programming');

INSERT INTO companies VALUES('A&B ltd');
INSERT INTO companies VALUES('North America Corporation');

INSERT INTO company_expertise VALUES('A&B ltd', 'energy');
INSERT INTO company_expertise VALUES('North America Corporation', 'mining');

INSERT INTO sections VALUES ('BIO', 120, '2014-09-01', 01, '2014-12-31', 'morning', 'UNKNOWN', 1200);
INSERT INTO sections VALUES ('CHM', 138, '2014-09-01', 01, '2014-12-31', 'morning', 'UNKNOWN', 1200);
INSERT INTO sections VALUES ('PHY', 131, '2014-09-01', 01, '2014-12-31', 'morning', 'UNKNOWN', 1200);
INSERT INTO sections VALUES ('MAT', 135, '2014-09-01', 01, '2014-12-31', 'morning', 'UNKNOWN', 1200);
INSERT INTO sections VALUES ('BIO', 130, '2015-01-01', 01, '2015-04-30', 'morning', 'UNKNOWN', 1200);
INSERT INTO sections VALUES ('CHM', 139, '2015-01-01', 01, '2015-04-30', 'morning', 'UNKNOWN', 1200);
INSERT INTO sections VALUES ('PHY', 132, '2015-01-01', 01, '2015-04-30', 'morning', 'UNKNOWN', 1200);
INSERT INTO sections VALUES ('MAT', 136, '2015-01-01', 01, '2015-04-30', 'morning', 'UNKNOWN', 1200);

INSERT INTO experience VALUES ('BIO', 120, '2014-09-01', 01, 'jiananya', 90, NULL, NULL, NULL, NULL);

INSERT INTO course_skills VALUES ('BIO', 120, '2014-09-01', 01, 'jiananya', NULL, NULL, NULL);