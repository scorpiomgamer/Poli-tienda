const sql = require('mssql');

const user = process.env.DB_USER || 'adminPoli';
const password = process.env.DB_PASSWORD || '1234Q';
const database = process.env.DB_DATABASE || 'Tiendagatuna';

const attempts = [
    { name: 'localhost:1433', config: { user, password, server: 'localhost', database, port: 1433, options: { encrypt: false, trustServerCertificate: true } } },
    { name: '127.0.0.1:1433', config: { user, password, server: '127.0.0.1', database, port: 1433, options: { encrypt: false, trustServerCertificate: true } } },
    { name: 'instance SQLEXPRESS', config: { user, password, server: 'localhost', database, options: { instanceName: 'SQLEXPRESS', encrypt: false, trustServerCertificate: true } } },
    { name: 'named pipe local', config: { user, password, server: 'localhost\\SQLEXPRESS', database, options: { encrypt: false, trustServerCertificate: true } } }
];

async function tryConnect(name, cfg) {
    console.log('Intentando:', name);
    try {
        const pool = await sql.connect(Object.assign({ connectionTimeout: 5000, requestTimeout: 5000 }, cfg));
        console.log('OK:', name);
        await pool.close();
        return true;
    } catch (err) {
        console.error('Fallo:', name, err.code || err.message);
        return false;
    }
}

(async () => {
    for (const a of attempts) {
        // Wait a bit between attempts
        await new Promise(r => setTimeout(r, 300));
        await tryConnect(a.name, a.config);
    }
    process.exit(0);
})();
