# TINYINT	takes	1 byte.  Range:	-128		to 127
# SMALLINT 	takes 	2 bytes. Range: -32768 		to 32767
# MEDIUMINT 	takes	3 bytes. Range:	-8388608	to 8388607
# mysql -u root -p

CREATE DATABASE netflix CHARACTER SET = latin1;

DROP TABLE `netflix`.`ratings2`;

CREATE TABLE `netflix`.`ratings2`(
  `movie_id` smallint(6) DEFAULT NULL,
  `customer_id` mediumint(9) DEFAULT NULL,
  `rating` tinyint(4) DEFAULT NULL,
  KEY `movie_id` (`movie_id`),
  KEY `customer_id` (`customer_id`),
  KEY `rating` (`rating`)
) ENGINE=MEMORY DEFAULT CHARSET=latin1;


SET SQL_LOG_BIN = 0;
ALTER TABLE ratings2 DISABLE KEYS;

LOAD DATA INFILE 'C:/Users/hang/git/S683x/kdd2007a.data' 
INTO TABLE ratings2
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
(movie_id,customer_id,rating);

#Query OK, 100000 rows affected, 65535 warnings (0.20 sec)
#Records: 100000  Deleted: 0  Skipped: 0  Warnings: 98855

LOAD DATA INFILE 'C:/Users/hang/git/S683x/kdd2007a.data' 
INTO TABLE ratings2
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
(movie_id,customer_id,rating);

#Query OK, 100000 rows affected, 65535 warnings (0.21 sec)
#Records: 100000  Deleted: 0  Skipped: 0  Warnings: 98855


LOAD DATA INFILE 'C:/Users/hang/git/S683x/kdd2007a.data' 
INTO TABLE ratings2
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
(movie_id,customer_id,rating);

# Query OK, 100000 rows affected, 65535 warnings (0.22 sec)
# Records: 100000  Deleted: 0  Skipped: 0  Warnings: 98855

ALTER TABLE mytable ENABLE KEYS;
# LOAD INDEX INTO CACHE ratings2 IGNORE LEAVES;

select rating, count(rating) from ratings2 group by rating;

# A sample of ratings in 2006. 
# Given 100,000 watching times, how many ratings were recorded?
select rating, count(rating), round(count(rating)*100/(select count(*) from ratings2),2) percent_of_total from ratings2 group by rating;

# In 2006 sample, how many unique customers?
# In 2006 sample, how many unique movies?
select COUNT(DISTINCT customer_id) from ratings2;
select COUNT(DISTINCT movie_id) from ratings2;

# Top 10 watchers
SELECT	customer_id, COUNT(customer_id) AS watch_counts
FROM	ratings2
GROUP	BY customer_id
ORDER	BY watch_counts DESC 
LIMIT 10 ;

# Top 10 watched movies 
SELECT	movie_id, COUNT(movie_id) AS watch_counts
FROM	ratings2
GROUP	BY movie_id
ORDER	BY watch_counts DESC 
LIMIT 10 ;

# of times this particular movie was watched by each top watcher
select customer_id, count(customer_id) as watch_count 
from  ratings2 
where movie_id = 32767 
group by customer_id 
order by watch_count DESC 
LIMIT 10 ;

# of ratings this particular movie has
select rating, count(rating) as rating_count 
from  ratings2 
where movie_id = 32767 
group by rating
order by rating_count DESC;

# find some customers who watched more than 3 times in 2006
SELECT	customer_id, COUNT(customer_id) AS watch_counts
FROM	ratings2 
where movie_id != 32767 
GROUP	BY customer_id
having watch_counts >= 3  
order by watch_counts DESC ;

# see how each of the above random rate
SELECT	customer_id, movie_id, rating FROM	ratings2
where customer_id in (17405)
order by rating  DESC;

# what did customer 17405 rate (not counting for movie 32767)
SELECT	customer_id, movie_id, rating FROM	ratings2
where customer_id = 17405 and movie_id != 32767 
order by rating DESC;

SELECT	customer_id, movie_id, rating FROM	ratings2
where customer_id = 13255 and movie_id != 32767 
order by rating DESC;

