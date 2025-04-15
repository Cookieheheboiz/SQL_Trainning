create database My_company;
use My_company;

-- cau 1
create table if not exists Users (
	id int primary key auto_increment,
    first_name varchar(30),
    last_name varchar(30),
    email varchar(100),
    phone varchar(20),
    employee_id varchar(20),
    avatar text,
    department_id int,
    gender tinyint,
    age int,
    created_at datetime,
    updated_at datetime
);

create table if not exists departments (
	id int primary key auto_increment,
    `name` varchar(30),
    `description` text,
	created_at datetime,
    updated_at datetime
);

create table if not exists user_department (
	id int primary key auto_increment,
    user_rid int,
    department_id int,
    start_date date,
    end_date date,
    created_at datetime,
    updated_at datetime,
    foreign key (user_rid) references users(id),
    foreign key (department_id) references departments(id)
);

create table if not exists roles (
	id int primary key auto_increment,
    name varchar(30),
    created_at datetime,
    updated_at datetime
);


create table if not exists user_role (
	id int primary key auto_increment,
    user_department_id int,
    role_id int, 
    start_date date,
    end_date date,
    created_at datetime, 
    updated_at datetime,
    foreign key (user_department_id) references user_department(id),
    foreign key (role_id) references roles(id)
);

create table if not exists salary (
	id int primary key auto_increment,
    user_role_id int, 
    total_salary double(12,2),
    `month` varchar(2),
    `year` varchar(4),
    created_at datetime,
    updated_at datetime,
    foreign key (user_role_id) references user_role(id)
);

create table if not exists salary_detail_type (
	id int primary key auto_increment,
    name varchar(10),
    created_at datetime,
    updated_at datetime
);

create table if not exists salary_detail (
	id int primary key auto_increment,
    amount double,
    salary_id int,
    salary_detail_type_id int,
    operation tinyint,
    foreign key (salary_id) references salary(id),
    foreign key (salary_detail_type_id) references salary_detail_type(id)
);

insert into departments(`name`, `description`, created_at, updated_at) values
('Admin', 'hành chính', '2020-12-21 00:00:00', '2021-03-14 00:00:00'),
('HR', 'nhân sự', '2020-12-25 00:00:00', '2021-03-14 00:00:00'),
('IT', 'công nghệ', '2020-12-25 00:00:00', '2021-03-14 00:00:00'),
('Delivery', 'vận chuyển', '2020-12-25 00:00:00', '2021-03-14 00:00:00');

select * from departments;

insert into users (first_name, last_name, email, phone, employee_id, avatar, department_id, gender, age, created_at, updated_at) values
('Nguyen', 'Van A', 'nguyenvana@gmail.com', '0123213544', '1',  '', 1, 1,28, now(), now()),
('Nguyen', 'Van B', 'nguyenvanb@gmail.com', '0146542343', '1',  '', 2, 2, 32, now(), now()),
('Nguyen', 'Van C', 'nguyenvanc@gmail.com', '0146576573', '1',  '', 3, 1, 32, now(), now()),
('Nguyen', 'Van D', 'nguyenvand@gmail.com', '0178673454', '1',  '', 4, 2, 32, now(), now()),
('Nguyen', 'Van E', 'nguyenvane@gmail.com', '0176574323', '1',  '', 5, 1, 32, now(), now()),
('Nguyen', 'Van F', 'nguyenvanf@gmail.com', '0123213544', '1',  '', 1, 1, 28, now(), now()),
('Nguyen', 'Van G', 'nguyenvang@gmail.com', '0146542342', '2',  '', 2, 2, 32, now(), now()),
('Nguyen', 'Van H', 'nguyenvanh@gmail.com', '0146572343', '3',  '', 3, 1, 32, now(), now()),
('Nguyen', 'Van J', 'nguyenvanj@gmail.com', '0178676544', '4',  '', 4, 2, 32, now(), now()),
('Nguyen', 'Van K', 'nguyenvank@gmail.com', '0176543286', '5',  '', 5, 1, 31, now(), now()),
('Nguyen', 'Van L', 'nguyenvanl@gmail.com', '0176347286', '1',  '', 5, 1, 21, now(), now()),
('Nguyen', 'Van M', 'nguyenvanm@gmail.com', '0235543286', '2',  '', 5, 1, 27, now(), now()),
('Nguyen', 'Van N', 'nguyenvann@gmail.com', '0455843286', '3',  '', 5, 1, 24, now(), now()),
('Nguyen', 'Van Q', 'nguyenvanq@gmail.com', '0175322286', '4',  '', 5, 1, 25, now(), now()),
('Nguyen', 'Van T', 'nguyenvant@gmail.com', '0834555286', '5',  '', 5, 1, 21, now(), now());


