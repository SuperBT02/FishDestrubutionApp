const mongoose = require('mongoose');
const CartSchema =new mongoose.Schema({
    userId:{type:mongoose.Schema.Types.ObjectId, ref: 'User',required: true},
    productId:{type:mongoose.Schema.Types.ObjectId, ref: 'Offer', required: true},
    quantity:{type:Number, required:true,default:1},
    totalPrice:{type:Number,required:true},},
    {timestamps:true});

module.exports = mongoose.model('Cart',CartSchema);