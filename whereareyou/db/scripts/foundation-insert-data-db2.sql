CREATE TABLE GENRE(
	GENRE_ID VARCHAR(5) NOT NULL,
	NAME VARCHAR(50) NOT NULL,
	PRIMARY KEY(GENRE_ID));

CREATE TABLE MOVIE(
	MOVIE_ID VARCHAR(8) NOT NULL,
	GENRE_ID VARCHAR(5) NOT NULL,
	TITLE VARCHAR(50) NOT NULL,
	DIRECTOR VARCHAR(50) NOT NULL,
	ACTORS VARCHAR(100) NOT NULL,
	RUNTIME DECIMAL(3),
	RELEASE_DATE DATE,
	TICKET_PRICE DECIMAL(6,2),
	POSTER_FILE VARCHAR(1000),
	NOW_PLAYING CHAR(1),
	PRIMARY KEY(MOVIE_ID),
	FOREIGN KEY (GENRE_ID) REFERENCES GENRE(GENRE_ID));

CREATE TABLE IDS(
	TABLE_NAME VARCHAR(16) NOT NULL PRIMARY KEY,
	NEXT_ID DECIMAL(30) NOT NULL);
	
INSERT INTO GENRE VALUES('GR-01','Action');
INSERT INTO GENRE VALUES('GR-02','Adventure');
INSERT INTO GENRE VALUES('GR-03','Animation');
INSERT INTO GENRE VALUES('GR-04','Comedy');
INSERT INTO GENRE VALUES('GR-05','Crime');
INSERT INTO GENRE VALUES('GR-06','Drama');
INSERT INTO GENRE VALUES('GR-07','Fantasy');
INSERT INTO GENRE VALUES('GR-08','Romance');
INSERT INTO GENRE VALUES('GR-09','Sci-Fi');
INSERT INTO GENRE VALUES('GR-10','Thriller');

INSERT INTO MOVIE VALUES('MV-00001','GR-02','Alice in Wonderland','Tim Burton','Johnny Depp',110,TO_DATE('2010-03-04','yyyy-MM-dd'),8000,'sample/images/posters/aliceinwonderland.jpg','Y');
INSERT INTO MOVIE VALUES('MV-00002','GR-09','Avatar','James CaTablesmeron','Sigourney Weaver',100,TO_DATE('2010-02-16','yyyy-MM-dd'),7000,'sample/images/posters/avatar.jpg','Y');
INSERT INTO MOVIE VALUES('MV-00003','GR-01','Green Zone','Paul Greengrass','Yigal Naor',90,TO_DATE('2010-03-25','yyyy-MM-dd'),7000,'sample/images/posters/greenzone.jpg','Y');
INSERT INTO MOVIE VALUES('MV-00004','GR-06','Remember Me','Allen Coulter','Caitlyn Rund',115,TO_DATE('2010-03-12','yyyy-MM-dd'),8000,'sample/images/posters/rememberme.jpg','Y');
INSERT INTO MOVIE VALUES('MV-00005','GR-04','She is Out of My League','Jim Field Smith','Jay Baruchel',118,TO_DATE('2010-03-12','yyyy-MM-dd'),7500,'sample/images/posters/shesoutof.jpg','Y');
INSERT INTO MOVIE VALUES('MV-00006','GR-05','Shutter Island','Martin Scorsese','Leonardo DiCaprio',95,TO_DATE('2010-03-18','yyyy-MM-dd'),8000,'sample/images/posters/shutterisland.jpg','Y');

INSERT INTO IDS VALUES('GENRE',11);
INSERT INTO IDS VALUES('MOVIE',7);

commit;