insert into user_department (user_rid, department_id, start_date, end_date, created_at, updated_at) values
(1, 1, '2021-12-10', null, now(), now()),
(1, 3, '2021-03-04', '2021-12-02', now(), now()),
(2, 2, '2023-01-01', '2023-12-31', now(), now()),
(2, 4, '2024-01-01', null, now(), now()),
(3, 4, '2022-06-01', '2023-06-01', now(), now()),
(3, 2, '2023-06-02', null, now(), now()),
(4, 3, '2021-01-01', '2022-12-31', now(), now()),
(4, 2, '2023-01-01', null, now(), now()),
(5, 2, '2022-01-01', '2023-05-31', now(), now()),
(5, 4, '2023-06-01', null, now(), now()),
(6, 2, '2024-01-01', null, now(), now()),
(7, 3, '2022-01-01', null, now(), now()),
(8, 2, '2022-01-01', null, now(), now()),
(9, 4, '2022-12-01', null, now(), now()),
(10, 1, '2021-11-01', null, now(), now()),
(11, 2, '2025-01-01', null, now(), now()),
(12, 3, '2022-11-21', null, now(), now()),
(13, 1, '2023-02-11', null, now(), now()),
(14, 3, '2023-05-23', null, now(), now()),
(15, 4, '2023-01-13', null, now(), now());


insert into roles (`name`, created_at, updated_at) values
('Giám đốc', '2020-01-01 00:00:00', '2020-01-01 00:00:00'), 
('Trưởng phòng', '2020-01-01 00:00:00', '2020-01-01 00:00:00'),
('Phó phòng', '2020-01-01 00:00:00', '2020-01-01 00:00:00'),
('Nhân viên', '2020-01-01 00:00:00', '2020-01-01 00:00:00'),
('CTV', '2020-01-01 00:00:00', '2020-01-01 00:00:00');


insert into user_role (user_department_id, role_id, start_date, created_at, updated_at) values
(1, 1,'2021-12-10', now(), now()),
(1, 2,'2021-03-04', now(), now()),
(3, 1,'2023-01-01', now(), now()),
(3, 3, '2024-01-01', now(), now()),
(5, 2, '2022-06-01', now(), now()),
(5, 3, '2021-12-12', now(), now()),
(2, 3, '2021-12-13', now(), now()),
(4, 1, '2021-12-14', now(), now()),
(6, 2, '2021-12-15', now(), now()),
(7, 3, '2021-12-16', now(), now()),
(8, 1, '2021-12-17', now(), now()),
(9, 3, '2021-12-18', now(), now()),
(10, 2, '2021-12-19', now(), now()),
(11, 2, '2021-12-20', now(), now()),
(12, 3, '2021-12-21', now(), now()),
(13, 1, '2021-12-22', now(), now()),
(14, 3, '2021-12-23', now(), now()),
(15, 2, '2021-12-24', now(), now()),
(16, 2, '2021-12-25', now(), now()),
(17, 1, '2021-12-26', now(), now()),
(18, 2, '2021-12-27', now(), now()),
(19, 3, '2021-12-28', now(), now()),
(20, 1, '2021-12-29', now(), now());

insert into salary (user_role_id, total_salary, `month`, year, created_at, updated_at) values
(1, 1000, 4, 2023, now(), now()),
(2, 1200, 4, 2023, now(), now()),
(3, 1300, 4, 2023, now(), now()),
(4, 1100, 4, 2023, now(), now()),
(5, 1050, 4, 2023, now(), now()),
(6, 950, 4, 2023, now(), now()),
(7, 1150, 4, 2023, now(), now()),
(8, 1230, 4, 2023, now(), now()),
(9, 990, 4, 2023, now(), now()),
(10, 980, 4, 2023, now(), now()),
(11, 1070, 4, 2023, now(), now()),
(12, 1030, 4, 2023, now(), now()),
(13, 1090, 4, 2023, now(), now()),
(14, 1170, 4, 2023, now(), now()),
(15, 960, 4, 2023, now(), now()),

