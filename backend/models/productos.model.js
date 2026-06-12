const db = require('../config/database');

class ProductoModel {

    static async obtenerProductos() {
    
        const basedatos = await db();
        const resultado = await basedatos.query(`
            SELECT
                p.Id,
                p.Nombre,
                p.Descripcion,
                p.Precio,
                p.Stock,
                p.ImagenUrl,
                p.CategoriaId,
                c.Nombre AS Categoria,
                p.FechaCreacion
            FROM Producto p
            LEFT JOIN Categoria c ON p.CategoriaId = c.Id
        `);
        return resultado.recordset;
    }
}

module.exports = ProductoModel;
   
