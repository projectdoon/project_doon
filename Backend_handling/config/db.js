const mongoose = require('mongoose');

const connection = mongoose.createConnection('mongodb+srv://Akhil:5GMuG738PbrHMfzr@mydoon.ksbtsax.mongodb.net/MyDatabase?retryWrites=true&w=majority&appName=MyDoon').on('open',()=>{

    console.log('mongodb connected');
    

}).on('error',()=>{
    console.log('mongodb connection error');
    
});


module.exports = connection;  