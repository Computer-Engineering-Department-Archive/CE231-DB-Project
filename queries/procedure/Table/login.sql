CREATE TABLE twitter.login(
	pk					int auto_increment,
    ID					NVARCHAR(20) NOT NULL,
    TIME				DATE NOT NULL,
    PRIMARY KEY (pk),
    FOREIGN KEY (ID) REFERENCES twitter.user(ID) ON DELETE CASCADE)
