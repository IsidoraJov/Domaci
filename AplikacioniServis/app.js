const express = require('express');
const app = express();
const jwt = require('jsonwebtoken');
const msgs = require('./routes/messages');
const path = require('path');
app.use(express.static(path.join(__dirname, 'static')));

app.use('/admin',msgs);
require('dotenv').config();

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
  
    if (token == null) return res.redirect('/login');
     
    jwt.verify(token, process.env.ACCESS_TOKEN_SECRET, (err, user) => {
       
    
        if (err) return res.redirect('/login');
    
    
        next();
    });
}

app.get('/login',(req, res) => {
    res.sendFile('login.html', { root: './static' });
});



app.get('/home', authToken, (req, res) => {
   
    res.sendFile('index.html', { root: './static' });
});
app.listen(9000);