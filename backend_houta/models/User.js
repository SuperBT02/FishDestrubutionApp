const mongoose = require('mongoose');

const UserSchema = new mongoose.Schema({
    username :{type:String, required:true},
    email :{type:String, required:true, unique:true},
    otp :{type:String, required:false, default:"none"},
    fcm :{type:String, required:false, default:"none"},
    password :{type:String, required:true},
    verification :{type:Boolean, default:false},
    phone :{type:String ,required:true,default:"01234568"},
    phoneVerification :{type:Boolean, default:false},
    address:{
        type: mongoose.Schema.Types.ObjectId,
        ref:"Address",
        required: false,
    },
    userType: {type:String, required: true, default:"Client",enum: ['Client','Admin','Vendor']},
        profile:{type: String, default:'https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?size=338&ext=jpg&ga=GA1.1.1395880969.1709769600&semt=ais'},
        
    },  
{timestamps:true});

module.exports = mongoose.model('User',UserSchema);