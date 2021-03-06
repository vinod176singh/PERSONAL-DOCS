-- Create NODE tables
DROP TABLE IF EXISTS GRAPH.Person
DROP TABLE IF EXISTS GRAPH.likes;
DROP TABLE IF EXISTS GRAPH.Restaurant;
DROP TABLE IF EXISTS GRAPH.City;
DROP TABLE IF EXISTS GRAPH.friendOf;
DROP TABLE IF EXISTS GRAPH.livesIn;
DROP TABLE IF EXISTS GRAPH.locatedIn;

CREATE TABLE GRAPH.Person (
  ID INTEGER PRIMARY KEY, 
  name VARCHAR(100)
) AS NODE;

CREATE TABLE GRAPH.Restaurant (
  ID INTEGER NOT NULL, 
  name VARCHAR(100), 
  city VARCHAR(100)
) AS NODE;

CREATE TABLE GRAPH.City (
  ID INTEGER PRIMARY KEY, 
  name VARCHAR(100), 
  stateName VARCHAR(100)
) AS NODE;

-- Create EDGE tables. 
CREATE TABLE GRAPH.likes (rating INTEGER) AS EDGE;
CREATE TABLE GRAPH.friendOf AS EDGE;
CREATE TABLE GRAPH.livesIn AS EDGE;
CREATE TABLE GRAPH.locatedIn AS EDGE;

-- Insert data into node tables. Inserting into a node table is same as inserting into a regular table
INSERT INTO GRAPH.Person VALUES (1,'John');
INSERT INTO GRAPH.Person VALUES (2,'Mary');
INSERT INTO GRAPH.Person VALUES (3,'Alice');
INSERT INTO GRAPH.Person VALUES (4,'Jacob');
INSERT INTO GRAPH.Person VALUES (5,'Julie');

INSERT INTO GRAPH.Restaurant VALUES (1,'Taco Dell','Bellevue');
INSERT INTO GRAPH.Restaurant VALUES (2,'Ginger and Spice','Seattle');
INSERT INTO GRAPH.Restaurant VALUES (3,'Noodle Land', 'Redmond');

INSERT INTO GRAPH.City VALUES (1,'Bellevue','wa');
INSERT INTO GRAPH.City VALUES (2,'Seattle','wa');
INSERT INTO GRAPH.City VALUES (3,'Redmond','wa');

-- Insert into edge table. While inserting into an edge table, 
-- you need to provide the $node_id from $from_id and $to_id columns.
INSERT INTO GRAPH.likes VALUES ((SELECT $node_id FROM GRAPH.Person WHERE id = 1), 
       (SELECT $node_id FROM GRAPH.Restaurant WHERE id = 1),9);
INSERT INTO GRAPH.likes VALUES ((SELECT $node_id FROM GRAPH.Person WHERE id = 2), 
      (SELECT $node_id FROM GRAPH.Restaurant WHERE id = 2),9);
INSERT INTO GRAPH.likes VALUES ((SELECT $node_id FROM GRAPH.Person WHERE id = 3), 
      (SELECT $node_id FROM GRAPH.Restaurant WHERE id = 3),9);
INSERT INTO GRAPH.likes VALUES ((SELECT $node_id FROM GRAPH.Person WHERE id = 4), 
      (SELECT $node_id FROM GRAPH.Restaurant WHERE id = 3),9);
INSERT INTO GRAPH.likes VALUES ((SELECT $node_id FROM GRAPH.Person WHERE id = 5), 
      (SELECT $node_id FROM GRAPH.Restaurant WHERE id = 3),9);

INSERT INTO GRAPH.livesIn VALUES ((SELECT $node_id FROM GRAPH.Person WHERE id = 1),
      (SELECT $node_id FROM GRAPH.City WHERE id = 1));
INSERT INTO GRAPH.livesIn VALUES ((SELECT $node_id FROM GRAPH.Person WHERE id = 2),
      (SELECT $node_id FROM GRAPH.City WHERE id = 2));
INSERT INTO GRAPH.livesIn VALUES ((SELECT $node_id FROM GRAPH.Person WHERE id = 3),
      (SELECT $node_id FROM GRAPH.City WHERE id = 3));
INSERT INTO GRAPH.livesIn VALUES ((SELECT $node_id FROM GRAPH.Person WHERE id = 4),
      (SELECT $node_id FROM GRAPH.City WHERE id = 3));
INSERT INTO GRAPH.livesIn VALUES ((SELECT $node_id FROM GRAPH.Person WHERE id = 5),
      (SELECT $node_id FROM GRAPH.City WHERE id = 1));

INSERT INTO GRAPH.locatedIn VALUES ((SELECT $node_id FROM GRAPH.Restaurant WHERE id = 1),
      (SELECT $node_id FROM GRAPH.City WHERE id =1));
INSERT INTO GRAPH.locatedIn VALUES ((SELECT $node_id FROM GRAPH.Restaurant WHERE id = 2),
      (SELECT $node_id FROM GRAPH.City WHERE id =2));
INSERT INTO GRAPH.locatedIn VALUES ((SELECT $node_id FROM GRAPH.Restaurant WHERE id = 3),
      (SELECT $node_id FROM GRAPH.City WHERE id =3));

-- Insert data into the GRAPH.friendof edge.
INSERT INTO GRAPH.friendof VALUES ((SELECT $NODE_ID FROM GRAPH.Person WHERE ID = 1), (SELECT $NODE_ID FROM GRAPH.Person WHERE ID = 2));
INSERT INTO GRAPH.friendof VALUES ((SELECT $NODE_ID FROM GRAPH.Person WHERE ID = 2), (SELECT $NODE_ID FROM GRAPH.Person WHERE ID = 3));
INSERT INTO GRAPH.friendof VALUES ((SELECT $NODE_ID FROM GRAPH.Person WHERE ID = 3), (SELECT $NODE_ID FROM GRAPH.Person WHERE ID = 1));
INSERT INTO GRAPH.friendof VALUES ((SELECT $NODE_ID FROM GRAPH.Person WHERE ID = 4), (SELECT $NODE_ID FROM GRAPH.Person WHERE ID = 2));
INSERT INTO GRAPH.friendof VALUES ((SELECT $NODE_ID FROM GRAPH.Person WHERE ID = 5), (SELECT $NODE_ID FROM GRAPH.Person WHERE ID = 4));

-- Find Restaurants that John likes
SELECT Restaurant.name
FROM GRAPH.Person Person, GRAPH.likes likes, GRAPH.Restaurant Restaurant
WHERE MATCH (Person-(likes)->Restaurant)
AND Person.name = 'John';

-- Find Restaurants that John's friends like
SELECT Restaurant.name 
FROM GRAPH.Person Person1, GRAPH.Person Person2, GRAPH.likes likes, GRAPH.friendof friendof, GRAPH.Restaurant Restaurant
WHERE MATCH(Person1-(friendof)->Person2-(likes)->Restaurant)
AND Person1.name='John';

-- Find people who like a Restaurant in the same City they live in
SELECT Person.name
FROM GRAPH.Person Person, GRAPH.likes likes, GRAPH.Restaurant Restaurant, GRAPH.livesIn livesIn, GRAPH.City City, GRAPH.locatedIn locatedIn
WHERE MATCH (Person-(likes)->Restaurant-(locatedIn)->City AND Person-(livesIn)->City);

