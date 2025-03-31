create database if not exists company_management;

use company_management;

create table if not exists Department (
	DepartmentID smallint unsigned primary key auto_increment,
    DepartmentName varchar(50)    
);

insert into Department (DepartmentName) values ('Sale'), ('Marketing'), ('CEO'), ('Giáo viên'), ('Bảo vệ');

create table if not exists Position (
	PositionID smallint unsigned primary key auto_increment,
    PositionName enum('Dev', 'Test', 'Scrum Master', 'PM')
);
insert into Position (PositionName) values ('Dev'), ('Test'), ('Scrum Master'), ('PM'), ('PM');


create table if not exists `Account` (
	AccountID tinyint unsigned primary key auto_increment,
    Email varchar(50) unique key,
    Username varchar(50) unique key,
	Fullname varchar(50),
    DepartmentID smallint unsigned,
    PositionID smallint unsigned,
    CreateDate date,
    foreign key(DepartmentID) references Department(DepartmentID),
    foreign key(PositionID) references Position (PositionID)
);

insert into `company_management`.`Account` (`Email`, `Username`, `Fullname`, `DepartmentID`, `PositionID`, `CreateDate`) values ('NguyenVanA@gmail.com', 'A', 'Nguyen Van A', '1', '1', '2025-04-01');
insert into `company_management`.`Account` (`Email`, `Username`, `Fullname`, `DepartmentID`, `PositionID`, `CreateDate`) values ('NguyenVanB@gmail.com', 'B', 'Nguyen Van B', '2', '2', '2025-04-01');
insert into `company_management`.`Account` (`Email`, `Username`, `Fullname`, `DepartmentID`, `PositionID`, `CreateDate`) values ('NguyenVanC@gmail.com', 'C', 'Nguyen Van C', '3', '3', '2025-04-01');
insert into `company_management`.`Account` (`Email`, `Username`, `Fullname`, `DepartmentID`, `PositionID`, `CreateDate`) values ('NguyenVanD@gmail.com', 'D', 'Nguyen Van D', '4', '4', '2025-04-01');
insert into `company_management`.`Account` (`Email`, `Username`, `Fullname`, `DepartmentID`, `PositionID`, `CreateDate`) values ('NguyenVanE@gmail.com', 'E', 'Nguyen Van E', '5', '5', '2025-04-01');


create table if not exists `Group` (
	GroupID tinyint unsigned primary key auto_increment,
    GroupName varchar(50),
    CreatorID tinyint unsigned,
    CreateDate date,
    foreign key(CreatorID) references `Account` (AccountID)
);
insert into `company_management`.`Group` (`GroupName`, `CreatorID`, `CreateDate`) values ('Dev', 1, '2025-04-01'), ('Test', 2, '2025-04-01'), ('Scrum Master', 3, '2025-04-01'), ('PM', 4, '2025-04-01'), ('Test', 5, '2025-04-01');

create table if not exists GroupAccount (
	GroupID tinyint unsigned,
    AccountID tinyint unsigned,
    JoinDate date, 
    foreign key(GroupID) references `Group` (GroupID),
    foreign key(AccountID) references `Account` (AccountID)
);
select * from `Group`;

insert into `company_management`.`GroupAccount` (`GroupID`, `AccountID`, `JoinDate`) values (1, 1, '2025-04-01'), (1, 2, '2025-04-02'),  (2, 2, '2025-04-01'),  (3, 3, '2025-04-01'),  (4, 4, '2025-04-01'),  (5, 5, '2025-04-01'); 


create table if not exists TypeQuestion (
	TypeID tinyint unsigned primary key auto_increment,
    TypeName varchar(100)
);

insert into `company_management`.`TypeQuestion` (`TypeName`) values ('Multiple Choice'), ('True/False'), ('Short Answer'), ('Essay'), ('Fill in the Blank');     


create table if not exists CategoryQuestion (
	CategoryID tinyint unsigned primary key auto_increment,
    CategoryName varchar(100)
);

insert into `company_management`.`CategoryQuestion` (`CategoryName`) values ('Toán học'), ('Khoa học'), ('Tiếng Anh'), ('Lịch sử'), ('Công nghệ');     


create table if not exists Question (
	QuestionID tinyint unsigned primary key auto_increment,
    Content varchar(500),
    CategoryID tinyint unsigned,
    TypeID tinyint unsigned,
    CreatorID tinyint unsigned,
    CreateDate date,
    foreign key(CategoryID) references CategoryQuestion (CategoryID),
    foreign key(TypeID) references TypeQuestion (TypeID),
    foreign key(CreatorID) references `Account` (AccountID)
);

insert into `company_management`.`Question` (`Content`, `CategoryID`, `TypeID`, `CreatorID`, `CreateDate`) values ('1 + 1?', 1, 1, 1, '2025-04-01'), ('Tôi có đẹp trai không?', 2, 2, 2, '2025-04-01'), ('Trình bày về AI bây giờ', 5, 4, 3, '2025-04-01'), ('Ngày giỗ tổ Hùng Vương là ngày nào', 4, 1, 4, '2025-04-01'), ('Gà có trước hay trứng có trước', 2, 4, 5, '2025-04-01'); 

create table if not exists Answer (
	AnswerID tinyint unsigned primary key auto_increment,
    Content varchar(500),
    QuestionID tinyint unsigned,
    isCorrect boolean,
    foreign key(QuestionID) references Question (QuestionID)
);

insert into `company_management`.`Answer` (`Content`, `QuestionID`, `isCorrect`) values ('2', 1, TRUE), ('Có', 2, TRUE), ('ChatGPT, Grok', 3, FALSE), ('Ngày 10 tháng 3 âm lịch', 4, TRUE), ('Gà có trước', 5, FALSE);


create table if not exists Exam (
	ExamID tinyint unsigned primary key auto_increment,
    `Code` tinyint unsigned,
    Title varchar(100),
    CategoryID tinyint unsigned,
    Duration datetime,
    CreatorID tinyint unsigned,
    CreateDate date,
    foreign key(CategoryID) references CategoryQuestion (CategoryID),
    foreign key(CreatorID) references `Account` (AccountID)
);

insert into `company_management`.`Exam` (`Code`, `Title`, `CategoryID`, `Duration`, `CreatorID`, `CreateDate`) values (1, 'Toán', 1, '2025-04-01 07:00:00', 1, '2025-04-01'), (2, 'Văn', 2, '2025-04-01 11:00:00', 2, '2025-04-01'), (3, 'Tin học', 3, '2025-04-01 13:30:00', 3, '2025-04-01'), (4, 'Lịch sử', 4, '2025-04-01 15:30:00', 4, '2025-04-01'), (5, 'Sinh học', 5, '2025-04-01 17:30:00', 5, '2025-04-01');

insert into `company_management`.`ExamQuestion` (`ExamID`, `QuestionID`) values (1, 1),  (2, 3), (3, 4), (4, 5), (5, 2);  
create table if not exists ExamQuestion (
	ExamID tinyint unsigned,
    QuestionID tinyint unsigned,
    foreign key(ExamID) references `Exam` (ExamID),
    foreign key(QuestionID) references Question (QuestionID)
);