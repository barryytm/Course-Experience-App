DROP SCHEMA IF EXISTS course_experience;
CREATE SCHEMA course_experience;

SET SEARCH_PATH TO course_experience;

DROP TABLE IF EXISTS Instructor CASCADE;
CREATE TABLE Instructor (
    name varchar(30) PRIMARY KEY,
    age int,
    gender char(1),
    isFreelancer int
)

DROP TABLE IF EXISTS Student CASCADE;
CREATE TABLE Student (
    username varchar(30) PRIMARY KEY,
    gender char(1), 
    birthYear int, 
    birthMonth int, 
    birthCountry varchar(30), 
    enrolYear int, 
    enrolMonth int
)

DROP TABLE IF EXISTS Course CASCADE;
CREATE TABLE Course (
    dept varchar(30),
    name varchar(30),
    area varchar(30),
    PRIMARY KEY (dept, name)
)

DROP TABLE IF EXISTS Department CASCADE;
CREATE TABLE Department (
    code varchar(30) PRIMARY KEY,
    name varchar(30)
)

