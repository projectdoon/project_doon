const UserModel = require("../models/user_model");
const jwt = require('jsonwebtoken');

class UserServices{
    static async registerUser(phoneNo,firstName,lastName,Lat,Long,email){
        try {

            const createUser = new UserModel({phoneNo,firstName,lastName,Lat,Long,email});
            return await createUser.save();

        } catch (error) {

            throw error;
            
        }
    }
    static async checkUser(phoneNo){
        try {
            return await UserModel.findOne({phoneNo});
        } catch (error) {
            
        }
    }


    static async generateToken(tokenData,secretKey,jwt_expire){

        return jwt.sign(tokenData,secretKey,{expiresIn:jwt_expire});

    }
}

module.exports=UserServices;