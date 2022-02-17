-- Subquery
select user_id, name, email from users
where user_id in (
	select user_id from orders
	where payment_method = 'kakaopay'
)

-- Subquery(where)
-- where 필드명 in(subquery)

-- Subquery(select)
-- select 필드명, 필드명,(subquery) from

select c.checkin_id, c.user_id, c.likes, (
	select avg(likes) from checkins
	where user_id = c.user_id 
) as avg_likes_user from checkins c

-- Subquery(from)
select pu.user_id, pu.point, a.avg_likes from point_users pu
inner join(
	select user_id, round(avg(likes),1) as avg_likes from checkins
	group by user_id 
) a on pu.user_id = a.user_id

