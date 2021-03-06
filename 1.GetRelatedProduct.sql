IF OBJECT_ID('GRAPH.Products') IS NOT NULL
DROP TABLE GRAPH.Products

IF OBJECT_ID('GRAPH.ProductRating') IS NOT NULL
DROP TABLE GRAPH.ProductRating

CREATE TABLE GRAPH.Products(ID INT,ProductName VARCHAR(100)) AS NODE
CREATE TABLE GRAPH.ProductRating (Rating Int) AS EDGE

INSERT INTO GRAPH.Products VALUES (1,'USB CABLE'),(2,'Mini USB CABLE'),(3,'HDMI CABLE')

INSERT INTO GRAPH.ProductRating VALUES (
(SELECT $node_id FROM GRAPH.Products where ID=1),
(SELECT $node_id FROM GRAPH.Products where ID=2),
5
)

INSERT INTO GRAPH.ProductRating VALUES (
(SELECT $node_id FROM GRAPH.Products where ID=1),
(SELECT $node_id FROM GRAPH.Products where ID=3),
5
)

SELECT * FROM GRAPH.Products
SELECT * FROM GRAPH.ProductRating

--how many product connected to usb cable
SELECT P1.ProductName,P2.ProDUCTName,PR.Rating FROM GRAPH.Products P1, GRAPH.ProductRating PR,GRAPH.Products P2
WHERE MATCH(P1-(PR)->P2) AND P1.ProductName='USB CABLE'

SELECT P2.ProductName,P1.ProDUCTName,PR.Rating FROM GRAPH.Products P1, GRAPH.ProductRating PR,GRAPH.Products P2
WHERE MATCH(P1<-(PR)-P2) AND P2.ProductName='USB CABLE'