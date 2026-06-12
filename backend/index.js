const express = require('express');
const path = require('path');
const app = express();
const router = require('./router/router');

app.use(express.json());
app.use((req, res, next) => {
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET,POST,PUT,DELETE,OPTIONS');
    res.setHeader('Access-Control-Allow-Headers', 'Content-Type');
    if (req.method === 'OPTIONS') {
        return res.sendStatus(200);
    }
    next();
});

app.use('/api', router);
app.use(express.static(path.join(__dirname, '../frontend')));
app.use('/app.js', express.static(path.join(__dirname, '../app.js')));

app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, '../frontend/index.html'));
});

app.listen(3000, () => {
    console.log('Server running on http://localhost:3000');
});
