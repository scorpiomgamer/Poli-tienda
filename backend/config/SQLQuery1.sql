
CREATE DATABASE Tiendagatuna;


USE Tiendagatuna;


CREATE TABLE Categoria (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(150) NOT NULL,
    Descripcion TEXT
);


CREATE TABLE Producto (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(150) NOT NULL,
    Descripcion TEXT,
    Precio DECIMAL(10,2) NOT NULL,
    Stock INT DEFAULT 0,
    ImagenUrl VARCHAR(500),
    CategoriaId INT,
    FechaCreacion DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_Producto_Categoria FOREIGN KEY (CategoriaId)
        REFERENCES Categoria(Id) ON DELETE SET NULL
);


CREATE TABLE Usuario (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Email VARCHAR(150) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL,
    FechaRegistro DATETIME DEFAULT GETDATE()
);


-- 1. INSERTAR CATEGORÍAS DE ROPA PARA GATITOS
INSERT INTO Categoria (Nombre, Descripcion) VALUES
('Camisetas', 'Prendas ligeras y cómodas para uso diario.'),
('Disfraces', 'Vestimenta temática para eventos y fotografías.'),
('Abrigos y Chaquetas', 'Ropa para proteger del frío.'),
('Pijamas', 'Prendas suaves para descanso y comodidad.'),
('Accesorios de Moda', 'Corbatas, pañuelos, sombreros y complementos.');


-- 2. INSERTAR PRODUCTOS CON IMÁGENES
INSERT INTO Producto (Nombre, Descripcion, Precio, Stock, ImagenUrl, CategoriaId) VALUES

-- Camisetas (Id: 1)
('Camiseta Rayas Azules', 'Camiseta de algodón transpirable para gatos pequeños.', 12.99, 30, 'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?w=400', 1),
('Camiseta Super Cat', 'Diseño divertido con estampado de superhéroe.', 14.50, 25, 'https://images.unsplash.com/photo-1574158622682-e40e69881006?w=400', 1),
('Camiseta Deportiva Roja', 'Tela ligera ideal para actividades diarias.', 13.75, 20, 'https://images.unsplash.com/photo-1495360010544-e79136916477?w=400', 1),

-- Disfraces (Id: 2)
('Disfraz de León', 'Transforma a tu gato en el rey de la selva.', 19.99, 15, 'https://images.unsplash.com/photo-1573865526731-10659fec78a5?w=400', 2),
('Disfraz de Tiburón', 'Disfraz acolchado con aleta decorativa.', 21.50, 12, 'https://images.unsplash.com/photo-1518791841217-8f162f1e1131?w=400', 2),
('Disfraz de Pirata', 'Incluye sombrero y detalles temáticos.', 18.99, 18, 'https://images.unsplash.com/photo-1526336024174-e58f5cdd8e13?w=400', 2),

-- Abrigos y Chaquetas (Id: 3)
('Abrigo Invernal Gris', 'Abrigo térmico para climas fríos.', 24.99, 20, 'https://images.unsplash.com/photo-1545249390-6bdfa286032f?w=400', 3),
('Chaqueta Impermeable', 'Protección ligera contra lluvia y humedad.', 27.50, 10, 'https://images.unsplash.com/photo-1519052537078-e6302a4968ef?w=400', 3),
('Abrigo Peluche Rosa', 'Material suave y cálido para máxima comodidad.', 26.75, 14, 'https://images.unsplash.com/photo-1574158622682-e40e69881006?w=400', 3),

-- Pijamas (Id: 4)
('Pijama Estrellas', 'Tela suave con diseño nocturno.', 16.99, 22, 'https://images.unsplash.com/photo-1513245543132-31f507417b26?w=400', 4),
('Pijama Ositos', 'Pijama cómodo con estampado de ositos.', 17.50, 18, 'https://images.unsplash.com/photo-1518791841217-8f162f1e1131?w=400', 4),
('Pijama Nubes', 'Prenda ligera ideal para descansar.', 15.99, 25, 'https://images.unsplash.com/photo-1495360010544-e79136916477?w=400', 4),

-- Accesorios de Moda (Id: 5)
('Pañuelo Elegante', 'Pañuelo ajustable para ocasiones especiales.', 5.99, 40, 'https://images.unsplash.com/photo-1526336024174-e58f5cdd8e13?w=400', 5),
('Corbatín Formal', 'Accesorio elegante para fotografías y eventos.', 6.50, 35, 'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?w=400', 5),
('Sombrero Vaquero', 'Sombrero decorativo para gatos aventureros.', 8.99, 20, 'https://images.unsplash.com/photo-1573865526731-10659fec78a5?w=400', 5);


-- Si ya tienes la base creada, ejecuta solo esto:
-- ALTER TABLE Producto ADD ImagenUrl VARCHAR(500);
-- CREATE TABLE Usuario (...);


-- 3. CONSULTAR PRODUCTOS Y CATEGORÍAS
SELECT 
    p.Id,
    p.Nombre,
    p.Descripcion,
    p.Precio,
    p.Stock,
    p.ImagenUrl,
    c.Nombre AS Categoria,
    p.FechaCreacion
FROM Producto p
INNER JOIN Categoria c ON p.CategoriaId = c.Id;
