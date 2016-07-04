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
INSERT INTO courses VALUES ('MAT', 221, 'science');
INSERT INTO courses VALUES ('MAT', 223, 'science');
INSERT INTO courses VALUES ('MAT', 240, 'science');
INSERT INTO courses VALUES ('CSC', 148, 'science');
INSERT INTO courses VALUES ('CSC', 108, 'science');
INSERT INTO courses VALUES ('CSC', 165, 'science');
INSERT INTO courses VALUES ('CSC', 207, 'science');
INSERT INTO courses VALUES ('CSC', 209, 'science');
INSERT INTO courses VALUES ('CSC', 258, 'science');
INSERT INTO courses VALUES ('STA', 247, 'science');
INSERT INTO courses VALUES ('PHY', 151, 'science');
INSERT INTO courses VALUES ('GGR', 124, 'social_science');
INSERT INTO courses VALUES ('PHL', 245, 'humanity');
INSERT INTO courses VALUES ('GGR', 101, 'science');
INSERT INTO courses VALUES ('CLA', 201, 'humanity');
INSERT INTO courses VALUES ('ANT', 100, 'humanity');
INSERT INTO courses VALUES ('CSC', 309, 'science');
INSERT INTO courses VALUES ('CSC', 343, 'science');
INSERT INTO courses VALUES ('CSC', 369, 'science');


INSERT INTO students VALUES ('jiananya', 'male', 1995, 11, 'china', 2014, 09);
INSERT INTO students VALUES ('yungtsz', 'male', 1996, 01, 'canada', 2014, 09);

INSERT INTO instructors VALUES('Wright', 42, 'female', 'faculty');
INSERT INTO instructors VALUES('Ford', 60, 'male', 'faculty');
INSERT INTO instructors VALUES('Truman', 53, 'male', 'faculty');
INSERT INTO instructors VALUES('William', 35, 'male', 'freelancer');
INSERT INTO instructors VALUES('Young', 68, 'female', 'faculty');
INSERT INTO instructors VALUES('Lee', 77, 'male', 'faculty');
INSERT INTO instructors VALUES('Phill', 46, 'female', 'freelancer');
INSERT INTO instructors VALUES('Dwight', 46, 'male', 'freelancer');


INSERT INTO instructor_expertise VALUES('Wright', 'AI');
INSERT INTO instructor_expertise VALUES('Wright', 'Database');
INSERT INTO instructor_expertise VALUES('Ford', 'Archeology');
INSERT INTO instructor_expertise VALUES('Truman', 'Greek');
INSERT INTO instructor_expertise VALUES('Truman', 'Latin');
INSERT INTO instructor_expertise VALUES('Young', 'Graph Theory');
INSERT INTO instructor_expertise VALUES('Lee', 'physical chemistry');
INSERT INTO instructor_expertise VALUES('William', 'toxicology');
INSERT INTO instructor_expertise VALUES('Phill', 'relativity');
INSERT INTO instructor_expertise VALUES('Dwight', 'quantum physics');


INSERT INTO faculty VALUES('Wright', 1998, 'teaching');
INSERT INTO faculty VALUES('Ford', 1999, 'teaching');
INSERT INTO faculty VALUES('Truman', 1980, 'research');
INSERT INTO faculty VALUES('William', 2000, 'research');
INSERT INTO faculty VALUES('Young', 1970, 'teaching');
INSERT INTO faculty VALUES('Lee', 1998, 'research');
INSERT INTO faculty VALUES('Phill', 1998, 'teaching');

INSERT INTO research_interests VALUES('Wright', 'algorithms');
INSERT INTO research_interests VALUES('Wright', 'NvsNP');
INSERT INTO research_interests VALUES('Ford', 'carbon dating');
INSERT INTO research_interests VALUES('Truman', 'latin Translation');
INSERT INTO research_interests VALUES('William', 'aquatic toxicology');
INSERT INTO research_interests VALUES('Young', 'graph calculus');
INSERT INTO research_interests VALUES('Lee', 'chemical reaction');
INSERT INTO research_interests VALUES('Phill', 'relativity');
INSERT INTO research_interests VALUES('Dwight', 'quantum mechanics');


INSERT INTO exclusions VALUES('CSC', 108, 'CSC', 120);
INSERT INTO exclusions VALUES('MAT', 221, 'MAT', 223);
INSERT INTO exclusions VALUES('MAT', 221, 'MAT', 240);
INSERT INTO exclusions VALUES('MAT', 223, 'MAT', 240);
INSERT INTO exclusions VALUES('PHY', 131, 'PHY', 151);