(1, 1000, 5, 2023, now(), now()),
(2, 1200, 5, 2023, now(), now()),
(3, 1300, 5, 2023, now(), now()),
(4, 1100, 5, 2023, now(), now()),
(5, 1050, 5, 2023, now(), now()),
(6, 950, 5, 2023, now(), now()),
(7, 1150, 5, 2023, now(), now()),
(8, 1230, 5, 2023, now(), now()),
(9, 990, 5, 2023, now(), now()),
(10, 980, 5, 2023, now(), now()),
(11, 1070, 5, 2023, now(), now()),
(12, 1030, 5, 2023, now(), now()),
(13, 1090, 5, 2023, now(), now()),
(14, 1170, 5, 2023, now(), now()),
(15, 960, 5, 2023, now(), now()),

(1, 1000, 6, 2023, now(), now()),
(2, 1200, 6, 2023, now(), now()),
(3, 1300, 6, 2023, now(), now()),
(4, 1100, 6, 2023, now(), now()),
(5, 1050, 6, 2023, now(), now()),
(6, 950, 6, 2023, now(), now()),
(7, 1150, 6, 2023, now(), now()),
(8, 1230, 6, 2023, now(), now()),
(9, 990, 6, 2023, now(), now()),
(10, 980, 6, 2023, now(), now()),
(11, 1070, 6, 2023, now(), now()),
(12, 1030, 6, 2023, now(), now()),
(13, 1090, 6, 2023, now(), now()),
(14, 1170, 6, 2023, now(), now()),
(15, 960, 6, 2023, now(), now());

insert into salary_detail_type (name, created_at, updated_at) values
('Lương cứng', NOW(), NOW()),
('Phụ cấp', NOW(), NOW()),
('Thưởng', NOW(), NOW()),
('Thuế TNCN', NOW(), NOW()),
('BHXH', NOW(), NOW());


insert into salary_detail (amount, salary_id, salary_detail_type_id, operation) values
(100, 1, 1, 1), 
(50, 1, 2, 2),  
(150, 2, 5, 3),
(100, 2, 4, 4),
(200, 3, 1, 1),
(50, 4, 1, 2),
(100, 4, 1, 3),
(80, 5, 3, 4),
(70, 6, 2, 1),
(50, 7, 4, 1),
(120, 7, 1, 1),
(90, 8, 4, 2),
(60, 9, 3, 2),
(110, 10, 1, 3),
(40, 11, 2, 2),
(130, 12, 3, 3),
(120, 13, 5, 3),
(150, 14, 1, 3),
(100, 14, 3, 1),
(90, 15, 1, 2);

-- câu 2
-- 2a
select u.id, concat(u.first_name, ' ', u.last_name) as full_name, sum(s.total_salary) as total, s.`month` from users u
join user_department ud on ud.user_rid = u.id
join user_role ur on ur.user_department_id = ud.id
join salary s on s.user_role_id = ur.id
where u.id = 1 and s.`month` = 5
group by u.id, full_name;


-- 2b
select u.id, concat(u.first_name, ' ', u.last_name) as full_name, d.id, d.`name`, s.total_salary as total, s.`month` from users u
join user_department ud on ud.user_rid = u.id
join departments d on d.id = ud.department_id
join user_role ur on ur.user_department_id = ud.id
join salary s on s.user_role_id = ur.id
where d.id = 1 and s.`month` = 5
order by total desc;

-- 2c 
select u.id, concat(u.first_name, ' ', u.last_name) as full_name, s.`month`, s.`year`, s.total_salary as wwrong_salary, SUM(
    case 
        when sd.operation = 1 then sd.amount
        when sd.operation = 2 then -sd.amount
        when sd.operation = 3 then sd.amount  
        when sd.operation = 4 then sd.amount  
    end
) as real_salary from users u
join user_department ud on ud.user_rid = u.id
join user_role ur on ur.user_department_id = ud.id
join salary s on s.user_role_id = ur.id
join salary_detail sd on sd.salary_id = s.id
where s.`month` = 5 and s.`year` = 2020
group by u.id, full_name, s.`month`, s.total_salary
having s.total_salary != real_salary;


