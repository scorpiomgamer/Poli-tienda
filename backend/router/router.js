const exprress = require('express');
const router = exprress.Router();
const Controller = require('../controller/productos.controler');

router.get('/productos', Controller.getProductos);
module.exports = router;

