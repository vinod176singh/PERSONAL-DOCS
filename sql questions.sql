What is output of below query?
SELECT  substring('abcabcabc',4,3)
A.abc
B.bca
C.cabc
D.abca

Answer  A

Which of the following group functions ignore NULL values?
A.MAX
B.COUNT
C.SUM
D.All of the above

Answer  D 

Table Employee has 10 records. It has a non-NULL SALARY column which is also UNIQUE.
The SQL statement
SELECT COUNT(*) FROM Employee WHERE SALARY > ANY (SELECT SALARY FROM EMPLOYEE);
prints
A.10
B.9
C.5
D.0

Answer  B

The SQL statement
SELECT ROUND(45.926, -1) 
A.is illegal
B.prints garbage
C.prints 045.926
D.prints 50
Answer  D

Which of the following command makes the updates performed by the transaction permanent in the database?
A.ROLLBACK
B.COMMIT
C.TRUNCATE
D.DELETE
Answer  B

What is the meaning of LIKE '%0%0%'

A.Feature begins with two 0's
B.Feature ends with two 0's
C.Feature has more than two 0's
D.Feature has two 0's in it, at any position
Answer  D

Que.7. What is the difference between the WHERE and HAVING SQL clauses?
A.    The WHERE and the HAVING clauses are identical The HAVING SQL clause condition(s) is applied to all rows in the result set before the 
B.    WHERE clause is applied (if parent). The WHERE clause is used only with SELECT SQL statements and specifies a search condition for an aggregate or a group.
C.    HAVING clause is applied (if parent). The HAVING clause is used only with SELECT SQL statements and specifies a search condition for an aggregate or a group
Answer  C

If you use ��.. in your code, TRUNCATE can be rolled back.
A) Triggers
B) Views
C) Transactions
D) Functions
Answer  C

Command used to shrink the size of database is:
a) DBCC SHRINK
b) SHRINKDATABASE
c) DBCC SHRINKDATABASE
d) DBCC SHRINKDB
Answer  A

The BEGIN and END statements are used when:
a) A WHILE loop needs to include a block of statements
b) An element of a CASE expression needs to include a block of statements
c) An IF or ELSE clause needs to include a block of statements
d) All of the mentioned
Answer  D

 Stored procedure is a __________ set of one or more SQL statements.
a) interpreted
b) compiled
c) pre compiled
d) none of the mentioned
Answer  C

SELECT NULLIF('a','a')
a)NULL
b)a
c)aa
d)0
Answer  A

SELECT IIF(2==2,'ACE','PHARMA')
a) PHARMA
b) ACE
c) NULL
d) Syntax Error
Answer  D

Which of the following works on server side?
a. ViewState
b. HiddenField
c. Application and session
d. All of the above
Answer  C 

Which of the following works on client side?
a. ViewState
b. HiddenField
c. ControlState
d. All of the above
Answer  D

A web application can contain _______ .
a. Only One Web.Config File
b. Only Two Web.Config File
c. more than one Web.config file
d. No file.
Answer  C

ByDefault ASP.Net SessionID is stored in _________.
a. Application
b. Session
c. Cookies
d. ViewState
Answer  C

Application_Start event is available in which file?
a. Global.asax
b. Local.asax
c. Web.config
d. None of the above
Answer  A

The SQL ALTER statement can be used to:
A.change the table data.
B.change the table structure.
C.delete rows from the table.
D.add rows to the table.
Answer  B

Which control is required of every AJAX page to manage the JavaScript files sent to the client and the communication between client and server?
a. UpdatePanel
b. ScriptManager 
c. AsyncPostBackTrigger
d. None of the above.
Answer  B

To implement a specified .NET Framework interface which directive is used?
a. @Register
b. @Control
c. @Reference
d. @Implements 
Answer  D

Which of the following is not an ASP.NET page event? 
a. Init
b. Load
c. Import 
d. None of the above. 
Answer  C

Choose the correct option about DataSet object.
a. Provides Disconnected mode
b. Can store multiple table simultaneously
c. Consumer Object
d. All of the above.
Answer  D

ASP.NET Validation Control works at ________ . 
a. Client side only.
b. Server side only.
c. Both Client Side and Server Side 
d. None of the above.
Answer  C

Which of the below queries displays employee name and new salary after the increment of 1000?
A.	SELECT ename, sal FROM emp;
B.	SELECT ename, sal=sal+1000 FROM emp;
C.	SELECT ename, sal+1000 FROM emp;
D.	SELECT ename, 1000 FROM emp;
Answer  C

Determine the output of the below query
SELECT sal + NULL FROM emp
WHERE empno = 7369;
A.	sal + NULL
B.	NULL
C.	0
D.	1250
Answer  B

In SQL, which command is used to add new rows to a table?
a) Alter Table
b) Add row
c) Insert
d) Append
Answer  C

Which clause is used with an �aggregate functions�?
a) GROUP BY
b) SELECT
c) WHERE
d) Both a and c
Answer  A

What operator tests column for the absence of data?
A) EXISTS operator
B) NOT operator 
C) IS NULL operator 
D) None of these
Answer  C

Which of the following query finds the total rating of the sailors who have reserved boat "103"?
A.SELECT SUM(s.rating) FROM sailors s, reserves r AND r.bid = 103;
B.SELECT s.rating FROM sailors s, reserves r WHERE s.sid = r.sid AND r.bid = 103
C.SELECT COUNT(s.rating) FROM sailors s, reserves r WHERE s.sid = r.sid AND r.bid = 103
D.SELECT SUM(s.rating) FROM sailors s, reserves r WHERE s.sid = r.sid AND r.bid = 103

Answer  D