-- Ejecuta esto en SSMS si ya tienes la base Tiendagatuna creada

USE Tiendagatuna;

-- Agregar columna de imagen si no existe
IF NOT EXISTS (
    SELECT 1 FROM sys.columns
    WHERE object_id = OBJECT_ID('Producto') AND name = 'ImagenUrl'
)
BEGIN
    ALTER TABLE Producto ADD ImagenUrl VARCHAR(500);
END

-- Crear tabla Usuario si no existe
IF NOT EXISTS (SELECT 1 FROM sys.tables WHERE name = 'Usuario')
BEGIN
    CREATE TABLE Usuario (
        Id INT IDENTITY(1,1) PRIMARY KEY,
        Nombre VARCHAR(100) NOT NULL,
        Email VARCHAR(150) NOT NULL UNIQUE,
        Password VARCHAR(255) NOT NULL,
        FechaRegistro DATETIME DEFAULT GETDATE()
    );
END

-- Actualizar imagenes de productos
UPDATE Producto SET ImagenUrl = 'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?w=400' WHERE Nombre = 'Camiseta Rayas Azules';
UPDATE Producto SET ImagenUrl = 'https://images.unsplash.com/photo-1574158622682-e40e69881006?w=400' WHERE Nombre = 'Camiseta Super Cat';
UPDATE Producto SET ImagenUrl = 'https://images.unsplash.com/photo-1495360010544-e79136916477?w=400' WHERE Nombre = 'Camiseta Deportiva Roja';
UPDATE Producto SET ImagenUrl = 'https://images.unsplash.com/photo-1573865526731-10659fec78a5?w=400' WHERE Nombre = 'Disfraz de León';
UPDATE Producto SET ImagenUrl = 'https://images.unsplash.com/photo-1518791841217-8f162f1e1131?w=400' WHERE Nombre = 'Disfraz de Tiburón';
UPDATE Producto SET ImagenUrl = 'https://images.unsplash.com/photo-1526336024174-e58f5cdd8e13?w=400' WHERE Nombre = 'Disfraz de Pirata';
UPDATE Producto SET ImagenUrl = 'https://images.unsplash.com/photo-1545249390-6bdfa286032f?w=400' WHERE Nombre = 'Abrigo Invernal Gris';
UPDATE Producto SET ImagenUrl = 'https://images.unsplash.com/photo-1519052537078-e6302a4968ef?w=400' WHERE Nombre = 'Chaqueta Impermeable';
UPDATE Producto SET ImagenUrl = 'https://images.unsplash.com/photo-1574158622682-e40e69881006?w=400' WHERE Nombre = 'Abrigo Peluche Rosa';
UPDATE Producto SET ImagenUrl = 'https://images.unsplash.com/photo-1513245543132-31f507417b26?w=400' WHERE Nombre = 'Pijama Estrellas';
UPDATE Producto SET ImagenUrl = 'https://images.unsplash.com/photo-1518791841217-8f162f1e1131?w=400' WHERE Nombre = 'Pijama Ositos';
UPDATE Producto SET ImagenUrl = 'https://images.unsplash.com/photo-1495360010544-e79136916477?w=400' WHERE Nombre = 'Pijama Nubes';
UPDATE Producto SET ImagenUrl = 'https://images.unsplash.com/photo-1526336024174-e58f5cdd8e13?w=400' WHERE Nombre = 'Pañuelo Elegante';
UPDATE Producto SET ImagenUrl = 'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?w=400' WHERE Nombre = 'Corbatín Formal';
UPDATE Producto SET ImagenUrl = 'https://images.unsplash.com/photo-1573865526731-10659fec78a5?w=400' WHERE Nombre = 'Sombrero Vaquero';
