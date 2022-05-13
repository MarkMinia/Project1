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
select b.bandname as 'Rockin Rock Bands', a.albumname as 'Awesome Album Names', a.releasedate as 'Released to the World'
from band_db.band as b
join band_db.album as a
on b.idband = a.idband
order by a.releasedate desc
```
##### 1.2) Drop Table Records also sends bands to play at different venues or events. Some venues request bands that feature certain instruments. Write a query that shows all of the players that utilize drums along with the bands that they are a part of. You should only have one column that shows the full player name
[1.2 Result Grid](https://github.com/MarkMinia/Project1/blob/main/SQL%20Tables/1.2%20Table.csv)
```sql
select b.bandname as 'Rockin Rock Band', concat(p.pfname, ' ' ,p.plname) as 'Band Player', i.instrument as 'Musical Weapon'
from band_db.instrument as i
join band_db.player as p
on i.instid = p.instid
join band_db.band as b
on p.idband = b.idband
where instrument = 'drums'
order by concat(p.pfname, ' ' ,p.plname)
```
##### 1.3) It is important that Drop Table Records has a diversity of different bands signed to its label. We want many artists who represent different styles of music. One way we determine the diversity in music is by looking at how many bands feature a certain instrument. Write a query that describes the number of instruments used by each band.
[1.3 Result Grid](https://github.com/MarkMinia/Project1/blob/main/SQL%20Tables/1.3%20Table.csv)
```sql
select b.bandname as 'Rockin Rock Band', count(i.instrument) as 'Musical Weapons'
from band_db.instrument as i
join band_db.player as p
on i.instid = p.instid
join band_db.band as b
on b.idband = p.idband
group by b.idband
order by count(i.instrument) desc
```
##### 1.4) Write a query that lists the most popular instrument amongst the players.
[1.4 Result Grid](https://github.com/MarkMinia/Project1/blob/main/SQL%20Tables/1.4%20Table.csv)
```sql
select (i.instrument) as 'Musical Weapon', count(p.instid) as 'Number of Players'
from band_db.instrument as i
join band_db.player as p
on i.instid = p.instid
group by i.instrument
order by count(p.instid) desc
```
##### 1.5) Write a query that lists any albums that have a missing name and/or missing release dates. How should we handle these?
[1.5 Result Grid](https://github.com/MarkMinia/Project1/blob/main/SQL%20Tables/1.5%20Table.csv)
```sql
select ifnull(idalbum, 'N/A') as idalbum, ifnull(idband, 'N/A') as idband, ifnull(albumname, 'N/A') as albumname, ifnull(releasedate, 'N/A') as releasedate
from band_db.album where albumname is null or releasedate is null 
```
#### PART 2

##### 2.1) We need to add more bands to the band table. Here’s a list of the bands we’d like to add: 
<img src="./Assignment%20Images/Band%20List.PNG" width="25%" height="25%" />

[2.1 Result Grid](https://github.com/MarkMinia/Project1/blob/main/SQL%20Tables/2.1%20Table.csv)
```sql
insert into band_db.band (idband, aid, bandname)
values (22, 1, 'Weezer'), (23, 1, 'TLC'), (24, 1, 'Paramore'), (25, 1, 'Blackpink'), (26, 1, 'Vampire Weekend')
```
##### 2.3) Using the Player table, add the following values
<img src="./Assignment%20Images/Player%20List.PNG" width="80%" height="80%" />

[2.3 Result Grid](https://github.com/MarkMinia/Project1/blob/main/SQL%20Tables/2.3%20Table.csv)
```sql
Insert into band_db.player (idplayer, instid, idband, pfname, plname, homecity, homestate)
values (30, 3, 22, 'Rivers', 'Cuomo', 'Rochester', 'NY'),
(31, 1, 22, 'Brian', 'Bell', 'Iowa City', 'Iowa'),
(32, 4, 22, 'Patrick', 'Wilson', 'Buffalo', 'NY'),
(33, 2, 22, 'Scott', 'Shriner', 'Toledo', 'OH'),
(34, 3, 23, 'Tionne', 'Watkins', 'Des Moines', 'IA'),
(35, 3, 23, 'Rozonda', 'Thomas', 'Columbus', 'GE'),
(36, 3, 24, 'Hayley', 'Williams', 'Franklin', 'TN'),
(37, 1, 24, 'Taylor', 'York', 'Nashville', 'TN'),
(38, 4, 24, 'Zac', 'Farro', 'Voorhees Township', 'NJ'),
(39, 3, 25, 'Jisoo', 'Kim', null, 'South Korea'),
(40, 3, 25, 'Jennie', 'Kim', null, 'South Korea'),
(41, 3, 25, 'Roseanne', 'Park', null, 'New Zealand'),
(42, 3, 25, 'Lisa', 'Manoban', null, 'Thailand'),
(43, 3, 26, 'Ezra', 'Koenig', 'New York', 'NY'),
(44, 2, 26, 'Chris', 'Balo', 'Bronxville', 'NY'),
(45, 4, 26, 'Chris', 'Thompson', 'Upper Freehold Township', 'NJ')
```
##### 2.4) Drop Table Records has signed a contract with a new venue! A new venue should be added to the venue table.
<img src="./Assignment%20Images/Venue%20List.PNG" width="45%" height="45%" />

[2.4 Result Grid](https://github.com/MarkMinia/Project1/blob/main/SQL%20Tables/2.4%20Table.csv)
```sql
insert into band_db.venue (idvenue, vname, city, state, zipcode, seats)
values(12, 'Twin City Rock House', 'Minneapolis', 'MN', 55414, 2000)
```
##### 2.5) Which state has the largest amount of seating available (regardless of the number of venues at the state)?
[2.5 Result Grid](https://github.com/MarkMinia/Project1/blob/main/SQL%20Tables/2.5%20Table.csv)
```sql
select state, seats from band_db.venue where seats = (select max(seats) from band_db.venue)
```
#### PART 3

##### 3.2) Using the Gig table, add the following information
<img src="./Assignment%20Images/Gig%20List.PNG" width="80%" height="80%" />

[3.2 Result Grid](https://github.com/MarkMinia/Project1/blob/main/SQL%20Tables/3.2%20Table.csv)
```sql
insert into band_db.gig (gigid, idvenue, idband, gigdate, numattendees)
values (1, 4, 2, '2022-05-05', 19000),
(2, 12, 26, '2022-04-15', null),
(3, 8, 23, '2022-06-07', 18000),
(4, 2, 22, '2022-07-03', 175)
select * from band_db.gig
```
##### 3.3) Are any of the venues oversold?
[3.3 Result Grid](https://github.com/MarkMinia/Project1/blob/main/SQL%20Tables/3.3%20Table.csv)
```sql
Select v.vname, v.city, v.state, v.seats, g.numattendees
from band_db.venue as v
join band_db.gig as g
on v.idvenue = g.idvenue
where seats < numattendees
```
##### 3.4) We just got word that Vampire Weekend can expect 1,750 guests. Write a query to update the table accordingly.
[3.4 Result Grid](https://github.com/MarkMinia/Project1/blob/main/SQL%20Tables/3.4%20Table.csv)
```sql
update band_db.gig set numattendees = 1750 where gigid = 2
```
##### 3.5) We just got an update that the expected number of attendees at the River Club for Weezer will only have 125 guests. Write a query to update the table accordingly.
[3.5 Result Grid](https://github.com/MarkMinia/Project1/blob/main/SQL%20Tables/3.5%20Table.csv)
```sql
update band_db.gig set numattendees = 125 where gigid = 4
```
##### 3.6) Create a view (called vw_giginfo) that will show the band, the dates they will play, the venue they will play at, the number of attendees, and the venue capacity. For this view, also create a column that describes what percentage of the venue capacity was utilized.
[3.6 Result Grid](https://github.com/MarkMinia/Project1/blob/main/SQL%20Tables/3.6%20Table.csv)
```sql
create view band_db.rock_n_roll as
select b.bandname as 'Rockin Rock Band', g.gigdate as 'Showtime Baby', g.numattendees as 'Adoring Fans', 
v.seats as 'Max Capacity', (g.numattendees/v.seats)*100 as 'Venue Capacity Usage Percentage'
from band_db.band as b
join band_db.gig as g
on b.idband = g.idband
join band_db.venue as v
on g.idvenue = v.idvenue
select * from band_db.rock_n_roll
```
#### PART 4

##### 4.1) Create a stored procedure that lists all of the venues that can handle more than 10,000 guests.
[4.1 Result Grid](https://github.com/MarkMinia/Project1/blob/main/SQL%20Tables/4.1%20Table.csv)
```sql
CREATE PROCEDURE `10000_Venue`()
BEGIN
Select * from band_db.venue where seats > 10000;
END;

call band_db.10000_venue ()
```
##### 4.2) Create a stored procedure that lists all of the players that come from a specific state. We want to see (once we run this stored procedure), what bands they are a part of, their full name (in one column), and the state they are from.
[4.2 Result Grid](https://github.com/MarkMinia/Project1/blob/main/SQL%20Tables/4.2%20Table.csv)
```sql
Select b.bandname as 'Rockin Rock Band', concat(p.pfname, ' ',(ifnull(p.plname, ' '))) as 'Player Name', p.homecity, p.homestate 
from band_db.band as b
join band_db.player as p
on p.idband = b.idband
where N in (p.pfname, p.plname);
END;

call band_db.band_player_search ('eminem')
```
