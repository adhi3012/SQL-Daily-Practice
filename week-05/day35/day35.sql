with grp_number as (
select *, row_number() over (order by visit_date) as rn, 
id - row_number() over (order by visit_date) as grp
from stadium where no_of_people >= 100
)
SELECT

  id,

  visit_date,

  no_of_people

FROM grp_number

WHERE grp IN (

    SELECT grp

    FROM grp_number

    GROUP BY grp

    HAVING COUNT(1) >= 3

);