INSERT INTO prerequisites VALUES('CSC', 207, 'CSC', 148);
INSERT INTO prerequisites VALUES('CSC', 209, 'CSC', 207);
INSERT INTO prerequisites VALUES('CSC', 309, 'CSC', 209);
INSERT INTO prerequisites VALUES('CSC', 343, 'CSC', 207);
INSERT INTO prerequisites VALUES('CSC', 369, 'CSC', 209);
INSERT INTO prerequisites VALUES('CSC', 369, 'CSC', 258);

INSERT INTO companies VALUES('A&B Ltd');
INSERT INTO companies VALUES('North America Corporation');

INSERT INTO company_expertise VALUES('A&B Ltd', 'energy');
INSERT INTO company_expertise VALUES('North America Corporation', 'mining');

INSERT INTO employments VALUES('jiananya', 'A&B Ltd', 'software engineer', '2015-01-01', '2015-05-01');
INSERT INTO employments VALUES('yungtsz', 'North America Corporation', 'software engineer', '2015-01-01', '2015-05-01');

INSERT INTO employment_skills VALUES('jiananya', 'A&B Ltd', 'software engineer', 'C', 'used', 4);
INSERT INTO employment_skills VALUES('jiananya', 'A&B Ltd', 'software engineer', 'C++', 'used', 3);
INSERT INTO employment_skills VALUES('yungtsz', 'North America Corporation', 'software engineer', 'C++', 'used', 4);

INSERT INTO sections VALUES ('BIO', 130, '2015-01-01', 01, '2015-04-30', 'morning', 'William', 1200);
INSERT INTO sections VALUES ('PHY', 151, '2014-09-01', 01, '2014-12-31', 'morning', 'Phill', 1200);
INSERT INTO sections VALUES ('MAT', 135, '2014-09-01', 01, '2014-12-31', 'morning', 'Phill', 1200);
INSERT INTO sections VALUES ('CHM', 139, '2014-09-01', 01, '2015-04-30', 'morning', 'Lee', 1200);
INSERT INTO sections VALUES ('MAT', 136, '2015-01-01', 01, '2015-04-30', 'morning', 'Young', 1200);

INSERT INTO experience VALUES ('MAT', 135, '2014-09-01', 01, 'yungtsz', 90, NULL, NULL);
INSERT INTO experience VALUES ('CHM', 139, '2014-09-01', 01, 'yungtsz', 75, NULL, NULL);
INSERT INTO experience VALUES ('PHY', 151, '2014-09-01', 01, 'yungtsz', 81, NULL, NULL);
INSERT INTO experience VALUES ('BIO', 130, '2015-01-01', 01, 'jiananya', 87, NULL, NULL);
INSERT INTO experience VALUES ('MAT', 136, '2015-01-01', 01, 'jiananya', 77, NULL, NULL);

INSERT INTO course_skills VALUES ('MAT', 135, '2014-09-01', 01, 'yungtsz', 'chain rule', NULL, NULL);
INSERT INTO course_skills VALUES ('CHM', 139, '2014-09-01', 01, 'yungtsz', 'laws of thermodynamics', NULL, NULL);
INSERT INTO course_skills VALUES ('PHY', 151, '2014-09-01', 01, 'yungtsz', 'law of conservation of energy', NULL, NULL);
INSERT INTO course_skills VALUES ('BIO', 130, '2015-01-01', 01, 'jiananya', 'cell and systems', NULL, NULL);
INSERT INTO course_skills VALUES ('MAT', 136, '2015-01-01', 01, 'jiananya', 'integration', NULL, NULL);
INSERT INTO course_skills VALUES ('MAT', 136, '2015-01-01', 01, 'jiananya', 'tri', NULL, NULL);

INSERT INTO course_topics VALUES('MAT', 136, '2015-01-01', 01, 'jiananya', 'database', NULL, NULL);
INSERT INTO course_topics VALUES('BIO', 130, '2015-01-01', 01, 'jiananya', 'Patterns', NULL, NULL);
INSERT INTO course_topics VALUES('MAT', 135, '2014-09-01', 01, 'yungtsz', 'relativity', NULL, NULL);
INSERT INTO course_topics VALUES('PHY', 151, '2014-09-01', 01, 'yungtsz',  'relativity', NULL, NULL);
INSERT INTO course_topics VALUES('CHM', 139, '2014-09-01', 01, 'yungtsz', 'relation algebra', NULL, NULL);
INSERT INTO course_topics VALUES('CHM', 139, '2014-09-01', 01, 'yungtsz', 'AI', NULL, NULL);
