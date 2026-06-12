const db = require('../config/database');

class UsuarioModel {

    static async crearUsuario(nombre, email, password) {
        const basedatos = await db();
        await basedatos.request()
            .input('nombre', nombre)
            .input('email', email)
            .input('password', password)
            .query(`
                INSERT INTO Usuario (Nombre, Email, Password)
                VALUES (@nombre, @email, @password)
            `);
    }

    static async buscarPorEmail(email) {
        const basedatos = await db();
        const resultado = await basedatos.request()
            .input('email', email)
            .query(`
                SELECT Id, Nombre, Email, Password
                FROM Usuario
                WHERE Email = @email
            `);
        return resultado.recordset[0] || null;
    }
}

module.exports = UsuarioModel;
