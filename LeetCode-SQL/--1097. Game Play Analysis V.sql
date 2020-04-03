--1097. Game Play Analysis V

with i as ( -- install players
    select  t.player_id, t.event_date install_dt
    from    Activity t
    where   not exists (select  1
                        from    Activity tmin
                        where    tmin.player_id = t.player_id
                                and tmin.event_date < t.event_date)
), ic as ( -- count of install players
    select  i.install_dt, count(i.player_id) install_player_count
    from    i
    group
    by      i.install_dt
), r as ( -- retention players
    select  r.player_id, r.install_dt
    from    i r
    where   exists (select  1
                    from    Activity t2
                    where    t2.player_id = r.player_id
                                and datediff(day, r.install_dt, t2.event_date) = 1
                       )
), rc as ( -- count of retention players
    select  r.install_dt, count(r.player_id) retention_player_count
    from    r
    group
    by      r.install_dt
)
select  ic.install_dt, ic.install_player_count installs,
        round(cast(coalesce(rc.retention_player_count, 0) as decimal(9,2)) /
              cast(ic.install_player_count as decimal(9,2)), 2) Day1_retention
from    ic
left
join    rc on rc.install_dt = ic.install_dt;