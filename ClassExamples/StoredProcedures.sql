select version() as "CurrentMySQLVersion";
CREATE DATABASE DBPROC;
USE DBPROC;
CREATE TABLE TABLE1 (S1 INT);
INSERT INTO TABLE1 VALUE (5);
-- STORE PROC WITH DIFF VARIATIONS
CREATE PROCEDURE p1 ()
SELECT 'HELLO WORLD';
-- OUTPUT
CALL p1();

-- input parameter
CREATE PROCEDURE p2(IN p int)
SET @X = p;
-- call proc with param
CALL p2(5555);
-- output is stored in X
SELECT @X;
-- drop proc2
DROP PROCEDURE p2;

-- create output procedure
CREATE PROCEDURE p3 (OUT p INT)
SET p=100;
-- output must have @
CALL p3(@y);
-- show output
SELECT @y;

delimiter //
CREATE PROCEDURE p4 ()
BEGIN
	DECLARE var1 INT; -- Declare var
    SET var1 = 0;	  -- init var
    WHILE var1 < 5 DO
		INSERT INTO TABLE1 VALUES (var1);
        SET var1 = var1 +1;
	END WHILE;
END;
//
delimiter ;
CALL p4();
SELECT * FROM TABLE1;

-- REPEAT
delimiter //
CREATE PROCEDURE p5()
BEGIN
	DECLARE var2 INT;
    SET var2 = 0;
    REPEAT
		INSERT INTO TABLE1 VALUES(var2);
        SET var2 = var2 + 1;
        UNTIL var2 >= 10
	END REPEAT;
END; 
//
delimiter ;
CALL p5();
SELECT * FROM TABLE1;

-- IF
delimiter //
CREATE PROCEDURE p6()
BEGIN
	DECLARE var3 INT;
    SET var3 = 0;
    loop_label: LOOP
		INSERT INTO TABLE1 VALUE (var3);
		SET var3 = var3 + 1;
		IF var3 >= 5 THEN
			LEAVE loop_label;
		END IF;
	END LOOP;
END; 
//

CALL p6()//
SELECT COUNT(*) FROM TABLE1//

-- CASE STATEMENT
DROP PROCEDURE IF EXISTS p7;
CREATE PROCEDURE p7(IN parameter1 INT)
BEGIN
	DECLARE var4 INT;
    SET var4 = parameter1 + 1;
    CASE var4
		WHEN 0 THEN INSERT INTO TABLE1 VALUES (99);
        WHEN 1 THEN INSERT INTO TABLE1 VALUES (12);
        ELSE INSERT INTO TABLE1 VALUES (20);
    END CASE;
END;
//
CALL p7(0)//
SELECT * FROM TABLE1//
