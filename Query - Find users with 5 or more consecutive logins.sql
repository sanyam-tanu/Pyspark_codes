-- Find users with 5 or more consecutive logins


create table accounts3( id int, name varchar(50));

create table logins (id int, login_date date); 

insert into accounts3 values (1, 'Winston'), (7, 'Jonathan');

insert into logins values
(7,'2020-05-30'),
(1,'2020-05-30'),
(7,'2020-05-31'),
(7,'2020-06-01'),
(7,'2020-06-02'),
(7,'2020-06-02'),
(7,'2020-06-03'),
(1,'2020-06-07'),
(7,'2020-06-10')

----
select * from accounts3 
where id in
(
select distinct a.id as id from logins a
join logins b on a.id=b.id and datediff(day, a.login_date, b.login_date) between 1 and 4
group by a.id, a.login_date
having count(distinct b.login_date)>=4)




