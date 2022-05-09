# SQL & Database Basics: Final Project

##### Before a band releases a new record, Drop Table Records will work to promote the band and get fans excited for the new record. Write a query that shows bands & their respective albums’ release date in descending order.
```
select b.bandname as 'Rockin Rock Bands', a.albumname as 'Awesome Album Names', a.releasedate as 'Released to the World'
from band_db.band as b
join band_db.album as a
on b.idband = a.idband
order by a.releasedate desc
```
