const express = require('express');
const router = express.Router();
const Controller = require('../controller/productos.controler');

router.get('/productos', Controller.getProductos);
module.exports = router;

