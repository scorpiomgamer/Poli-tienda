const db = require('../config/database');
const fs = require('fs');
const path = require('path');

class ProductoModel {

    static async obtenerProductos() {
        try {
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
                LEFT JOIN Categorias c ON p.CategoriaId = c.Id
            `);
            return resultado.recordset;
        } catch (error) {
            // Si falla la conexión a la base de datos, usamos datos de ejemplo como fallback
            console.error('Error al obtener productos desde la BD, usando datos de ejemplo:', error.message || error);
        
        }
    }
}

module.exports = ProductoModel;
   
