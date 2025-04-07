
-- cau 1
create view List_of_Sale as
select a.* from Department d 
join `Account` a on d.DepartmentID = a.DepartmentID
where d.departmentName = 'Sale';

select * from List_of_Sale;


-- cau 2

create view List_of_MostAccountGroup as
with GroupCount as (
select AccountID, count(GroupID) as sonhomdathamgia from GroupAccount
group by AccountID),
MaxGroup as (
select max(sonhomdathamgia) as MaxAccountGroup from GroupCount
)
select a.* from `Account` a 
join GroupCount g on a.AccountID = g.AccountID
join MaxGroup m on m.MaxAccountGroup = g.sonhomdathamgia; 

select * from List_of_MostAccountGroup;

-- cau 3

create view List_of_long_question as 
select * from Question q 
where length(q.Content) - length(replace(q.Content, ' ', '')) > 300;

delete from question where length(Content) - length(replace(Content, ' ', '')) > 300;

-- cau 4

create view List_of_MostDepartmentEmployee as
with CountEmployee as (
select DepartmentID, count(AccountID) as sonhanvien from `Account` a
group by DepartmentID), 
MaxEmployee as (
select max(sonhanvien) as MaxNumEmployee from CountEmployee)
select d.* from Department d 
join CountEmployee c on c.DepartmentID = d.DepartmentID
join MaxEmployee m on m.MaxNumEmployee = c.sonhanvien;

select * from List_of_MostDepartmentEmployee;


-- cau 5
create view List_question_gen_by_Nguyen as
select q.* from question q 
join `Account` a on a.AccountID = q.CreatorID
where a.FullName like 'Nguyen%';

select * from List_question_gen_by_Nguyen;


 

