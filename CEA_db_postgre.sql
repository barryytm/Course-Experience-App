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

DROP TABLE IF EXISTS Prerequisite CASCADE;
CREATE TABLE Prerequisite (
    dept varchar(30),
    name varchar(30),
    preDept varchar(30),
    preCourse varchar(30),
    PRIMARY KEY (dept, name, preDept, preCourse)
)

DROP TABLE IF EXISTS Exclusion CASCADE;
CREATE TABLE Exclusion (
    dept varchar(30),
    name varchar(30),
    exDept varchar(30),
    exCourse varchar(30),
    PRIMARY KEY (dept, name, exDept, exCourse)
)

