const UserServices = require("../services/user_services");

exports.register = async (req, res, next) => {
    try {
        const { phoneNo, firstName, lastName, Lat, Long, email } = req.body;

        const successRes = await UserServices.registerUser(phoneNo, firstName, lastName, Lat, Long, email);

       

        res.json({ status: true, success: "user registered successfully" });



    } catch (error) {

    }
}

exports.login = async (req, res, next) => {
    try {
        const { phoneNo } = req.body;
        const user = await UserServices.checkUser(phoneNo);

        if (!user) {

            res.status(200).json({ status: false, message: 'user not found' });

        }

        let tokenData = { _id: user._id, phoneNo: user.phoneNo, firstName: user.firstName };

        const token = await UserServices.generateToken(tokenData, 'secretkey', '1h');

        res.status(200).json({ status: true, token: token });



    } catch (error) {

    }
}