# SQL & Database Basics: Final Project

#### [Assignment Module](https://github.com/MarkMinia/Project1/blob/main/SQL%20%26%20Database%20Basics%20-%20Final%20Project%20Tasks.pdf)
#### [Original Schema](https://github.com/MarkMinia/Project1/blob/main/Dataset/band_schema.sql)
- [Album](https://github.com/MarkMinia/Project1/blob/main/Dataset/Album.csv)
- [Band](https://github.com/MarkMinia/Project1/blob/main/Dataset/Band.csv)
- [Gig](https://github.com/MarkMinia/Project1/blob/main/Dataset/Gig.csv)
- [Instrument](https://github.com/MarkMinia/Project1/blob/main/Dataset/Instrument.csv)
- [Player](https://github.com/MarkMinia/Project1/blob/main/Dataset/Player.csv)
- [Venue](https://github.com/MarkMinia/Project1/blob/main/Dataset/Venue.csv)

#### PART 1

##### 1.1) Before a band releases a new record, Drop Table Records will work to promote the band and get fans excited for the new record. Write a query that shows bands & their respective albums’ release date in descending order.
[1.1 Result Grid](https://github.com/MarkMinia/Project1/blob/main/SQL%20Tables/1.1%20Table.csv)
```sql
SELECT b.bandname AS 'Rockin Rock Bands', a.albumname AS 'Awesome Album Names', a.releasedate AS 'Released to the World'
FROM band_db.band AS b
LEFT JOIN band_db.album AS a
ON b.idband = a.idband
ORDER BY a.releasedate desc
```
##### 1.2) Drop Table Records also sends bands to play at different venues or events. Some venues request bands that feature certain instruments. Write a query that shows all of the players that utilize drums along with the bands that they are a part of. You should only have one column that shows the full player name
[1.2 Result Grid](https://github.com/MarkMinia/Project1/blob/main/SQL%20Tables/1.2%20Table.csv)
```sql
SELECT b.bandname AS 'Rockin Rock Band', concat(p.pfname, ' ' ,p.plname) AS 'Band Player', i.instrument AS 'Musical Weapon'
from band_db.instrument AS i
JOIN band_db.player AS p
ON i.instid = p.instid
LEFT JOIN band_db.band AS b
ON p.idband = b.idband
WHERE instrument = 'drums'
ORDER BY concat(p.pfname, ' ' ,p.plname)
```
##### 1.3) It is important that Drop Table Records has a diversity of different bands signed to its label. We want many artists who represent different styles of music. One way we determine the diversity in music is by looking at how many bands feature a certain instrument. Write a query that describes the number of instruments used by each band.
[1.3 Result Grid](https://github.com/MarkMinia/Project1/blob/main/SQL%20Tables/1.3%20Table.csv)
```sql
SELECT b.bandname AS 'Rockin Rock Band', count(p.instid) AS 'Musical Weapons'
from band_db.instrument AS i
JOIN band_db.player AS p
ON i.instid = p.instid
JOIN band_db.band AS b
ON b.idband = p.idband
GROUP BY b.bandname
ORDER BY count(i.instid) DESC
```
##### 1.4) Write a query that lists the most popular instrument amongst the players.
[1.4 Result Grid](https://github.com/MarkMinia/Project1/blob/main/SQL%20Tables/1.4%20Table.csv)
```sql
SELECT (i.instrument) AS 'Musical Weapon', count(p.instid) AS 'Number of Players'
FROM band_db.instrument AS i
LEFT JOIN band_db.player AS p
ON i.instid = p.instid
GROUP BY i.instrument
ORDER BY count(p.instid) desc
```
##### 1.5) Write a query that lists any albums that have a missing name and/or missing release dates. 
[1.5 Result Grid](https://github.com/MarkMinia/Project1/blob/main/SQL%20Tables/1.5%20Table.csv)
```sql
SELECT ifnull(idalbum, 'N/A') AS idalbum, ifnull(idband, 'N/A') AS idband, ifnull(albumname, 'N/A') AS albumname, IFNULL(releasedate, 'N/A') AS releasedate
FROM band_db.album 
WHERE albumname IS null OR releasedate IS NULL 
```
#### PART 2

##### 2.1) We need to add more bands to the band table. Here’s a list of the bands we’d like to add: 
<img src="./Assignment%20Images/Band%20List.PNG" width="25%" height="25%" />

[2.1 Result Grid](https://github.com/MarkMinia/Project1/blob/main/SQL%20Tables/2.1%20Table.csv)
```sql
INSERT INTO band_db.band (aid, bandname)
VALUES (1, 'Weezer'), (1, 'TLC'), (1, 'Paramore'), (1, 'Blackpink'), (1, 'Vampire Weekend')
```
##### 2.3) Using the Player table, add the following values
<img src="./Assignment%20Images/Player%20List.PNG" width="80%" height="80%" />

[2.3 Result Grid](https://github.com/MarkMinia/Project1/blob/main/SQL%20Tables/2.3%20Table.csv)
```sql
INSERT INTO band_db.player (instid, idband, pfname, plname, homecity, homestate)
VALUES (3, 22, 'Rivers', 'Cuomo', 'Rochester', 'NY'),
(1, 22, 'Brian', 'Bell', 'Iowa City', 'Iowa'),
(4, 22, 'Patrick', 'Wilson', 'Buffalo', 'NY'),
(2, 22, 'Scott', 'Shriner', 'Toledo', 'OH'),
(3, 23, 'Tionne', 'Watkins', 'Des Moines', 'IA'),
(3, 23, 'Rozonda', 'Thomas', 'Columbus', 'GE'),
(3, 24, 'Hayley', 'Williams', 'Franklin', 'TN'),
(1, 24, 'Taylor', 'York', 'Nashville', 'TN'),
(4, 24, 'Zac', 'Farro', 'Voorhees Township', 'NJ'),
(3, 25, 'Jisoo', 'Kim', null, 'South Korea'),
(3, 25, 'Jennie', 'Kim', null, 'South Korea'),
(3, 25, 'Roseanne', 'Park', null, 'New Zealand'),
(3, 25, 'Lisa', 'Manoban', null, 'Thailand'),
(3, 26, 'Ezra', 'Koenig', 'New York', 'NY'),
(2, 26, 'Chris', 'Balo', 'Bronxville', 'NY'),
(4, 26, 'Chris', 'Thompson', 'Upper Freehold Township', 'NJ')
```
##### 2.4) Drop Table Records has signed a contract with a new venue! A new venue should be added to the venue table.
<img src="./Assignment%20Images/Venue%20List.PNG" width="45%" height="45%" />

[2.4 Result Grid](https://github.com/MarkMinia/Project1/blob/main/SQL%20Tables/2.4%20Table.csv)
```sql
INSERT INTO band_db.venue (vname, city, state, zipcode, seats)
VALUES ('Twin City Rock House', 'Minneapolis', 'MN', 55414, 2000)
```
##### 2.5) Which state has the largest amount of seating available (regardless of the number of venues at the state)? GA & TX
[2.5 Result Grid](https://github.com/MarkMinia/Project1/blob/main/SQL%20Tables/2.5%20Table.csv)
```sql
SELECT state, seats 
FROM band_db.venue 
WHERE seats = (select max(seats) 
FROM band_db.venue)
```
#### PART 3

##### 3.2) Using the Gig table, add the following information
<img src="./Assignment%20Images/Gig%20List.PNG" width="80%" height="80%" />

[3.2 Result Grid](https://github.com/MarkMinia/Project1/blob/main/SQL%20Tables/3.2%20Table.csv)
```sql
INSERT INTO band_db.gig (idvenue, idband, gigdate, numattendees)
VALUES (4, 2, '2022-05-05', 19000),
(12, 26, '2022-04-15', null),
(8, 23, '2022-06-07', 18000),
(2, 22, '2022-07-03', 175)
```
##### 3.3) Are any of the venues oversold? Yes, SAP Center and The River Club
[3.3 Result Grid](https://github.com/MarkMinia/Project1/blob/main/SQL%20Tables/3.3%20Table.csv)
```sql
SELECT v.vname, v.city, v.state, v.seats, g.numattendees
FROM band_db.venue AS v
LEFT JOIN band_db.gig AS g
ON v.idvenue = g.idvenue
WHERE seats < numattendees
```
##### 3.4) We just got word that Vampire Weekend can expect 1,750 guests. Write a query to update the table accordingly.
[3.4 Result Grid](https://github.com/MarkMinia/Project1/blob/main/SQL%20Tables/3.4%20Table.csv)
```sql
UPDATE band_db.gig set numattendees = 1750 
WHERE gigid = 2
```
##### 3.5) We just got an update that the expected number of attendees at the River Club for Weezer will only have 125 guests. Write a query to update the table accordingly.
[3.5 Result Grid](https://github.com/MarkMinia/Project1/blob/main/SQL%20Tables/3.5%20Table.csv)
```sql
UPDATE band_db.gig set numattendees = 125 
WHERE gigid = 4
```
##### 3.6) Create a view that will show the band, the dates they will play, the venue they will play at, the number of attendees, and the venue capacity. For this view, also create a column that describes what percentage of the venue capacity was utilized.
[3.6 Result Grid](https://github.com/MarkMinia/Project1/blob/main/SQL%20Tables/3.6%20Table.csv)
```sql
CREATE VIEW band_db.rock_n_roll as
SELECT b.bandname AS 'Rockin Rock Band', g.gigdate AS 'Showtime Baby', g.numattendees AS 'Adoring Fans', 
v.seats AS 'Max Capacity', (g.numattendees/v.seats)*100 AS 'Venue Capacity Usage Percentage'
FROM band_db.band AS b
JOIN band_db.gig AS g
ON b.idband = g.idband
JOIN band_db.venue AS v
ON g.idvenue = v.idvenue

select * from band_db.rock_n_roll
```
#### PART 4

##### 4.1) Create a stored procedure that lists all of the venues that can handle more than 10,000 guests.
[4.1 Result Grid](https://github.com/MarkMinia/Project1/blob/main/SQL%20Tables/4.1%20Table.csv)
```sql
DELIMITER //
CREATE PROCEDURE 10000_Venue()
BEGIN
SELECT * from band_db.venue where seats > 10000;
END //
DELIMITER //

CALL 10000_venue()
```
##### 4.2) Create a stored procedure that lists all of the players that come from a specific state. We want to see (once we run this stored procedure), what bands they are a part of, their full name (in one column), and the state they are from.
[4.2 Result Grid](https://github.com/MarkMinia/Project1/blob/main/SQL%20Tables/4.2%20Table.csv)
```sql
DELIMITER //
CREATE PROCEDURE band_player_search(in N varchar(60))
BEGIN
SELECT b.bandname AS 'Rockin Rock Band', concat(p.pfname, ' ',(ifnull(p.plname, ' '))) AS 'Player Name', p.homecity, p.homestate 
FROM band_db.player AS p
LEFT JOIN band_db.band AS b 
ON p.idband = b.idband
WHERE N IN (p.pfname, p.plname);
END //
DELIMITER //

CALL band_player_search('eminem')
```
