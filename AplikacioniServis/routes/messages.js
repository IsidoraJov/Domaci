const express = require('express');
const jwt = require('jsonwebtoken');


const route = express.Router();
route.use(express.json());
route.use(express.urlencoded({ extended: true }));

function getCookies(req) {
    if (req.headers.cookie == null) return {};

    const rawCookies = req.headers.cookie.split('; ');
    const parsedCookies = {};

     rawCookies.forEach( rawCookie => {
        const parsedCookie = rawCookie.split('=');
        parsedCookies[parsedCookie[0]] = parsedCookie[1];
    });

    return parsedCookies;
};

function authToken(req, res, next) {
    const cookies = getCookies(req);
    const token = cookies['token'];

    if (token == null) return res.redirect(301, '/login');

    jwt.verify(token, process.env.ACCESS_TOKEN_SECRET, (err, user) => {


        if (err) return res.redirect(301, '/login');


        next();
    });
}


route.get('/addUser',(req, res) => {
    res.sendFile('register.html', { root: './static' });
});

route.get('/addKurs',(req, res) => {
    res.sendFile('addKurs.html', { root: './static' });
});

route.get('/addRadnoMesto',(req, res) => {
    res.sendFile('addRadnoMesto.html', { root: './static' });
});

route.get('/addIstorijaPolaganja',(req, res) => {
    res.sendFile('addIstorija.html', { root: './static' });
});


route.get('/kurs',(req, res) => {
    res.sendFile('kurs.html', { root: './static' });
});
route.get('/radnoMesto',(req, res) => {
    res.sendFile('radnaMesta.html', { root: './static' });
});
route.get('/istorijaPolaganja',(req, res) => {
    res.sendFile('istorija.html', { root: './static' });
});


module.exports = route;