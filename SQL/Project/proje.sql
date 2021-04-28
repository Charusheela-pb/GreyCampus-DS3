SELECT * FROM cd.facilities

SELECT name,membercost FROM cd.facilities


SELECT * FROM cd.facilities
WHERE membercost > 0

SELECT facid, name,membercost,monthlymaintenance FROM cd.facilities
WHERE membercost > 0 AND (membercost < monthlymaintenance/50)


SELECT * FROM cd.facilities
WHERE name LIKE  '%Tennis%'

SELECT * FROM cd.facilities
WHERE facid IN (1,5) 


SELECT memid,surname,firstname,joindate FROM cd.members
WHERE joindate > ('2012-09-01')

SELECT DISTINCT surname FROM cd.members
ORDER BY surname 
LIMIT 10


SELECT max(joindate)
FROM cd.members

SELECT  COUNT(facid) FROM cd.facilities
WHERE guestcost >= 10


SELECT facid, SUM(slots) AS Totalslots
FROM cd.bookings
WHERE cd.bookings.starttime BETWEEN '2012-09-01' AND '2012-09-30'
GROUP by facid
ORDER BY SUM(slots)


SELECT facid,SUM(slots) AS Totalslots FROM cd.bookings
GROUP BY facid
HAVING SUM(slots) > 1000
ORDER BY facid

SELECT starttime,name FROM cd.bookings
INNER JOIN cd.facilities ON cd.facilities.facid = cd.bookings.facid 
WHERE name LIKE '%Tennis Court%' AND starttime BETWEEN '2012-09-21' AND '2012-09-21'
ORDER BY starttime


SELECT starttime,surname,firstname FROM cd.bookings
INNER JOIN cd.members ON cd.members.memid = cd.bookings.memid
WHERE surname LIKE '%Farrell%' AND firstname LIKE '%David%'

