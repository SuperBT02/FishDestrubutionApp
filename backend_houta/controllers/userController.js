const User = require('../models/User');
const jwt = require('jsonwebtoken');

module.exports = {
    getUser: async(req, res) =>{
        try {
            const user = await User.findById(req.user.id)

            const{password, __v, createdAt, ...userData} = user._doc;
            res.status(200).json(userData);
        } catch (error) {
            res.status(500).json({status:false, message: error.message});
        }
    },

    verifyAccount : async(req, res) => {
        const userOtp = req.params.otp;
        console.debug(userOtp);
        try {
            const user = await User.findById(req.user.id);

            if(!user){
                return res.status(400).json({status:false,message:"User not found"})
            }
            if(userOtp === user.otp){
                user.verification = true;
                user.otp = "none";
                await user.save();
                const userToken = jwt.sign({
                    id: user._id,
                    userType: user.userType,
                    email: user.email,
                }, process.env.JWT_SECRET,{expiresIn: "50 days"});

                const {password, __v, otp, createdAt, ...others} = user._doc;
                res.status(200).json({...others, userToken});
            }
            else{
                res.status(400).json({status:false,message:"Otp Failed"})
            }
        } catch (error) {
            res.status(500).json({status:false,message: error.message})
        }
    },

    verifyPhone : async(req, res) => {
        const Phone = req.params.phone;
        console.debug(Phone);
        try {
            const user = await User.findById(req.user.id);
            // phone = await user.phone;

            if(!user){
                return res.status(400).json({status:false,message:"User not found"})
            }
             user.phone = Phone;
            user.phoneVerification = true;
            
               // phone == Phone;
                console.debug(user.phone);
                

                await user.save();

                const userToken = jwt.sign({
                    id: user._id,
                    userType: user.userType,
                    email: user.email,
                }, process.env.JWT_SECRET,{expiresIn: "50 days"});

                const {password, __v, otp, createdAt, ...others} = user._doc;
                res.status(200).json({...others, userToken});
            
        } catch (error) {
            res.status(500).json({status:false,message: error.message})
        }
    },
    deleteUser: async(req, res) =>{

        try {
            await User.findByIdAndDelete(req.user.id)
            res.status(200).json({status:true, message: "User successfully deleted"});
        } catch (error) {
            res.status(500).json({status:false, message: error.message});
        }
    },
}