-- 2d
select d.id, d.`name`, SUM(
    case 
        when sd.operation = 1 then sd.amount
        when sd.operation = 2 then -sd.amount
        when sd.operation = 3 then sd.amount  
        when sd.operation = 4 then sd.amount  
    end
) as departments_cost from departments d
join user_department ud on d.id = ud.department_id
left join user_role ur on ud.id = ur.user_department_id
left join salary s on s.user_role_id = ur.id
left join salary_detail sd on sd.salary_id = s.id
where s.`month` = '5'
group by d.id, d.`name`
order by departments_cost desc;

-- câu 3 
DELIMITER // 
create procedure SalaryInMonth(in u_id int, in _month int)
	begin
		
		( select sdt.`name` as `Type`, sd.amount as `Amount`, sd.operation as `Operation` from salary_detail sd
        join salary s on sd.salary_id = s.id
		join user_role ur on s.user_role_id = ur.id
        join user_department ud on ur.user_department_id = ud.id
        join salary_detail_type sdt on sdt.id = sd.salary_detail_type_id
        where ud.user_rid = u_id and s.`month` = _month )
        
        union
        ( select 'Total' as 'Type', SUM(
    case 
        when sd.operation = 1 then sd.amount
        when sd.operation = 2 then -sd.amount
        when sd.operation = 3 then sd.amount  
        when sd.operation = 4 then sd.amount  
    end
) as Total_salary, '' as 'Operation' from salary_detail sd
join salary s on sd.salary_id = s.id
join user_role ur on s.user_role_id = ur.id
join user_department ud on ud.id = ur.user_department_id
where ud.user_rid = u_id and s.`month` = _month);
	end //
DELIMITER ;

call my_company.SalaryInMonth(3, 4);



-- cau 4

DELIMITER // 
create procedure GetUserInformationandSalaryInMonth(in u_id int, in _month int)
	begin
    declare fullname varchar(50);

    select concat(u.first_name, ' ', u.last_name) into fullname from users u
    where u_id = u.id;

		select fullname as `fullname`, d.`name` as `department`, r.`name` as `role`, SUM(
    case 
        when sd.operation = 1 then sd.amount
        when sd.operation = 2 then -sd.amount
        when sd.operation = 3 then sd.amount  
        when sd.operation = 4 then sd.amount  
    end
	) as `salary` from salary_detail sd
	join salary s on sd.salary_id = s.id
	join user_role ur on s.user_role_id = ur.id
	join user_department ud on ud.id = ur.user_department_id
    join departments d on d.id = ud.department_id
    join roles r on r.id = ur.role_id
	where ud.user_rid = u_id and s.`month` = _month
    group by `fullname`, `department`, `role`; 
    end //
    
DELIMITER ;

call my_company.GetUserInformationandSalaryInMonth(4, 4);

-- cau 5
DELIMITER //
create trigger CheckRoleTime before insert on user_role
for each row 
begin
	declare department_start date;
    declare department_end date;
    declare check_role_time int;
    select ud.start_date, ud.end_date into department_start, department_end from user_department ud
    where ud.id = new.user_department_id;
    
    if new.start_date < department_start or new.end_date > department_end then
    signal sqlstate '45000'
    set message_text = 'Thoi gian cua role phai nam trong thoi gian van con o department do';
    end if;
    
    select count(*) into check_role_time from user_role ur
    where ur.user_department_id = new.user_department_id and ((new.start_date >= ur.start_date and new.start_date <= ur.end_date) or (new.end_date >= ur.start_date and new.end_date <= ur.end_date));
    
    if check_role_time > 0 then
    signal sqlstate '45000'
    set message_text = 'trong khoang thoi gian nay van con role khac';
    end if;
end //
DELIMITER ;
drop trigger CheckRoleTime;
select * from user_role;
insert into my_company.user_role (id, user_department_id, role_id, start_date, end_date, created_at, updated_at) values ('24', '1', '3', '2022-03-12', '2023-01-11', '2025-04-15 09:49:55', '2025-04-15 09:49:55');

