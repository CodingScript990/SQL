-- table, select, where,!=, between, in, like, limit(제한), 
-- distinct(중복제거), count

SELECT email FROM users
WHERE name LIKE '남%%'

SELECT * FROM users
WHERE email LIKE '%gmail.com'
AND created_at BETWEEN '2020-07-12' AND '2020-07-14'

SELECT COUNT(*) FROM users
WHERE email LIKE '%gmail.com'
AND created_at BETWEEN '2020-07-12' AND '2020-07-14'
 
SELECT * FROM orders
WHERE email LIKE '%naver.com'
AND course_title = '웹개발 종합반'
AND payment_method = 'kakaopay'