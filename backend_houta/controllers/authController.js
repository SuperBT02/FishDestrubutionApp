const User = require("../models/User");
const CryptoJs = require('crypto-js');
const jwt = require('jsonwebtoken');
const generateOtp = require("../utils/otp_generator");
const sendMail = require("../utils/smtp_function");
module.exports = {
    createUser: async (req, res) => {
        const emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;

        if (!emailRegex.test(req.body.email)) {
            return res.status(400).json({ status: false, message: "Email is not valid" });
        }
        const minPasswordLength = 8;

        if (req.body.password < minPasswordLength) {
            return res.status(400).json({ status: false, message: "The password should be at least" + minPasswordLength + "characters long" });
        }

        try {
            const emailExists = await User.findOne({ email: req.body.email });
            if (emailExists) {
                return res.status(400).json({ status: false, message: "Email already exists" });
            }
            //Generating OTP
            const otp = generateOtp();
            const newUser = new User({
                username: req.body.username,
                userType: "Client",
                email: req.body.email,
                password: CryptoJs.AES.encrypt(req.body.password, process.env.SECRET).toString(),
                otp: otp,
            })
            //SAVING THE USER
            await newUser.save();
            //SEND OTP TO EMAIL
            sendMail(newUser.email, otp);
            res.status(201).json({ status: true, message: "User successfully created ." });


        } catch (error) {
            res.status(500).json({ status: false, message: error.message });
        }
    },
    loginUser: async (req, res) => {
        const emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;

        if (!emailRegex.test(req.body.email)) {
            return res.status(400).json({ status: false, message: "Email is not valid" });
        }
        const minPasswordLength = 8;

        if (req.body.password < minPasswordLength) {
            return res.status(400).json({ status: false, message: "The password should be at least" + minPasswordLength + "characters long" });
        }

        try {
            const user = await User.findOne({ email: req.body.email });
            if (!user) {
                return res.status(400).json({ status: false, message: "User not found" });
            }
            const decryptedPassword = CryptoJs.AES.decrypt(user.password, process.env.SECRET);
            const depassword = decryptedPassword.toString(CryptoJs.enc.Utf8);
            if (depassword !== req.body.password) {
                return res.status(400).json({ status: false, message: "Wrong Password " });
            }
            //USER TOKEN (AND DURATION)
            const userToken = jwt.sign({
                id: user._id,
                userType: user.userType,
                email: user.email,
            }, process.env.JWT_SECRET,{expiresIn: "300 days"});
            const{password,createdAt,updatedAt,__v,otp,...others}= user._doc;
            res.status(200).json({...others, userToken});
        } catch (error) {
            res.status(500).json({status: false, message:"error.message"});
        }
    },
}