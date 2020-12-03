UPDATE ARTISTS SET NAME = 'Justyna Święs' WHERE ID=24;

select * from songs
order by duration_m, duration_s;

select * from songs
order by duration_m*60 + duration_s;

select count(id) from songs;

select * from artists, roles
where roles.ID = artists.ID_ROLES; --not correct

select * from artists
join ROLES on artists.ID_ROLES = roles.ID; -- inner; left outer; right outer

select ar.NAME as Artist, r.NAME as Main_role from artists ar 
inner join ROLES r on ar.ID_ROLES = r.ID
order by ar.NAME;

select ar.NAME as Artist, r.NAME as Main_role from artists ar 
left outer join ROLES r on ar.ID_ROLES = r.ID
order by ar.NAME;

select distinct ar.NAME as artysci from AUTHORS a
join ARTISTS ar on a.ID_ARTIST = ar.ID
order by 1 -- display a

select distinct r.NAME from ROLES r
join AUTHORS a on r.ID = a.ID_ROLES
order by 1

select distinct s.NO_TRACK, s.NAME as SONGS_TITLE, ar.NAME as ARTIST from SONGS s
left outer join AUTHORS au on s.ID = au.ID_SONG
inner join ARTISTS ar on ar.ID = au.ID_ARTIST
order by s.ID_CDS, s.NO_TRACK, ar.NAME

select CDS.NAME, count (s.ID) from SONGS s
right outer join CDS on s.ID_CDS = CDS.ID
group by CDS.ID, CDS.NAME
order by 1


select r.NAME as Main_role, count(r.ID) from artists ar 
right outer join NO_OF_ r on ar.ID_ROLES = r.ID
group by r.NAME
order by 1;


select CDS.NAME, sum (s.DURATION_M*60 + s.DURATION_S) as DURATION from SONGS s
right outer join CDS on s.ID_CDS = CDS.ID
group by CDS.ID, CDS.NAME
order by 2 

select CDS.NAME, sum (s.DURATION_M*60 + s.DURATION_S)/60 as DURATION_M, sum (s.DURATION_M*60 + s.DURATION_S) - sum (s.DURATION_M*60 + s.DURATION_S)/60*60 as DURATION_S, sum (s.DURATION_M*60 + s.DURATION_S) as DURATION from SONGS s
right outer join CDS on s.ID_CDS = CDS.ID
group by CDS.ID, CDS.NAME
order by 2


create view V_CDS(ID, NO_OF_TRACKS, DURATION_M, DURATION_S, DURATION)
select CDS.ID, count (s.ID), sum (s.DURATION_M*60 + s.DURATION_S)/60, sum (s.DURATION_M*60 + s.DURATION_S) - sum (s.DURATION_M*60 + s.DURATION_S)/60*60 , sum (s.DURATION_M*60 + s.DURATION_S)   from SONGS s
right outer join CDS on s.ID_CDS = CDS.ID
group by CDS.ID



select v.NO_OF_TRACKS, v.DURATION_M, v.DURATION_S from V_CDS v
inner join CDS on CDS.ID = v.ID --one to one rel. connects the view to the table
where CDS.NAME = 'Mutter'















