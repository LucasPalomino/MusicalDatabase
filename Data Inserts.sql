--- Insert Statements ---

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
