

CREATE DATABASE Tiendagatuna;
GO

USE Tiendagatuna;
GO

CREATE TABLE Categoria (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(150) NOT NULL,
    Descripcion TEXT
);
GO

CREATE TABLE Producto (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(150) NOT NULL,
    Descripcion TEXT,
    Precio DECIMAL(10,2) NOT NULL,
    Stock INT DEFAULT 0,
    CategoriaId INT,
    FechaCreacion DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_Producto_Categoria FOREIGN KEY (CategoriaId)
        REFERENCES Categoria(Id) ON DELETE SET NULL
);
GO

-- 1. INSERTAR CATEGORÍAS DE ROPA PARA GATITOS
INSERT INTO Categoria (Nombre, Descripcion) VALUES
('Camisetas', 'Prendas ligeras y cómodas para uso diario.'),
('Disfraces', 'Vestimenta temática para eventos y fotografías.'),
('Abrigos y Chaquetas', 'Ropa para proteger del frío.'),
('Pijamas', 'Prendas suaves para descanso y comodidad.'),
('Accesorios de Moda', 'Corbatas, pañuelos, sombreros y complementos.');
GO

-- 2. INSERTAR PRODUCTOS
INSERT INTO Producto (Nombre, Descripcion, Precio, Stock, CategoriaId) VALUES

-- Camisetas (Id: 1)
('Camiseta Rayas Azules', 'Camiseta de algodón transpirable para gatos pequeños.', 12.99, 30, 1),
('Camiseta Super Cat', 'Diseño divertido con estampado de superhéroe.', 14.50, 25, 1),
('Camiseta Deportiva Roja', 'Tela ligera ideal para actividades diarias.', 13.75, 20, 1),

-- Disfraces (Id: 2)
('Disfraz de León', 'Transforma a tu gato en el rey de la selva.', 19.99, 15, 2),
('Disfraz de Tiburón', 'Disfraz acolchado con aleta decorativa.', 21.50, 12, 2),
('Disfraz de Pirata', 'Incluye sombrero y detalles temáticos.', 18.99, 18, 2),

-- Abrigos y Chaquetas (Id: 3)
('Abrigo Invernal Gris', 'Abrigo térmico para climas fríos.', 24.99, 20, 3),
('Chaqueta Impermeable', 'Protección ligera contra lluvia y humedad.', 27.50, 10, 3),
('Abrigo Peluche Rosa', 'Material suave y cálido para máxima comodidad.', 26.75, 14, 3),

-- Pijamas (Id: 4)
('Pijama Estrellas', 'Tela suave con diseño nocturno.', 16.99, 22, 4),
('Pijama Ositos', 'Pijama cómodo con estampado de ositos.', 17.50, 18, 4),
('Pijama Nubes', 'Prenda ligera ideal para descansar.', 15.99, 25, 4),

-- Accesorios de Moda (Id: 5)
('Pañuelo Elegante', 'Pañuelo ajustable para ocasiones especiales.', 5.99, 40, 5),
('Corbatín Formal', 'Accesorio elegante para fotografías y eventos.', 6.50, 35, 5),
('Sombrero Vaquero', 'Sombrero decorativo para gatos aventureros.', 8.99, 20, 5);
GO

-- 3. CONSULTAR PRODUCTOS Y CATEGORÍAS
SELECT 
    p.Id,
    p.Nombre,
    p.Descripcion,
    p.Precio,
    p.Stock,
    c.Nombre AS Categoria,
    p.FechaCreacion
FROM Producto p
INNER JOIN Categoria c ON p.CategoriaId = c.Id;
GO
