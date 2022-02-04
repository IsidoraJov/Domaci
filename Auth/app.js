const express = require('express')
const bodyParser = require('body-parser')
const mysql = require('mysql')
//const Joi = require('joi');
const cors = require('cors');
const { json } = require('body-parser');
const app = express()
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
require('dotenv').config();

var corsOptions = {
    origin: 'http://127.0.0.1:9000',
    optionsSuccessStatus: 200
}

app.use(express.json());
app.use(cors(corsOptions));

const pool = mysql.createPool({
    connectionLimit: 100,
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'skript',
    logging: false
})


app.post('/login', (req, res) => {

    pool.getConnection((err, connection) => {

        if (err) throw err

        connection.query('SELECT * FROM app_user WHERE email = ?', [req.body.email], (err, rows) => {

            if (!err) {

                if (bcrypt.compareSync(req.body.password, rows[0].password)) {

                    const obj = {
                        id: rows[0].id,
                        username: rows[0].username
                    };

                    if(rows[0].id_rola==1 || rows[0].id_rola==2 ){

                        const token = jwt.sign(obj, process.env.ACCESS_TOKEN_SECRET);
                    console.log(obj)
                    res.json({ token: token });
                       
                    }else{
                         res.status(400).json({ msg: "Niste admin ili moderator" });
                    }

                    


                } else {
                    res.status(400).json({ msg: "Invalid password" });
                }
            } else {

                res.status(400).json({ msg: "Invalid credentials" });
                
            }


        })
        connection.release()
    })
});

app.post('/registration', (req, res) => {

    pool.getConnection((err, connection) => {

        
        Joi.validate(req.body, sema, (err, result) => {

            if (err) {
                res.send(err);
            } else {
            console.log("prosao joi")
                pool.getConnection((err, connection) => {
                    if (err) throw err
                    const params = req.body
                    bcrypt.genSalt(saltRounds, function (err, salt) {
                        bcrypt.hash(req.body.password, salt, function (err, hash) {
                            params.password = hash;
    
                            connection.query('INSERT INTO app_user SET ?', params, (err, rows) => {
                                connection.release() // return the connection to pool
                                if (!err) {

                                    const obj = {
                                        id: rows[0].id,
                                        username: rows[0].username
                                    };
                
                                    const token = jwt.sign(obj, process.env.ACCESS_TOKEN_SECRET);
                                  
                                    res.json({ token: token });
                
                                } else {
                                    res.json({ msg: "Korisnik vec postoji" })
                                }
    
    
                            })
                        })
    
                    });
                });
    
            }
    
        })
    
        connection.release()
    })
});




app.listen(8087);