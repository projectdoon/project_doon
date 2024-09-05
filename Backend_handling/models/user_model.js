const mongoose=require('mongoose');
const db = require('../config/db');

const { Schema } =mongoose;

const userSchema=new Schema({

    phoneNo:{
        type:Number,
        required:true,
        unique:true
    },
    firstName:{
        type:String,
        required:true,
    },
    lastName:{
        type:String,
        required:true,
    },
    Lat:{
        type:Number,
        required:true,
    },
    Long:{
        type:Number,
        required:true,
    },

    email:{
        type:String,
        lowercase:true,
        required:true,
        unique:true

    },

});

const UserModel =db.model('user',userSchema);

module.exports=UserModel;