/*
 	[join]
 	- 두 테이블의 공통된 정보(key value)를 기준으로 테이블 연결해서 한 테이블처럼
 	보는 것을 말함 
 */
-- Left Join(A,B증 A에 해당되는 값들만 출력)
select a.user_id, b.user_id from users as a
left join point_users as b
on a.user_id = b.user_id 

-- Inner Join(A,B중 값이 있는 것만 출력===교집합)
select a.user_id, b.user_id from users as a
inner join point_users as b
on a.user_id = b.user_id 

-- testing
select o.user_id, u.user_id from orders o
inner join users u 
on o.user_id = u.user_id 

select c.user_id, u.user_id from checkins c
inner join users u
on c.user_id = u.user_id

select e.course_id, c.course_id from enrolleds e
inner join courses c 
on e.course_id = c.course_id

-- join
select c.course_id, c2.title, count(*) as cnt from checkins c 
inner join courses c2 
on c.course_id = c2.course_id 
group by c.course_id 

select p.user_id, u.name, u.email, p.`point` from point_users p
inner join users u 
on p.user_id = u.user_id
order by p.point desc

select o.user_id, u.name, count(u.name) as cnt from orders o
inner join users u
on o.user_id = u.user_id 
where u.email like '%naver.com'
group by u.name

-- quiz
select o.payment_method, round(avg(p.`point`)) as avg_point from point_users p
inner join orders o 
on p.user_id = o.user_id 
group by o.payment_method 

select u.name, count(*) as cnt from enrolleds e
inner join users u
on e.user_id = u.user_id
where e.is_registered = 0
group by u.name
order by cnt desc

select c.course_id, c.title, count(e.is_registered) as cnt from courses c
inner join enrolleds e
on c.course_id = e.course_id
where e.is_registered = 0
group by c.course_id
order by cnt desc

select c.title, c2.week, count(c2.updated_at) as cnt from courses c 
inner join checkins c2 
on c.course_id = c2.course_id 
group by c.title, c2.week
order by c.title asc

select c3.title, c4.week, count(o.created_at) as cnt from courses c3
inner join checkins c4
on c3.course_id = c4.course_id 
inner join orders o 
on o.user_id = c4.user_id 
where o.created_at >= '2020-08-01'
group by c3.title, c4.week
order by c3.title asc

-- Left Join
select u.name, count(*) as cnt from users u
left join point_users p
on u.user_id = p.user_id 
where p.point_user_id is NULL 
group by u.name

select count(pu.point_user_id) as pnt_user_cnt, 
	   count(u2.user_id) as tot_user_cnt,
	   round(count(pu.point_user_id)/count(u2.user_id),2 ) as ratio
   from users u2
   left join point_users pu 
   on u2.user_id = pu.user_id 
  where u2.created_at BETWEEN '2020-07-10' AND '2020-07-20'
  
-- Union(A 와 B === 합집합)
  (select '7월' as month, c1.title, c2.week, count(*) as cnt from courses c1
  inner join checkins c2
  on c1.course_id = c2.course_id 
  inner join orders o2
  on c2.user_id = o2.user_id 
  where o2.created_at < '2020-08-01'
  group by c1.title, c2.week
  order by c1.title, c2.week)
  union all
  (select '8월' as month, c1.title, c2.week, count(*) as cnt from courses c1
  inner join checkins c2
  on c1.course_id = c2.course_id 
  inner join orders o2
  on c2.user_id = o2.user_id 
  where o2.created_at >= '2020-08-01'
  group by c1.title, c2.week
  order by c1.title, c2.week)
  
-- quiz
select ed.enrolled_id, e.user_id, sum(ed.done) as max_count from enrolleds e
inner join enrolleds_detail ed 
on e.enrolled_id = ed.enrolled_id 
where ed.done = 1
group by ed.enrolled_id, e.user_id 
order by max_count desc