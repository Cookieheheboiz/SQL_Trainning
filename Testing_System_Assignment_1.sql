create database if not exists company_management;

use company_management;

create table if not exists Department (
	DepartmentID int primary key auto_increment,
    DepartmentName varchar(100)    
);

create table if not exists Position (
	PositionID int primary key auto_increment,
    PositionName varchar(100)
);

create table if not exists `Account` (
	AccountID int primary key auto_increment,
    Email varchar(100),
    Username varchar(100),
	Fullname varchar(100),
    DepartmentID int,
    PositionID int,
    CreateDate date
);

create table if not exists `Group` (
	GroupID int primary key auto_increment,
    GroupName varchar(100),
    CreatorID int,
    CreateDate date
);

create table if not exists GroupAccount (
	GroupID int,
    AccountID int,
    JoinDate date    
);

create table if not exists TypeQuestion (
	TypeID int primary key auto_increment,
    TypeName varchar(100)
);

create table if not exists CategoryQuestion (
	CategoryID int primary key auto_increment,
    CategoryName varchar(100)
);

create table if not exists Question (
	QuestionID int primary key auto_increment,
    Content varchar(500),
    CategoryID int,
    TypeID int,
    CreatorID int,
    CreateDate date
);

create table if not exists Answer (
	AnswerID int primary key auto_increment,
    Content varchar(500),
    QuestionID int,
    isCorrect boolean
);

create table if not exists Exam (
	ExamID int primary key auto_increment,
    `Code` int,
    Title varchar(100),
    CategoryID int,
    Duration datetime,
    CreatorID int,
    CreateDate date
);

create table if not exists ExamQuestion (
	ExamID int,
    QuestionID int
);