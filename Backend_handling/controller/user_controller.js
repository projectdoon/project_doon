const UserServices = require("../services/user_services");

exports.register=async(req,res,next)=>{
    try {
        const{phoneNo,firstName,lastName,Lat,Long,email}=req.body;

        const successRes=await UserServices.registerUser(phoneNo,firstName,lastName,Lat,Long,email);

        res.json({ status:true,success:"user registered successfully"});

    
        
    } catch (error) {
        
    }
}