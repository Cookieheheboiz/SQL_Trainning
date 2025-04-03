use company_management;

-- cau 1
select a.*, d.DepartmentName from `Account` a
join Department d on a.DepartmentID = d.DepartmentID;


-- cau 2
select * from `account`
where CreateDate > '2020-12-20';

-- cau 3
select a.* from `account` a
join Department d on d.DepartmentID = a.DepartmentID and d.DepartmentName = 'Developer';

-- cau 4
select DepartmentName as bophan, count(a.DepartmentID) as thanhvien from Department d
join `Account` a on d.DepartmentID = a.DepartmentID
group by DepartmentName
having count(a.DepartmentID) > 3;




-- cau 5
select q.QuestionID, count(eq.QuestionID) as tansuat from Question q 
join ExamQuestion eq on q.QuestionID = eq.QuestionID
group by q.QuestionID 
order by eq.QuestionID desc
limit 1;


-- cau 6
select cq.CategoryName, count(q.QuestionID) as solanxuathiencauhoi from CategoryQuestion cq
left join Question q on q.CategoryID = cq.CategoryID 
group by cq.CategoryName
order by count(q.QuestionID) desc; 


-- cau 7
select q.QuestionID, count(eq.ExamID) as solanxuathien
from Question q
left join ExamQuestion eq on q.QuestionID = eq.QuestionID
group by q.QuestionID;



-- cau 8
select q.QuestionID, count(a.AnswerID) as solanxuathien from Question q
join Answer a on a.QuestionID = q.QuestionID 
group by q.QuestionID
order by count(a.AnswerID) desc
limit 1;


select * from `group`;
select * from `Account`;


-- cau 9
select g.GroupName, count(a.AccountID) as sonhom from `Group` g 
left join `Account` a on g.CreatorID = a.AccountID
group by g.GroupName 
order by count(a.AccountID) desc;

-- cau 10 
select p.PositionName , count(a.AccountID) as songuoi from Position p 
left join `Account` a on p.PositionID = a.PositionID 
group by p.PositionName
order by count(a.AccountID) asc 
limit 1;

-- cau 11
select d.DepartmentName, p.PositionName, count(a.AccountID) as soluong from Department d
join `Account` a on d.DepartmentID = a.DepartmentID
join Position p on p.PositionID = a.PositionID
group by d.DepartmentName, p.PositionName;


select * from Answer;
-- cau 12
select q.*, tq.TypeName, a.Fullname, an.Content from Question q 
join `Account` a on a.AccountID = q.CreatorID 
join TypeQuestion tq on tq.TypeID = q.TypeID
left join answer an on q.QuestionID = an.QuestionID;

-- Cau 13
select tq.TypeName, count(q.QuestionID) as soluong from TypeQuestion tq
left join Question q on tq.TypeID = q.TypeID
group by tq.TypeID;

-- cau 14
select g.* from `Group` g
left join GroupAccount ga ON g.GroupID = ga.GroupID
WHERE ga.AccountID is null;

-- cau 15
select g.* from `Group` g
left join GroupAccount ga ON g.GroupID = ga.GroupID
WHERE ga.AccountID is null;

-- cau 16
select q.* from Question q
left join Answer a on q.QuestionID = a.QuestionID
where a.AnswerID is null;



-- cau 17
select AccountID from GroupAccount where GroupID = 1;
select AccountID from GroupAccount where GroupID = 2;

(select AccountID from GroupAccount where GroupID = 1)
union 
(select AccountID from GroupAccount where GroupID = 2);


-- cau 18
select g.GroupName from `group` g
join GroupAccount ga on g.GroupID = ga.GroupID
group by g.GroupName 
having count(ga.AccountID) > 5;

select g.GroupName from `group` g
join GroupAccount ga on g.GroupID = ga.GroupID
group by g.GroupName 
having count(ga.AccountID) < 7;

 
(select g.GroupName from `group` g
join GroupAccount ga on g.GroupID = ga.GroupID
group by g.GroupName 
having count(ga.AccountID) > 5)
union
(select g.GroupName from `group` g
join GroupAccount ga on g.GroupID = ga.GroupID
group by g.GroupName 
having count(ga.AccountID) < 7);





