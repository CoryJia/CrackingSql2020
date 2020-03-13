--603. Consecutive Available Seats

select seat_id
from (
         select seat_id,
                free,
                lead(free) over (order by seat_id) as nextseat,
                lag(free) over (order by seat_id)  as preseat
         from cinema
     ) t
where free = 1
  and (preseat = 1 or nextseat = 1)