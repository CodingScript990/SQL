-- group by(범주 갯수, 범주의 최솟값, 평균값, 소수점 구하기, 합계)

SELECT week, COUNT(*) FROM checkins
group by week

SELECT week, MIN(likes) FROM checkins
group by week

SELECT week, MAX(likes) FROM checkins
group by week

SELECT week, AVG(likes) FROM checkins
group by week

SELECT week, ROUND(AVG(likes),0) FROM checkins
group by week

SELECT week, SUM(likes) FROM checkins
group by week

SELECT week, SUM(likes)  FROM checkins
WHERE week = 3

-- order by
-- ORDER BY ASC(오름차순)
SELECT name, COUNT(*) from users
group by name
ORDER BY COUNT(*) ASC 

-- ORDER BY DESC(내림차순)
SELECT name, COUNT(*) from users
group by name
ORDER BY COUNT(*) DESC 

select * from checkins
order by likes desc

-- together(where, group by)
select payment_method, count(*) from orders
group by payment_method

select payment_method, count(*) from orders
where course_title = '웹개발 종합반'
group by payment_method
order by count(*) asc

-- String order by asc, desc
select name from users
order by name asc

select name from users
order by name desc

-- quiz
select payment_method, count(*) from orders
where course_title = '앱개발 종합반'
group by payment_method 

select name, count(*) from users
where email like '%gmail.com'
group by name

select course_id, round(avg(likes),1)  from checkins
group by course_id

-- Alias
select payment_method, count(*) as cnt from orders o 
where o.course_title = '앱개발 종합반'
group by payment_method 

-- quiz2
select payment_method, count(*) from orders o 
where o.email like '%naver.com' and o.course_title = '앱개발 종합반'
group by o.payment_method 