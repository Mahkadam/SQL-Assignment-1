-- 1) Which manufacturer's planes had most no of flights? And how many flights?
select 
	p.manufacturer,
	f.tailnum,
	max(flight) as Most_flights
from
	flights f
inner join planes p on
	p.tailnum = f.tailnum
group by
	f.tailnum ,
	p.manufacturer
order by
	Most_flights desc
limit 1


-- 2) Which manufacturer's planes had most no of flying hours? And how many hours? 
--assuming air_time is in minutes
select 
	p.manufacturer,
	sum(cast(f.air_time as int)) as Total_flying_minutes ,
	concat(cast(sum(cast(f.air_time as int)) / 60 as VARCHAR (10)),
	':',
	cast(sum(cast(f.air_time as int)) % 60 as VARCHAR (10))) as Total_flying_hours
from
	flights f
inner join planes p on
	p.tailnum = f.tailnum
where
	air_time != 'NA'
group by
	p.manufacturer
order by
	Total_flying_minutes desc
limit 1

-- 3) Which plane flew the most number of hours? And how many hours? 
select 
	tailnum,
	max(cast(air_time as int)) as Flew_Time_minutes,
	concat(cast(max(cast(air_time as int)) / 60 as VARCHAR (10)),
	':',
	cast(max(cast(air_time as int)) % 60 as VARCHAR (10))) as Flew_Time_hours
from
	flights f
where
	air_time != 'NA'
group by
	tailnum
order by
	Flew_Time_minutes desc
limit 1


-- 4)Which destination had most delay in flights? 
select
	sum(cast(arr_delay as int)) as delay,
	dest
from
	flights f
where
	arr_delay != 'NA'
group by
	dest
order by
	delay desc
limit 1



-- 5) Which manufactures planes had covered most distance? And how much distance?
select 
	p.manufacturer,
	sum(cast(f.distance as int)) as Total_distance
from
	flights f
inner join planes p on
	p.tailnum = f.tailnum
group by
	p.manufacturer
order by
	Total_distance desc
limit 1



-- 6) Which airport had most flights on weekends?
select
	count(*) as Most_weekend_flights,
	origin
from
	flights f
where
	day in (0, 6)
group by
	f.origin
order by
	Most_weekend_flights desc
limit 1




