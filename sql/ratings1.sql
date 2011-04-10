# TINYINT	takes	1 byte.  Range:	-128		to 127
# SMALLINT 	takes 	2 bytes. Range: -32768 		to 32767
# MEDIUMINT 	takes	3 bytes. Range:	-8388608	to 8388607
# mysql -u root -p

CREATE DATABASE netflix CHARACTER SET = latin1;
use netflix;

DROP TABLE `netflix`.`ratings1`;

CREATE TABLE ratings1 (
  movie_id SMALLINT,
  customer_id MEDIUMINT,
  rating TINYINT,  
  KEY `movie_id` (`movie_id`),
  KEY `customer_id` (`customer_id`),
  KEY `rating` (`rating`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#SET SQL_LOG_BIN=0;
#ALTER TABLE mytable DISABLE KEYS;
# LOAD DATA INFILE ;


LOAD DATA INFILE 'C:/Users/hang/git/S683x/kdd2007a.data' 
INTO TABLE ratings1
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
(movie_id,customer_id,rating);

#Query OK, 100000 rows affected, 65535 warnings (0.47 sec)
#Records: 100000  Deleted: 0  Skipped: 0  Warnings: 98855

LOAD DATA INFILE 'C:/Users/hang/git/S683x/kdd2007a.data' 
INTO TABLE ratings1
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
(movie_id,customer_id,rating);

#Query OK, 100000 rows affected, 65535 warnings (4.30 sec)
#Records: 100000  Deleted: 0  Skipped: 0  Warnings: 98855

LOAD DATA INFILE 'C:/Users/hang/git/S683x/kdd2007a.data' 
INTO TABLE ratings1
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
(movie_id,customer_id,rating);

#Query OK, 100000 rows affected, 65535 warnings (5.04 sec)
#Records: 100000  Deleted: 0  Skipped: 0  Warnings: 98855

#ALTER TABLE mytable ENABLE KEYS;
#LOAD INDEX INTO CACHE ratings1 IGNORE LEAVES;

