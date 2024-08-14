--SET NOCOUNT ON

DECLARE @Alumnos TABLE(
	Id INT PRIMARY KEY IDENTITY(1,1),
	LU INT NOT NULL, 
	Nombre NVARCHAR(50) NOT NULL,
	Nota DECIMAL(18,2)
);

INSERT INTO @Alumnos (LU, Nombre, Nota)
VALUES (2342, 'Anibal', 45),
(2342, 'Anibal', 45),
(2343, 'Camila', 85.5),
(2333, 'Cecilia', 60.6),
(2337, 'Nelson', 75.7)

-- calculo del promedio
DECLARE @PROMEDIO DECIMAL(18)=0
SELECT @PROMEDIO=AVG(Nota) FROM @Alumnos;

PRINT 'Promedio:'+CONVERT(NVARCHAR(50),@PROMEDIO)

SELECT * FROM @Alumnos WHERE Nota>=@PROMEDIO

DECLARE @Expresion NVARCHAR(50) ='%jose%';
SELECT * FROM @Alumnos WHERE Nombre=@Expresion

SELECT TOP 1 * FROM @Alumnos ORDER BY Nota DESC

SELECT TOP 1 * FROM @Alumnos ORDER BY Nota ASC
