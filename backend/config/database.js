const sqlserver = require('mssql');

const defaultConfig = {
    user: process.env.DB_USER || 'AdminPoli',
    password: process.env.DB_PASSWORD || '1234Q',
    server: process.env.DB_SERVER || 'localhost',
    database: process.env.DB_DATABASE || 'Tiendagatuna',
    options: {
        encrypt: (process.env.DB_ENCRYPT === 'true') || false,
        trustServerCertificate: true
    }
};

async function tryConnect(cfg) {
    const pool = await sqlserver.connect(cfg);
    return pool;
}

const conexion = async () => {
    // Intentar conexión con varias alternativas para entornos comunes
    const attempts = [];
    try {
        attempts.push('default');
        return await tryConnect(defaultConfig);
    } catch (errDefault) {
        console.warn('Conexión con configuración por defecto falló:', errDefault.message);
        // Intentar con instanceName (ej. SQLEXPRESS)
        try {
            const cfgInstance = Object.assign({}, defaultConfig, { options: Object.assign({}, defaultConfig.options, { instanceName: process.env.DB_INSTANCE || 'SQLEXPRESS' }) });
            attempts.push('instanceName');
            return await tryConnect(cfgInstance);
        } catch (errInstance) {
            console.warn('Conexión usando instanceName falló:', errInstance.message);
            // Intentar con puerto explícito (1433 por defecto)
            try {
                const cfgPort = Object.assign({}, defaultConfig, { port: process.env.DB_PORT ? parseInt(process.env.DB_PORT, 10) : 1433 });
                attempts.push('port');
                return await tryConnect(cfgPort);
            } catch (errPort) {
                console.error('Todos los intentos de conexión han fallado. Intentos:', attempts.join(', '));
                console.error('Error final al conectar a la base de datos:', errPort.message || errPort);
                throw errPort;
            }
        }
    }
};

module.exports = conexion;

