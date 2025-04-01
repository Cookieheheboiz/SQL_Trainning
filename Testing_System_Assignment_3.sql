use company_management;

-- cau 2
select * from Department;

-- cau 3
select DepartmentID from Department 
where DepartmentName = 'Sale';

-- cau 4
select * from Account
order by length(Fullname) desc
limit 1;

-- cau 5
select * from `Account`
where DepartmentID = 3
order by length(Fullname) desc
limit 1;

select * from GroupAccount;

-- Cau 6
select `Group`.GroupName from `Group`
join GroupAccount on `Group`.GroupID = `GroupAccount`.GroupID
where `GroupAccount`.JoinDate < '2019-12-20' ;


-- Cau 7
select q.QuestionID from Question q
join Answer a on q.QuestionID = a.QuestionID
group by q.QuestionID 
having count(a.AnswerID) >= 4;

-- cau 8
select e.`Code` from exam e
where e.Duration >= 60 and e.CreateDate < '2019-12-20';

-- cau 9
select * from `Group`
order by CreateDate desc 
limit 5;

-- cau 10
select count(*) as CountEmployee from `Account`
where DepartmentID = 2;

-- cau 11
select * from `Account` 
where Fullname like 'D%o';

-- cau 12
delete from exam 
where CreateDate < '2019-12-20';

-- cau 13
delete from Question
where content like 'câu hỏi%';

-- cau 14
Update `Account` set Fullname = 'Nguyễn Bá Lộc', Email = 'loc.nguyenba@vti.com.vn'
where AccountID = 5;

-- Cau 15
Update GroupAccount set AccountID = 5 where GroupID = 4;


