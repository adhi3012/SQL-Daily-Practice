
select

    *,

    case

        when marks > prev_marks then 'inc'

        when marks < prev_marks then 'dec'

        else null

    end as statys

from (

    select

        *,

        lag(marks,1) over(partition by studentid order by testdate, subject) as prev_marks

    from students

) A;