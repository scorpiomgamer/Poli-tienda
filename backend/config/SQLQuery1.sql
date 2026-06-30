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



-- 1. INSERTAR CATEGORÍAS DE EJEMPLO
-- Guardamos primero las categorías para poder obtener sus IDs (1, 2, 3, 4, 5)
INSERT INTO Categoria (Nombre, Descripcion) VALUES 
('Alimentos', 'Comida seca, húmeda y snacks para gatos de todas las edades.'),
('Juguetes', 'Rascadores, ratones de juguete, cañas y punteros láser.'),
('Higiene', 'Arenas sanitarias, cajas de arena, palas y champús.'),
('Accesorios', 'Collares, arneses, transportadoras y camas cómodas.'),
('Salud y Cuidado', 'Vitaminas, eliminadores de pelo y cepillos para el pelaje.')

-- 2. INSERTAR PRODUCTOS ASOCIADOS A LAS CATEGORÍAS
-- Nota: No incluimos 'Id' ni 'FechaCreacion' porque se generan automáticamente.
INSERT INTO Producto (Nombre, Descripcion, Precio, Stock, CategoriaId) VALUES 
-- Categoría: Alimentos (Id: 1)
('Alimento Premium Adulto 3kg', 'Comida seca balanceada para gatos adultos con sabor a salmón.', 24.99, 50, 1),
('Lata de Comida Húmeda Pollo', 'Deliciosa comida húmeda enlatada para gatitos, alta en proteína.', 1.80, 120, 1),
('Snacks de Catnip', 'Premios crujientes con infusión de menta gatuna.', 3.50, 80, 1),

-- Categoría: Juguetes (Id: 2)
('Rascador de Torre de 3 Pisos', 'Árbol rascador grande con plataformas y juguetes colgantes.', 45.00, 15, 2),
('Caña con Plumas y Cascabel', 'Juguete interactivo para estimular el instinto de caza.', 4.20, 60, 2),
('Ratón de Juguete a Cuerda', 'Pequeño ratón mecánico que se mueve por el suelo.', 2.99, 100, 2),

-- Categoría: Higiene (Id: 3)
('Arena Sanitaria Aglomerante 10kg', 'Arena de bentonita de alta absorción y control de olores.', 12.50, 40, 3),
('Arenero Cerrado Ergonómico', 'Caja de arena con filtro de carbón para evitar malos olores.', 22.00, 20, 3),
('Pala Limpiadora Plástica', 'Pala resistente con ranuras óptimas para limpiar el arenero.', 1.50, 75, 3),

-- Categoría: Accesorios (Id: 4)
('Cama Tipo Cueva Ultra Suave', 'Cama acolchada y térmica que ofrece un refugio seguro.', 18.99, 25, 4),
('Collar Anti-ahogo con Cascabel', 'Collar ajustable con broche de seguridad de liberación rápida.', 3.99, 90, 4),
('Transportadora Rígida Viajera', 'Caja de viaje segura y ventilada para visitas al veterinario.', 29.50, 18, 4),

-- Categoría: Salud y Cuidado (Id: 5)
('Malta para Gatos Anti-Bolas de Pelo', 'Pasta que ayuda a evacuar de forma natural las bolas de pelo.', 6.80, 35, 5),
('Cepillo Cardina Deslanador', 'Herramienta para remover el pelo muerto y evitar nudos.', 7.20, 50, 5);
GO

-- 3. VERIFICAR QUE TODO SE HAYA GUARDADO CORRECTAMENTE
SELECT p.Id, p.Nombre, p.Precio, p.Stock, c.Nombre AS Categoria, p.FechaCreacion
FROM Productos p
INNER JOIN Categoria c ON p.CategoriaId = c.Id;
GO

CREATE TABLE Venta (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    ProductoId INT NOT NULL,
    Cantidad INT NOT NULL,
    PrecioUnitario DECIMAL(10,2) NOT NULL,
    Total DECIMAL(10,2) NOT NULL,
    FechaVenta DATETIME DEFAULT GETDATE(),

    CONSTRAINT FK_Venta_Producto
        FOREIGN KEY (ProductoId)
        REFERENCES Producto(Id)
);

INSERT INTO Venta (ProductoId, Cantidad, PrecioUnitario, Total, FechaVenta)
VALUES
(1, 2, 48900.00, 97800.00, GETDATE()),
(2, 1, 26900.00, 26900.00, GETDATE()),
(3, 3, 12900.00, 38700.00, GETDATE()),
(4, 2, 18900.00, 37800.00, GETDATE()),
(5, 1, 15900.00, 15900.00, GETDATE()),
(6, 2, 9900.00, 19800.00, GETDATE()),
(7, 1, 42900.00, 42900.00, GETDATE()),
(8, 2, 24900.00, 49800.00, GETDATE()),
(9, 1, 69900.00, 69900.00, GETDATE()),
(10, 1, 89900.00, 89900.00, GETDATE()),
(1, 1, 48900.00, 48900.00, GETDATE()),
(2, 4, 26900.00, 107600.00, GETDATE()),
(3, 2, 12900.00, 25800.00, GETDATE()),
(5, 3, 15900.00, 47700.00, GETDATE()),
(7, 2, 42900.00, 85800.00, GETDATE());

select * from Venta
