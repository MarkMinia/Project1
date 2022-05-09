select b.bandname as 'Rockin Rock Bands', a.albumname as 'Awesome Album Names', a.releasedate as 'Released to the World'
from band_db.band as b
join band_db.album as a
on b.idband = a.idband
order by a.releasedate desc