SELECT	customer_id, movie_id, rating FROM	ratings2
where customer_id = 13614 and movie_id != 32767 
order by rating DESC;

select COUNT(DISTINCT customer_id) from ratings2 
where customer_id not in (select DISTINCT customer_id from ratings2 where rating > 0);

select COUNT(DISTINCT customer_id) from ratings2 
where customer_id in (select DISTINCT customer_id from ratings2 where rating > 0);


select COUNT(DISTINCT customer_id) from ratings2 
where customer_id not in (select DISTINCT customer_id from ratings2 where rating > 0)
and movie_id != 32767 ;

select COUNT(DISTINCT customer_id) from ratings2 
where customer_id in (select DISTINCT customer_id from ratings2 where rating > 0)
and movie_id != 32767 ;


select customer_id, count(customer_id) as count_rating from ratings2 
where customer_id in (select DISTINCT customer_id from ratings2 where rating > 0)
group by customer_id
having count_rating = 1;

select customer_id, count(customer_id) as count_rating from ratings2 
where customer_id in (select DISTINCT customer_id from ratings2 where rating > 0)
group by customer_id
having count_rating = 2;

select customer_id, count(customer_id) as count_rating from ratings2 
where customer_id in (select DISTINCT customer_id from ratings2 where rating > 0)
group by customer_id
having count_rating = 3;

select customer_id, count(customer_id) as count_rating from ratings2 
where customer_id in (select DISTINCT customer_id from ratings2 where rating > 0)
group by customer_id
having count_rating >= 1 and count_rating <= 5;

select customer_id, count(customer_id) as count_rating from ratings2 
where customer_id in (select DISTINCT customer_id from ratings2 where rating > 0)
group by customer_id
having count_rating >= 6 and count_rating <= 10;

select customer_id, count(customer_id) as count_rating from ratings2 
where customer_id in (select DISTINCT customer_id from ratings2 where rating > 0)
group by customer_id
having count_rating >= 11 and count_rating <= 20;

select customer_id, count(customer_id) as count_rating from ratings2 
where customer_id in (select DISTINCT customer_id from ratings2 where rating > 0)
group by customer_id
having count_rating >= 21 and count_rating <= 30;


select customer_id, count(customer_id) as count_rating from ratings2 
where customer_id in (select DISTINCT customer_id from ratings2 where rating > 0)
group by customer_id
having count_rating >= 31 and count_rating <= 50;

select customer_id, count(customer_id) as count_rating from ratings2 
where customer_id in (select DISTINCT customer_id from ratings2 where rating > 0)
group by customer_id
having count_rating > 50;

# count how many customers who did nor rate in sample 2006. 
create table nonrating(customer_id mediumint) 
SELECT customer_id 
    from ratings2  
    where customer_id not in (select DISTINCT customer_id from ratings2 where rating > 0);


select COUNT(DISTINCT customer_id) 
from ratings2 
where rating > 0 
and movie_id != 32767 ;

select COUNT(DISTINCT customer_id) 
from ratings2 
where movie_id != 32767;

select COUNT(DISTINCT customer_id) 
from ratings2 
where movie_id != 32767 and rating > 0 ;

select COUNT(DISTINCT customer_id) 
from ratings2 
where movie_id != 32767 and rating = 0 ;


select COUNT(DISTINCT customer_id) from ratings2 
where customer_id not in (select DISTINCT customer_id from ratings2 where rating > 0)
and movie_id != 32767 ;

select COUNT(DISTINCT customer_id) from ratings2 
where customer_id in (select DISTINCT customer_id from ratings2 where rating > 0)
and movie_id != 32767 ;


select customer_id, count(customer_id) as rating_count 
from  ratings2 
where movie_id != 32767 and rating > 0 
group by customer_id 
having rating_count >= 2
order by rating_count DESC;

SELECT	movie_id, COUNT(movie_id) AS rating_counts
FROM	ratings2
where rating > 0 
GROUP	BY movie_id
ORDER	BY rating_counts DESC 
LIMIT 10 ;

