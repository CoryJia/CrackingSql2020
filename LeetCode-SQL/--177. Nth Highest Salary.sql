--177. Nth Highest Salary

CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    RETURN (
        /* Write your T-SQL query statement below. */
        select top 1 e.salary
        from(
            select id,
                   salary,
                   dense_rank() over (order by salary desc) as rank
                ) e
        where e.rank = @N
    );
END