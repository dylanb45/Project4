DROP DATABASE IF EXISTS VWLogin;
CREATE DATABASE VWLogin;
USE VWLogin;

CREATE TABLE Students (
    StudentNum int UNIQUE NOT NULL AUTO_INCREMENT,
    StudentName VARCHAR(255) NOT NULL,
    CONSTRAINT StudentName_PK PRIMARY KEY (StudentName)
);

CREATE TABLE Classes (
    ClassNum int UNIQUE NOT NULL,
    ClassName VARCHAR(255) NOT NULL,
    CONSTRAINT ClassNum_PK PRIMARY KEY (ClassNum)
);

CREATE TABLE Enrollments (
    StudentName VARCHAR(255) NOT NULL,
    ClassNum int NOT NULL,
    CONSTRAINT StudentName_FK FOREIGN KEY (StudentName) REFERENCES Students(StudentName),
    CONSTRAINT ClassNum_FK FOREIGN KEY (ClassNum) REFERENCES Classes(ClassNum)
);

CREATE TABLE LoginLogs (
    LoginNum int UNIQUE NOT NULL AUTO_INCREMENT,
    StudentName VARCHAR(255),
    AdminName VARCHAR(255),
    LogTime timestamp NOT NULL,
    CONSTRAINT LoginNum_PK PRIMARY KEY (LoginNum)
);

CREATE TABLE Admins (
    AdminNum int UNIQUE NOT NULL AUTO_INCREMENT,
    AdminName VARCHAR(255) NOT NULL,
    CONSTRAINT AdminName_PK PRIMARY KEY (AdminName)
);

CREATE INDEX StudentLogs
ON LoginLogs(StudentName, LogTime);

CREATE INDEX AdminLogs
ON LoginLogs(AdminName, LogTime);