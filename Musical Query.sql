USE [Musical Database]

CREATE TABLE Composer
(
 Composer_name varchar(30),

 CONSTRAINT PK_Composer PRIMARY KEY(Composer_name)
)

CREATE TABLE Piece
(
 Composer_name varchar(30),
 Piece_opus_num int,
 Piece_clef varchar(6),
 Piece_key varchar(15),

 CONSTRAINT PK_Piece PRIMARY KEY(Composer_name, Piece_opus_num),
 CONSTRAINT FK_Piece_Composer FOREIGN KEY(Composer_name)
	REFERENCES Composer(Composer_name),
 CONSTRAINT Check_positive_opus_num CHECK(Piece_opus_num > 0),
 CONSTRAINT Check_clef_domain CHECK(Piece_clef in ('treble','bass','alto','tenor'))
)

CREATE TABLE Orchestral
(
 Composer_name varchar(30),
 Piece_opus_num int,

 CONSTRAINT PK_Orchestral PRIMARY KEY(Composer_name, Piece_opus_num),
 CONSTRAINT FK_Orchestral_Piece FOREIGN KEY(Composer_name, Piece_opus_num)
	REFERENCES Piece(Composer_name, Piece_opus_num)
)

CREATE TABLE Choral
(
 Composer_name varchar(30),
 Piece_opus_num int,
 Choral_lyrics text,

 CONSTRAINT PK_Choral PRIMARY KEY(Composer_name, Piece_opus_num),
 CONSTRAINT FK_Choral_Piece FOREIGN KEY(Composer_name, Piece_opus_num)
	REFERENCES Piece(Composer_name, Piece_opus_num)
)

CREATE TABLE Instrument
(
 Instrument_type varchar(25),

 CONSTRAINT PK_Instrument PRIMARY KEY(Instrument_type)
)

CREATE TABLE PlaysIn
(
 Composer_name varchar(30),
 Piece_opus_num int,
 Instrument_type varchar(25),
 score varchar(20),
 quantity int,

 CONSTRAINT PK_PlaysIn PRIMARY KEY(Composer_name, Piece_opus_num, Instrument_type),
 CONSTRAINT FK_PlaysIn_Orchestral FOREIGN KEY(Composer_name, Piece_opus_num)
	REFERENCES Orchestral(Composer_name, Piece_opus_num),
 CONSTRAINT FK_PlaysIn_Instrument FOREIGN KEY(Instrument_type)
	REFERENCES Instrument(Instrument_type)
)

SELECT * FROM Composer
SELECT * FROM Piece ORDER BY Piece_opus_num
SELECT * FROM Orchestral
SELECT * FROM PlaysIn

INSERT INTO Composer(Composer_name)
VALUES('Lucas'),('Sofia'),('Tamami'),('Carlos'),('Saya'),('Mika')

INSERT INTO Piece(Composer_name,Piece_opus_num)
VALUES('Lucas',11),('Sofia',22),('Tamami',33),('Carlos',44),('Saya',55),('Mika',66)

INSERT INTO Orchestral(Composer_name,Piece_opus_num)
VALUES('Lucas',11),('Sofia',22),('Tamami',33),('Carlos',44),('Saya',55),('Mika',66)

INSERT INTO Instrument(Instrument_type)
VALUES('violin'),('Piano'),('Trombone'),('Flute')

INSERT INTO PlaysIn(Composer_name,Piece_opus_num, Instrument_type)
VALUES('Lucas',11,'violin'),('Tamami',33,'Piano'),('Carlos',44,'violin'),('Carlos',44,'Trombone'),
	  ('Saya',55,'Flute'),('Mika',66,'violin')

--------------

SELECT Orchestral.Composer_name
FROM Orchestral LEFT OUTER JOIN (SELECT * FROM PlaysIn WHERE PlaysIn.Instrument_type = 'violin') 
AS PlaysIn_violin
ON Orchestral.Composer_name = PlaysIn_violin.Composer_name
WHERE PlaysIn_violin.Composer_name IS NULL

SELECT * FROM Orchestral

SELECT Orchestral.Composer_name
FROM Orchestral LEFT OUTER JOIN (SELECT * FROM PlaysIn WHERE PlaysIn.Instrument_type = 'violin') AS PlaysIn_violin
ON Orchestral.Composer_name = PlaysIn_violin.Composer_name
AND Orchestral.Piece_opus_num = PlaysIn_violin.Piece_opus_num
WHERE PlaysIn_violin.Composer_name IS NULL