select * from `group`;
select * from `account`;
select * from GroupAccount;
select * from department;
select * from position;
select * from question;
select * from typequestion;
select * from exam;
select * from examQuestion;
select * from answer;
-- cau 1
DELIMITER //
create trigger CannotTypeInGroup before insert on `Group`
for each row 
begin
	if new.CreateDate < date_sub(current_date(), interval 1 year) then
		signal sqlstate '45000'
        set message_text = 'Khong the nhap thong tin vao duoc vi thoi gian tao da qua lau';
	end if;
end //
DELIMITER ;

-- cau 2
DELIMITER //
create trigger CannotAddSaleUser before insert on `Account`
for each row 
begin
	declare department_name varchar(100);
    select DepartmentName into department_name from Department
    where DepartmentID = new.DepartmentID;
    if department_name = "Sale" then 
		signal sqlstate '45000'
        set message_text = 'Khong the them mot user la Sale duoc nua';
	end if;
end //
DELIMITER ;

-- cau 3

DELIMITER //
create trigger Only5Userin1Group before insert on `Group`
for each row 
begin
	declare numberofuser tinyint unsigned;
    select count(*) into numberofuser from GroupAccount
    where GroupID = new.GroupID;
    if numberofuser > 5 then 
		signal sqlstate '45000'
        set message_text = 'Mot group ko duoc qua 5 nguoi';
	end if;
end //
DELIMITER ;

-- cau 4
DELIMITER //
create trigger Only10Questionin1ExamQuestion before insert on ExamQuestion
for each row 
begin
	declare numberofquestion tinyint unsigned;
    select count(*) into numberofquestion from ExamQuestion
    where ExamID = new.ExamID;
    if numberofquestion > 10 then 
		signal sqlstate '45000'
        set message_text = 'Mot bai kiem tra ko duoc qua 10 cau hoi';
	end if;
end //
DELIMITER ;

-- cau 5
DELIMITER //
create trigger DeleteOtherAccountExceptAdmin before delete on `Account`
for each row 
begin
	if old.Email = 'admin@gmail.com' then
		signal sqlstate '45000'
        set message_text = 'Khong duoc xoa tai khoan cua admin';
	end if;
end //
DELIMITER ;

-- cau 6
DELIMITER //
create trigger AddAccountWithWaitingDepartment before insert on `Account`
for each row 
begin
	if new.DepartmentID is null then
		set new.DepartmentID = 17;
	end if;
end //
DELIMITER ;

-- cau 7
DELIMITER //
create trigger OnlyAnswerWithOnly2CorrectAnswer before insert on Answer
for each row 
begin
	declare numberofanswer tinyint unsigned;
    declare numberofcorrectanswer tinyint unsigned;
    select count(*) into numberofanswer from Answer 
    where QuestionID = new.QuestionID;
    select count(*) into numberofcorrectanswer from Answer 
    where QuestionID = new.QuestionID and isCorrect = true;
    
    if numberofanswer > 4 then
		signal sqlstate '45000'
        set message_text = 'Khong the co qua 4 dap an trong 1 cau hoi';
	end if;
    if numberofcorrectanswer > 2 and new.isCorrect = true then
		signal sqlstate '45000'
        set message_text = 'Chi co toi da 2 dap an dung trong 1 cau hoi thoi';
	end if;
end //
DELIMITER ;




alter table `Account`
add Gender varchar(20);
-- cau 8

DELIMITER //
create trigger AddAccountGender before insert on `Account`
for each row 
begin
	if new.Gender = 'nam' then
		set new.Gender = 'M';
	elseif new.Gender = 'nu' then
		set new.Gender = 'F';
	else 
		set new.Gender = 'U';
	end if;
end //
DELIMITER ;

-- cau 9
DELIMITER //
create trigger CannotDelete2DayAgoExam before delete on Exam
for each row 
begin
	if old.CreateDate < date_sub(current_date, interval 2 day) then
		signal sqlstate '45000'
        set message_text = 'Khong duoc xoa bai kiem tra moi tao trong vong 2 ngay truoc';
    end if;
end //
DELIMITER ;

-- cau 10
DELIMITER //
create trigger CannotUpdateExistsQuestionInExam before update on Question
for each row 
begin
	if exists (select eq.* from ExamQuestion eq where eq.QuestionID = old.QuestionID) then
		signal sqlstate '45000'
        set message_text = 'Khong duoc update cau hoi da co san trong exam';
    end if;
end //
DELIMITER ;

DELIMITER //
create trigger CannotDeleteExistsQuestionInExam before update on Question
for each row 
begin
	if exists (select eq.* from ExamQuestion eq where eq.QuestionID = old.QuestionID) then
		signal sqlstate '45000'
        set message_text = 'Khong duoc xoa cau hoi da co san trong exam';
    end if;
end //
DELIMITER ;

-- cau 12 

select ExamID,
	case
		when Duration <= 30 then 'Short time'
        when Duration <= 60 then 'Medium time'
        else 'Long time'
		end as TypeOfDuration
from Exam;


-- cau 13
select g.GroupID, g.GroupName, count(ga.AccountID) as soluongtaikhoan,
	case
		when count(ga.AccountID) <= 5 then 'few'
        when count(ga.AccountID) <= 20 then 'normal'
        else 'higher'
        end as the_number_user_amount
from `Group` g
left join GroupAccount ga on g.GroupID = ga.GroupID
group by g.GroupID, g.GroupName;


-- cau 14
select d.DepartmentID, d.DepartmentName,
	case 
		when count(a.AccountID) = 0 then 'Khong co User'
        else count(a.AccountID)
        end as AmountofUser
from Department d 
left join `Account` a on a.DepartmentID = d.DepartmentID
group by d.DepartmentID, d.DepartmentName;


