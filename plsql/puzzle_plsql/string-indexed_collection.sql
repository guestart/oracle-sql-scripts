REM
REM     Script:        string-indexed_collection.sql
REM     Author:        Quanwen Zhao
REM     Dated:         Dec 12, 2019
REM
REM     Purpose:
REM        A quick little #PLSQL puzzle written by Steven Feuerstein (Oracle) on Twitter on Dec 10, 2019.
REM        and his analytic PL/SQL code has also been uploaded to Live SQL:
REM           https://livesql.oracle.com/apex/livesql/file/content_JC3YOYT7533XBW5FCGNDQYRQY.html
REM        and also having a nice explanation on his blog note:
REM           https://stevenfeuersteinonplsql.blogspot.com/2019/12/plsql-puzzle-when-implicit-conversions.html
REM

-- The initial tweet contents:

-- I set serveroutput on. After running the code you see in the block below, what will be displayed on the screen?

-- #orcldb #oracledatabase

DECLARE
   TYPE t IS TABLE OF INTEGER
      INDEX BY VARCHAR2 (3);
   tt   t;
BEGIN
   FOR indx IN 1 .. 10
   LOOP
      tt (indx) := 100;
   END LOOP;
   
   DBMS_OUTPUT.put_line (tt.COUNT);
   DBMS_OUTPUT.put_line (tt.FIRST);
   DBMS_OUTPUT.put_line (tt.LAST);
END;
/

10
1
9

-- His demonstration PL/SQL code:

DECLARE
   TYPE t IS TABLE OF INTEGER
      INDEX BY VARCHAR2 (3);
      
   tt   t;
   
   l_index VARCHAR2 (3);
BEGIN
   FOR indx IN 1 .. 10
   LOOP
      tt (indx) := 100;
   END LOOP;
   
   l_index := tt.FIRST;
   
   WHILE l_index IS NOT NULL
   LOOP
      DBMS_OUTPUT.put_line (l_index);
      l_index := tt.NEXT (l_index);
   END LOOP;
END;
/

1
10
2
3
4
5
6
7
8
9
