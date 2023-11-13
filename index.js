var mysql = require('mysql');
var express = require('express');
var cors = require('cors');
var app = express();
app.set('view engine', 'ejs');
app.use(express.static(__dirname + '/public'));
app.use(cors({
    origin:'http://127.0.0.1:8000'
}));

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
    var sql = "SELECT * FROM Wines";
    conn.query(sql, function(err,results,fields){
        if (err) throw err;
        let wines = results;
        let data = {
            wines:wines
        };
        return res.render('pages/indexProduct',{
            data:data
        });
    });
});

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




