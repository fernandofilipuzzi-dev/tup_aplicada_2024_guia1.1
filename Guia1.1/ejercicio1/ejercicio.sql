--SET NOCOUNT ON

--a Crear una tabla con:
DECLARE @Alumnos TABLE(
	Id INT PRIMARY KEY IDENTITY(1,1),
	LU INT NOT NULL, 
	Nombre NVARCHAR(50) NOT NULL DEFAULT 'NN',
	Nota DECIMAL(18,2)
);

--class Persona
--{
--   static int GEN =1;

--   public int Id{get;set;}
--   public string Nombre{get;set;}
--   public int? Nota{get;set;}

--   public Persona()
--   {
--      Id=GEN++;
--	  Nombre="NN";
--   }
--}


--b- Insertar el siguiente listado
INSERT INTO @Alumnos (LU, Nombre, Nota)
VALUES (2342, 'Anibal', 45),
(2342, 'Anibal', 45),
(2343, 'Camila', 85.5),
(2333, 'Cecilia', 60.6),
(2337, 'Nelson', 75.7),
(2589, 'José', 75.7),
(2902, 'Jose mnauel', 75.7)

--c- Liste aquellos alumnos que superaron el promedio de todas las notas, ordenados por número libreta de mayor a menor.

-- calculo del promedio
DECLARE @Promedio DECIMAL(18,2)=0
SELECT @Promedio=AVG(Nota) FROM @Alumnos; 
PRINT 'Promedio:'+CONVERT(NVARCHAR(50),@Promedio)

-- filtro aquellos que superaron el promedio
SELECT * FROM @Alumnos WHERE Nota>=@Promedio

--alternativa - usando subconsultas
SELECT * FROM @Alumnos WHERE NOTA >= (SELECT AVG(Nota) FROM @Alumnos)

--d- Liste aquellos Alumnos que contengan en su nombre la palabra “jose”, ignore los acentos y las mayúsculas/minúsculas

-- buscando aquellos registros que continene jose - % es el comodin
--DECLARE @Expresion NVARCHAR(50) ='%jose%';
--SELECT * FROM @Alumnos WHERE Nombre=@Expresion

--ignorando las mayusculas/minusculas
--DECLARE @Expresion NVARCHAR(50) ='%jose%';
--SELECT * FROM @Alumnos WHERE UPPER(Nombre)=UPPER(@Expresion)

-- ignorando mayusculas/minusculas - 
DECLARE @Expresion NVARCHAR(50) ='%jose%';
SELECT * FROM @Alumnos WHERE Nombre COLLATE Latin1_General_CI_AI = @Expresion;



---alterativa al punto (d)

DECLARE @Aprobados TABLE(
	Id INT PRIMARY KEY IDENTITY(1,1),
	LU INT NOT NULL, 
	Nombre NVARCHAR(50) NOT NULL DEFAULT 'NN',
	Nota DECIMAL(18,2)
);

DECLARE @Id INT;
DECLARE @LU INT;
DECLARE @Nombre NVARCHAR(50);
DECLARE @Nota DECIMAL(18,2);
DECLARE Cursor_Persona CURSOR FOR SELECT Id,LU, Nombre,Nota FROM @Alumnos;

OPEN Cursor_Persona;

FETCH NEXT FROM Cursor_Persona INTO @Id, @LU, @Nombre, @Nota;

WHILE @@FETCH_STATUS=0
BEGIN 

    IF(@Nota>=@Promedio)
	BEGIN
		PRINT 'Persona:'+ CONVERT(NVARCHAR(50),@Id)+'-'+@Nombre+'-'+CONVERT(NVARCHAR(50),@Nota);
		INSERT INTO @Aprobados (LU, Nombre, Nota) VALUES (@LU, @Nombre, @Nota);
	END

	FETCH NEXT FROM Cursor_Persona INTO @Id, @LU, @Nombre, @Nota;
END

CLOSE Cursor_Persona;

DEALLOCATE Cursor_Persona

SELECT * FROM @Aprobados

---

--e- Informe el alumno con la mayor nota y el alumno con la menor nota del listado que superaron el promedio

SELECT TOP 1 * FROM @Alumnos ORDER BY Nota DESC

SELECT TOP 1 * FROM @Alumnos ORDER BY Nota ASC