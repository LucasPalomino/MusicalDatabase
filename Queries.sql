--- Query tests ---

SELECT * FROM Composer
SELECT * FROM Piece ORDER BY Piece_opus_num
SELECT * FROM Orchestral
SELECT * FROM PlaysIn
  
SELECT Orchestral.Composer_name
FROM Orchestral LEFT OUTER JOIN (SELECT * FROM PlaysIn WHERE PlaysIn.Instrument_type = 'violin') 
AS PlaysIn_violin
ON Orchestral.Composer_name = PlaysIn_violin.Composer_name
WHERE PlaysIn_violin.Composer_name IS NULL

SELECT Orchestral.Composer_name
FROM Orchestral LEFT OUTER JOIN (SELECT * FROM PlaysIn WHERE PlaysIn.Instrument_type = 'violin') AS PlaysIn_violin
ON Orchestral.Composer_name = PlaysIn_violin.Composer_name
AND Orchestral.Piece_opus_num = PlaysIn_violin.Piece_opus_num
WHERE PlaysIn_violin.Composer_name IS NULL
