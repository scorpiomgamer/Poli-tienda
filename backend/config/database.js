const sqlserver = require('mssql');

const config = {
    user: 'AdminPoli',
    password: '1234Q',
    server: 'localhost',
    database: 'Tiendagatuna',
    options: {
        encrypt: false,
        trustServerCertificate: true
    }
};

const conexion = async () => {
    try {
   const pool = await sqlserver.connect(config);
   return pool;
    } catch (error) {        console.error('Error al conectar a la base de datos:', error);
        console.error('Detalles del error:', error.message);
        throw error;  
    }
}

module.exports = conexion;

