const mysql = require('mysql');
const bcrypt = require('bcrypt');


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

async function registerAdmin(adminName,adminEmail, password){
    let query = "INSERT INTO users (username, email, password, role_id) VALUES (?, ?, ?, ?)";

    var hashedPassword = await bcrypt.hash(password,10);

    conn.query(query, [adminName, adminEmail, hashedPassword,1], function(err,results){
        if(err) throw err;
        if(results!=null){
        } 
    });


}

registerAdmin("admin", "admin@aston.ac.uk", "TeamProject17EWAMSHA?");