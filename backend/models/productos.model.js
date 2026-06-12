const db = require('../config/database');

class ProductoModel {

    static async obtenerProductos() {
    
        const basedatos = await db();
        const resultado = await basedatos.query(`
            SELECT
                Id,
                Nombre,
                Descripcion,
                Precio,
                Stock,
                CategoriaId,
                FechaCreacion
            FROM Producto
        `);
        return resultado.recordset;
    }
}

module.exports = ProductoModel;
   
