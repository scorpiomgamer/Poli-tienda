const db = require('../config/database');

class ProductoModel {

    static async obtenerProductos() {
    
        const basedatos = await db();
        const resultado = await basedatos.query('SELECT * FROM Producto');
        return resultado.recordset;
    }
}

(async () => {
    const producto = await ProductoModel.obtenerProductos();
    console.log(producto);
})();


   