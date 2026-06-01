

CREATE DATABASE Tiendagatuna;

CREATE TABLE Categorias (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL UNIQUE,
    Descripcion TEXT
);



CREATE TABLE Producto (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(150) NOT NULL,
    Descripcion TEXT,
    Precio DECIMAL(10, 2) NOT NULL,
    Stock INT DEFAULT 0,
    CategoriaId INT,
    FechaCreacion DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_Productos_Categorias FOREIGN KEY (CategoriaId) 
        REFERENCES Categorias(Id) ON DELETE SET NULL
);



-- 1. INSERTAR CATEGOR�AS DE EJEMPLO
-- Guardamos primero las categor�as para poder obtener sus IDs (1, 2, 3, 4, 5)
INSERT INTO Categoria (Nombre, Descripcion) VALUES 
('Alimentos', 'Comida seca, h�meda y snacks para gatos de todas las edades.'),
('Juguetes', 'Rascadores, ratones de juguete, ca�as y punteros l�ser.'),
('Higiene', 'Arenas sanitarias, cajas de arena, palas y champ�s.'),
('Accesorios', 'Collares, arneses, transportadoras y camas c�modas.'),
('Salud y Cuidado', 'Vitaminas, eliminadores de pelo y cepillos para el pelaje.')

-- 2. INSERTAR PRODUCTOS ASOCIADOS A LAS CATEGOR�AS
-- Nota: No incluimos 'Id' ni 'FechaCreacion' porque se generan autom�ticamente.
INSERT INTO Producto (Nombre, Descripcion, Precio, Stock, CategoriaId) VALUES 
-- Categor�a: Alimentos (Id: 1)
('Alimento Premium Adulto 3kg', 'Comida seca balanceada para gatos adultos con sabor a salm�n.', 24.99, 50, 1),
('Lata de Comida H�meda Pollo', 'Deliciosa comida h�meda enlatada para gatitos, alta en prote�na.', 1.80, 120, 1),
('Snacks de Catnip', 'Premios crujientes con infusi�n de menta gatuna.', 3.50, 80, 1),

-- Categor�a: Juguetes (Id: 2)
('Rascador de Torre de 3 Pisos', '�rbol rascador grande con plataformas y juguetes colgantes.', 45.00, 15, 2),
('Ca�a con Plumas y Cascabel', 'Juguete interactivo para estimular el instinto de caza.', 4.20, 60, 2),
('Rat�n de Juguete a Cuerda', 'Peque�o rat�n mec�nico que se mueve por el suelo.', 2.99, 100, 2),

-- Categor�a: Higiene (Id: 3)
('Arena Sanitaria Aglomerante 10kg', 'Arena de bentonita de alta absorci�n y control de olores.', 12.50, 40, 3),
('Arenero Cerrado Ergon�mico', 'Caja de arena con filtro de carb�n para evitar malos olores.', 22.00, 20, 3),
('Pala Limpiadora Pl�stica', 'Pala resistente con ranuras �ptimas para limpiar el arenero.', 1.50, 75, 3),

-- Categor�a: Accesorios (Id: 4)
('Cama Tipo Cueva Ultra Suave', 'Cama acolchada y t�rmica que ofrece un refugio seguro.', 18.99, 25, 4),
('Collar Anti-ahogo con Cascabel', 'Collar ajustable con broche de seguridad de liberaci�n r�pida.', 3.99, 90, 4),
('Transportadora R�gida Viajera', 'Caja de viaje segura y ventilada para visitas al veterinario.', 29.50, 18, 4),

-- Categor�a: Salud y Cuidado (Id: 5)
('Malta para Gatos Anti-Bolas de Pelo', 'Pasta que ayuda a evacuar de forma natural las bolas de pelo.', 6.80, 35, 5),
('Cepillo Cardina Deslanador', 'Herramienta para remover el pelo muerto y evitar nudos.', 7.20, 50, 5);
GO

-- 3. VERIFICAR QUE TODO SE HAYA GUARDADO CORRECTAMENTE
SELECT p.Id, p.Nombre, p.Precio, p.Stock, c.Nombre AS Categoria, p.FechaCreacion
FROM Productos p
INNER JOIN Categoria c ON p.CategoriaId = c.Id;
GO