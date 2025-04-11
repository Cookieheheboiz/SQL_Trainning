select * from `group`;
select * from `account`;
select * from GroupAccount;
select * from department;
select * from position;
select * from question;
select * from typequestion;
select * from exam;
select * from examQuestion;


-- cau 1
DELIMITER // 
create procedure TypeDepartmentName_and_PrintDepartmentAccount (In department_Name varchar(50))
begin
	select a.* from `Account` a
    join Department d on d.DepartmentID = a.DepartmentID
    where d.DepartmentName = department_Name;
end //
DELIMITER;

-- cau 2
DELIMITER // 
create procedure AmountAccountInGroup() 
begin
	select g.GroupID, g.GroupName, count(g.GroupAccount) from `Group` g
    left join GroupAccount ga on ga.groupID = g.groupID
    group by g.GroupID, g.GroupName;
end // 
DELIMITER ;

-- cau 3
DELIMITER // 
create procedure AmountOfQuestionInMonth() 
begin 
	select t.TypeID, t.TypeName, count(q.QuestionID) as AmountOfQuestion from Question q
    join TypeQuestion t on t.TypeID = q.TypeID
    where month(q.CreateDate) = month(current_date()) and year(q.CreateDate) = year(current_date())
    group by t.TypeID, t.TypeName;
end //
DELIMITER ;

drop procedure MostIDOfTypeQuestion;
-- cau 4
DELIMITER //
create procedure MostIDOfTypeQuestion(out MostTypeID tinyint unsigned)
begin
	select q.TypeID into MostTypeID from Question q
    group by q.TypeID
    order by count(q.QuestionID) desc
    limit 1;

end //
DELIMITER ;

-- cau 5

DELIMITER //
create procedure GetNameOfTypeQuestion(out NameOfTypeQuestion varchar(100))
begin
	declare MostTypeID tinyint unsigned;
    call MostOfTypeQuestion(MostTypeID);
	select t.TypeName from TypeQuestion t
    where TypeID = MostTypeID;
end //
DELIMITER ;

-- cau 6

DELIMITER //
create procedure GiveGroupNameOrUsername(in StringOfName varchar(100))
begin
	(select g.GroupName from `Group` g
    where g.GroupName like concat('%', StringOfName, '%'))
    union 
    (select a.Username from `Account` a
    where a.Username like concat('%', StringOfName, '%'));
end //
DELIMITER ;


-- cau 7
drop procedure InfoOfUser;
DELIMITER //
create procedure InfoOfUser(in fullname varchar(100), in email varchar(100))
begin
	declare this_username varchar(100);
    set this_username = substring_index(email, '@', 1);
    insert into `Account` (Email, Username, FullName, DepartmentID, PositionID, CreateDate)
    values (email, this_username, fullname, 17, 1, current_date());
end //
DELIMITER ;

-- cau 8
DELIMITER //
create procedure LongestContent(in TypeOfQuestion varchar(100))
begin
	select q.* from Question q
    join TypeQuestion t on t.TypeID = q.TypeID
    where t.TypeName = TypeOfQuestion
    order by length(q.content) desc
    limit 1;
end //
DELIMITER ;

-- cau 9

DELIMITER //
create procedure eraseExamByID (In Exam_ID tinyint unsigned)
begin
	delete from ExamQuestion Where ExamID = Exam_ID;
    delete from Exam where ExamID = Exam_ID;
end //
DELIMITER ;

-- cau 10
DELIMITER //
create procedure eraseThreeYearAgoExam ()
begin
	declare done int default false; 
	declare printAmount int default 0;
    declare IDofThatExam int;
	declare cur1 cursor for select ExamID from Exam
    where year(CreateDate) = year(current_date) - 3;
    declare continue handler for not found set done = true;
    open cur1;
    read_loop: loop
				fetch cur1 into IDofThatExam;
                if done then leave read_loop;
                end if;
                call eraseExamByID (IDofThatExam);
                set printAmount = printAmount + 1;
	end loop;
    close cur1;
	select printAmount as delete3yearagoExam;
end //
DELIMITER ;

-- cau 11
DELIMITER //
create procedure DeleteDepartment(in department_name varchar(100))
begin
	declare department_ID tinyint unsigned;
    select d.DepartmentID into department_ID from Department d
    where d.DepartmentName = department_name;
    
    update `Account` a
    set a.DepartmentID = 17 where a.DepartmentID = department_ID;
    
    delete from Department where DepartmentID = department_ID;
    
end //
DELIMITER ;

-- cau 12
DELIMITER //
create procedure NumberOfQuestionOfEachMonth()
begin
	select month(CreateDate) as `month`, count(*) as numberofquestion from Question
    where year(CreateDate) = year(current_date())
    group by `month`;
    
end //
DELIMITER ;

-- cau 13
DELIMITER //
create procedure NumberOfQuestionOf6MonthAgo()
begin
	select month(CreateDate) as `month`, count(*) as numberofquestion from Question
    where year(CreateDate) = year(current_date()) 
    group by `month`
    order by `month` desc 
    limit 6;
end //
DELIMITER ;

