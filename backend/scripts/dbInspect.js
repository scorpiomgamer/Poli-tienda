const sql = require('mssql');

const cfg = {
  user: process.env.DB_USER || 'adminPoli',
  password: process.env.DB_PASSWORD || '1234Q',
  server: process.env.DB_SERVER || 'localhost',
  database: process.env.DB_DATABASE || 'Tiendagatuna',
  options: { encrypt: false, trustServerCertificate: true },
  port: process.env.DB_PORT ? parseInt(process.env.DB_PORT, 10) : 1433,
  connectionTimeout: 10000,
  requestTimeout: 10000
};

async function inspect() {
  try {
    console.log('Conectando con', cfg.user, '@', cfg.server + ':' + cfg.port, 'db:', cfg.database);
    const pool = await sql.connect(cfg);

    console.log('\nTablas en la base de datos:');
    const tables = await pool.request().query("SELECT TABLE_SCHEMA, TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE'");
    console.log(tables.recordset);

    console.log('\nProbar SELECT TOP 5 FROM Producto:');
    try {
      const prod = await pool.request().query('SELECT TOP 5 * FROM Producto');
      console.log(prod.recordset);
    } catch (err) {
      console.error('Error SELECT Producto:', err.message || err);
    }

    console.log('\nProbar SELECT TOP 5 FROM Categoria:');
    try {
      const cat = await pool.request().query('SELECT TOP 5 * FROM Categoria');
      console.log(cat.recordset);
    } catch (err) {
      console.error('Error SELECT Categoria:', err.message || err);
    }

    await pool.close();
  } catch (err) {
    console.error('Error general de conexión:', err.message || err);
  }
}

inspect().then(()=>process.exit(0));
