-- 1.1
select E.name, D.name
FROM employee E, department D
WHERE E.department = D.code;
-- 1.2
SELECT E1.name, E2.name, E1.department, E2.department
From employee E1, employee E2
where E1.department = E2.department and E1.number>E2.number;
-- 1.3
select H.start_date, E.position, E.name, P.income +50 as new_income
from employee E, position P, history H
WHERE E.position = P.code
# AND P.code = H.position
AND E.number = H.employee
AND H.start_date < '2012-1-1';
-- 1.4
SELECT E.name, P1.title, P1.income
FROM employee E, position P1, position P2
WHERE E.position = P1.code
AND P1.income >= P2.income * 2;
#worked but not enough info

SELECT E1.name, E2.name, P1.title, P2.title, P1.income, P2.income
FROM employee E1, employee E2, position P1, position P2
WHERE  P1.income >= P2.income *2
AND E1.position = P1.code
and E2.position = P2.code;

-- 1.5
SELECT E.number, E.name, P.income
FROM employee E, position P
WHERE E.name like 'L__%';


-- 1.6
SELECT E.number, E.name, E.position
FROM employee E
Where E.department = 'DP1'
#OR E.department = 'DP2'
UNION
SELECT E.number, E.name, E.position
FROM employee E
Where E.department = 'DP2';

-- 1.7
SELECT distinct E1.name, D.name
FROM department D, employee E1, employee E2
WHERE E1.department = D.code
AND (E1.number = E2.supervisor
OR E1.number = D.director);
#teach's 1.7
# SELECT distinct E1.name, D.name
# FROM department D, employee E1, employee E2
# WHERE E1.number = E2.supervisor
# AND E1.number = D.director;
-- 1.8 (null)

-- 1.9
SELECT DISTINCT E.position, D.name
FROM department D, employee E
WHERE E.department = D.code;

-- 2.10
# SELECT distinct E1.name, D.name
# FROM department D, employee E1, employee E2
# WHERE E1.number = E2.supervisor
# AND E1.number = D.director;
SELECT Dir.name, D.name
FROM  employee Dir, department D
WHERE Dir.number = D.director
AND EXISTS (SELECT *
            from employee E
            WHERE E.supervisor = Dir.number);

-- 2.11
SELECT E1.number
FROM employee E1, department D
WHERE E1.number = D.director
UNION
SELECT E2.number
From employee E2, employee E3
WHERE E2.number = E3.supervisor;


SELECT E.number, E.name
FROM employee E
where E.number In (Select E1.supervisor
                    FROM employee E1
                    where E1.supervisor is not null
    )
Or E.number In (select D.director
                from department D
    );

-- 2.12
SELECT E.position, E.name
FROM department D, employee E, employee Dir
WHERE E.department = D.code
AND D.location = 'Hanoi'
AND Dir.number = D.director
AND Dir.name like 'P%';

-- 2.13
SELECT Supv.name, P.income, D.name
FROM employee E, employee Supv, position P, department D
WHERE P.code = Supv.position
AND D.code = Supv.department
AND E.supervisor = Supv.number
AND E.department NOT IN (SELECT D2.code
                         from department D2
                         WHERE D2.location = 'Hanoi');

-- 2.14
SELECT E.name, P.income
FROM employee E, position P
WHERE E.position = P.code
AND P.income IN (SELECT max(P2.income)
                FROM position P2
                );

SELECT E.name, P.income
FROM employee E, position P
WHERE E.position = P.code
AND P.income >= ALL (SELECT P2.income
                FROM position P2
                );

-- 2.15
SELECT SUP.name, SUP.number
FROM employee SUP, employee E
WHERE SUP.number = E.supervisor;

SELECT SUP.name, SUP.number
FROM employee SUP
WHERE SUP.number in (SELECT E.supervisor
                     FROM employee E);

SELECT SUP.name, SUP.number
FROM employee SUP
WHERE SUP.number = ANY (SELECT E.supervisor
                     FROM employee E);

-- 2.16
SELECT E.name, P.income
FROM employee E, position P
where E.position = P.code
AND P.income > ALL (SELECT P2.income
                    FROM position P2, employee E2
                    WHERE E2.department = 'DP1'
                    AND E2.position = P2.code);

-- 2.17
SELECT E.name, E.number
FROM employee E, employee SUP
WHERE E.number NOT IN(SELECT E2.supervisor
                      FROM employee E2
                      WHERE E2.supervisor IS NOT Null);

-- 2.18
SELECT E.name
FROM employee E
WHERE E.number = ALL(SELECT E2.supervisor
                     FROM employee E2, department D
                     WHERE E2.department = D.code
                     AND D.location = 'HCMC');