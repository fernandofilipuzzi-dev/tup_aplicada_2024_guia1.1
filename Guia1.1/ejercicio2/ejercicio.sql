
--1 Bicicleta
--2 Motocicleta
--3 Automóvil
--4 Transporte público
DECLARE @Respuestas TABLE
(
  Id INT PRIMARY KEY IDENTITY(1,1),
  Tipo_Transporte INT NOT NULL,
  Distancia_Recorrido decimal(18,2) NOT NULL,
  Domicilio_Desde NVARCHAR(50),
  Domicilio_Hasta NVARCHAR(50),
  Email NVARCHAR(50)
)

INSERT INTO @Respuestas (Tipo_Transporte, Distancia_Recorrido, Domicilio_Desde, Domicilio_Hasta, Email)
VALUES(1, 4.0, 'corrientes 2200', 'almafuerte 1033','anibal@gmail.com'),
(2, 8.5, 'artigas y gervacio mendez', 'almafuerte 1033','marta@gmail.com'),
(2, 6.0, 'las lechiguanas', 'almafuerte 1033','cecilia@gmail.com')

--c- Población o cantidad de encuestados
SELECT COUNT(*) FROM @Respuestas

--d- Cantidades de personas que usan cada uno de los vehículos encuestados.

