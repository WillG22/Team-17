var mysql = require('mysql');
var express = require('express');
var session = require('express-session');
var cors = require('cors');
var nodemailer = require('nodemailer');
var bcrypt = require('bcrypt');
const { urlencoded } = require('body-parser');
var app = express();
app.set('view engine', 'ejs');
app.use(express.static(__dirname + '/public'));
app.use(cors({
    origin:'http://127.0.0.1:8000'
}));
app.use(express.json());
app.use(urlencoded({extended:true}))
app.use(session({
    secret:'kjfdegkfgekfgekfghekfbegbglegbkgb',
    resave:false,
    saveUninitialized:true,
}))

var transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
        user: 'lemondeduvin2024@gmail.com',
        pass: 'nlralpaxrhztmxcr' 
    }
})

var server = app.listen(8000,"127.0.0.1",function(){
    var port = server.address().port;
    var address = server.address().address;

    console.log("server listening at http://%s:%s", address,port);
});

var conn = mysql.createConnection({
    host:"localhost",
    user:"TeamProject17",
    password:"TeamProject17EWAMSHA?",
    database:"WineShop"
});

conn.connect(function(err){
    if(err) throw err;
    console.log("connected to the database");
});



app.get("/indexProduct", function(req,res){
    let username = 'Guest';
    var sql = "SELECT * FROM Wines";
    if(req.session.userId != undefined){
        const id = req.session.userId;
        console.log(id);
        var userQuery = "SELECT * FROM users WHERE id= ?";
        conn.query(userQuery, [id], (err, results, fields)=>{
            if(err) throw err;
            if(results.length > 0){
                username = results[0].username;
            }
        })
    }
    conn.query(sql, function(err,results,fields){
        if (err) throw err;
        let wines = results;
        let data = {
            wines:wines,
            currentName:username
        };
        return res.render('pages/indexProduct',{
            data:data
        });
    });
});

app.get('/loginPage', function(req,res){
    return res.render('pages/loginPage');
})

app.get('/checkout', function(req,res){
    return res.render('pages/checkout');
})

app.get("/categories", function(req,res){
    var sql = "SELECT * FROM categories";
    conn.query(sql, function(err,result,fields){
        if(err) throw err;
        return res.json({
            categories:result
        });
    });
});

app.get('/categoryReq', function(req, res){
    var categoryName = req.query.category;
    var sql = "SELECT * FROM Wines WHERE Categories=?";
    if(categoryName != "Default"){
        conn.query(sql, [categoryName], function(err, results, fields){
            if(err) throw err;
            let wines = results;
            let data = {
                wines:wines
            };
            return res.render('pages/indexProduct', {
                data:data
            });
        });
    }else{
       return res.redirect('/indexProduct');
    }
});

app.get('/price', function(req,res){
    var price = req.query.price;
    if(price == 'Lowest'){
        var sql = "SELECT * FROM Wines ORDER BY Price asc";
        conn.query(sql, function(err,results,fields){
            if(err) throw err;
            let wines = results;
            let data = {
                wines:wines
            };
            return res.render('pages/indexProduct', {
                data:data
            });
        })
    }else{
        var sql = "SELECT * FROM Wines ORDER BY Price desc";
        conn.query(sql, function(err,results,fields){
            if(err) throw err;
            let wines = results;
            let data = {
                wines:wines
            };
            return res.render('pages/indexProduct', {
                data:data
            });
        })
    }
})

app.get('/name', (req,res)=>{
    console.log(req.query);
    let name = req.query.search;
    var sql = "SELECT * FROM Wines WHERE Name=?";
        conn.query(sql, [name], function(err,results,fields){
            if(err) throw err;
            let wines = results;
            let data = {
                wines:wines
            };
            return res.render('pages/indexProduct', {
                data:data
            });
        })
})

const checkPassword = (psw, pswRepeat)=>{
    if(psw != pswRepeat) throw new Error("Passwords do not match");
}

const checkAccount = (email) =>{
    let sql = "SELECT * FROM users WHERE email = ?";
    conn.query(sql, [email], (err,results,fields)=>{
        if(results > 0){
            throw new Error("You have already got an account");
        }
    })
}

app.post('/register', async function(req,res){
    const {username,email,psw,pswRepeat} = req.body;

    try {
        checkPassword(psw, pswRepeat);
        checkAccount(email);
        var hashedPassword = await bcrypt.hash(psw, 10); 
        let sql = "INSERT INTO users (username, email, password, role_id) VALUES (?, ?, ?, ?)";
        conn.query(sql, [username, email, hashedPassword, 2], function(err, result){
            if (err) {
                console.error("Error executing query: ", sql);
                console.error("Values: ", username, email, hashedPassword, 2);
                console.error("SQL Error: ", err);
                throw err;
            }
            console.log(result);
            sql = "SELECT * FROM users WHERE email= ?";
            conn.query(sql, [email], (err, results, fields) => {
                if (err) {
                    console.error("Error executing query: ", sql);
                    console.error("Values: ", email);
                    console.error("SQL Error: ", err);
                    throw err;
                }
                if(results.length > 0){
                    req.session.userid = results[0].id;
                    return res.status(200).redirect('/indexProduct');
                }
            });
        });
    } catch (error) {
        console.error("Caught Error: ", error);
        // Error handling logic
    }

});

app.get('/contact', function(req,res){
    return res.render('pages/contactus');
});

app.post('/login', function(req,res){
    const {email,psw} = req.body;

    var sql = "SELECT * FROM users WHERE email= ?";
    conn.query(sql, [email], async function(err,results,fields){
        if(results.length > 0){
            var isCorrect = await bcrypt.compare(psw, results[0].password);
            console.log(email,psw);
            if(isCorrect){
                req.session.id = results[0].id;
                req.session.userId = results[0].id;
                return res.status(200).redirect('/indexProduct');
            }else{
                data = {
                    error: 'Email or password incorrect'
                };
                return res.status(403).render('pages/loginPage', {
                    data:data
                });
            }
        }
    })
});

app.post('/send-mail', function(req, res) {
    const { name, email, subject, message } = req.body;
    const mailOptions = {
        from: email,
        to: 'lemondeduvin2024@gmail.com',
        subject: subject,
        html: message
    };

    transporter.sendMail(mailOptions, (err, info) => {
        if (err) {
            console.error('Error sending email', err);
            res.status(500).send('Error sending email');
            return;
        }
        console.log('Message sent: %s', info.messageId);
        const sql = "INSERT INTO contactus (name, Email, subject, message) VALUES (?, ?, ?, ?)";
        conn.query(sql, [name, email, subject, message], (err, result) => {
            if (err) {
                console.error('Error inserting record into database', err);
                res.status(500).send('Error inserting record into database');
                return;
            }
            console.log("1 record inserted");
            res.redirect('/contact');
        });
    });
});


app.post('/logout', function(req,res){
    req.session.destroy();
    res.redirect('/indexProduct');
})



