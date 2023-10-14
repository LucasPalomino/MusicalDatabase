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
