DELIMITER //

CREATE PROCEDURE Register (
	IN FIRSTNAME varchar(30),
	IN LASTNAME varchar(30),
	IN ID varchar(20),
    IN password varchar(128),
    IN BORN date,
    IN JOINED date,
    IN BIO varchar(64)
)
BEGIN
	INSERT IGNORE
    INTO twitter.user
    VALUES(FIRSTNAME, LASTNAME, ID, SHA2(password, 256), BORN, JOINED, BIO);
    CALL AddSession(ID);
END //

DELIMITER ;