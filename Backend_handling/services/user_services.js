const UserModel = require("../models/user_model");

class UserServices{
    static async registerUser(phoneNo,firstName,lastName,Lat,Long,email){
        try {

            const createUser = new UserModel({phoneNo,firstName,lastName,Lat,Long,email});
            return await createUser.save();

        } catch (error) {

            throw error;
            
        }
    }
}

module.exports=UserServices;