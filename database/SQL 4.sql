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
-- 1.8 (null)

-- 1.9
SELECT DISTINCT E.position, D.name
FROM department D, employee E
WHERE E.department = D.code