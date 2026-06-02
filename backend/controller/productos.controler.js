const model = require('../models/productos.model');

class ProductosController {

    static async getProductos(req, res) {
        const productos = await model.getProductos();
        res.json({ data: productos });
    }
}

module.exports = ProductosController;
