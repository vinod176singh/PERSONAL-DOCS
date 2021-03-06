DROP TABLE IF EXISTS GRAPH.Person
DROP TABLE IF EXISTS GRAPH.friend
-- Create person node table
CREATE TABLE GRAPH.Person (ID INTEGER PRIMARY KEY, NAME varchar(50)) AS NODE;
CREATE TABLE GRAPH.friend (START_DATE DATE) AS EDGE;

-- Insert into node table
INSERT INTO GRAPH.Person VALUES (1, 'Alice');
INSERT INTO GRAPH.Person VALUES (2,'John');
INSERT INTO GRAPH.Person VALUES (3, 'Jacob');

-- Insert into edge table
INSERT INTO GRAPH.friend VALUES ((SELECT $node_id FROM GRAPH.Person WHERE name = 'Alice'),
       (SELECT $node_id FROM GRAPH.Person WHERE name = 'John'), '9/15/2011');

INSERT INTO GRAPH.friend VALUES ((SELECT $node_id FROM GRAPH.Person WHERE name = 'Alice'),
       (SELECT $node_id FROM GRAPH.Person WHERE name = 'Jacob'), '10/15/2011');

INSERT INTO GRAPH.friend VALUES ((SELECT $node_id FROM GRAPH.Person WHERE name = 'John'),
       (SELECT $node_id FROM GRAPH.Person WHERE name = 'Jacob'), '10/15/2012');


SELECT * FROM GRAPH.Person
SELECT * FROM GRAPH.friend

-- use MATCH in SELECT to find friends of Alice
SELECT Person1.name,Person2.name AS FriendName
FROM GRAPH.Person Person1, GRAPH.friend, GRAPH.Person Person2
WHERE MATCH(Person1-(friend)->Person2)
AND Person1.name = 'Alice';

SELECT Person1.name,Person2.name,Person3.name AS FriendName 
FROM GRAPH.Person Person1, GRAPH.friend friend1, GRAPH.Person Person2, GRAPH.friend friend2, GRAPH.Person Person3
WHERE MATCH(Person1-(friend1)->Person2-(friend2)->Person3)
AND Person1.name = 'Alice';

-- Find a friend
   SELECT Person1.name,Person2.name AS FriendName
   FROM GRAPH.Person Person1, GRAPH.friend, GRAPH.Person Person2
   WHERE MATCH(Person1-(friend)->Person2);

-- The pattern can also be expressed as below

   SELECT Person1.name,Person2.name AS FriendName
   FROM GRAPH.Person Person1, GRAPH.friend, GRAPH.Person Person2 
   WHERE MATCH(Person2<-(friend)-Person1);


-- Find 2 people who are both friends with same person
   SELECT Person1.name AS Friend1, Person0.name AS Friend2 ,Person2.name as common
   FROM GRAPH.Person Person1, GRAPH.friend friend1, GRAPH.Person Person2, 
        GRAPH.friend friend2, GRAPH.Person Person0
   WHERE MATCH(Person1-(friend1)->Person2<-(friend2)-Person0);

-- this pattern can also be expressed as below

   SELECT Person1.name AS Friend1, Person2.name AS Friend2,Person0.name as common
   FROM GRAPH.Person Person1, GRAPH.friend friend1, GRAPH.Person Person2, 
        GRAPH.friend friend2, GRAPH.Person Person0
   WHERE MATCH(Person1-(friend1)->Person0 AND Person2-(friend2)->Person0);
