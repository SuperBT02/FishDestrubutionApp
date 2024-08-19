const mongoose = require('mongoose');

const OfferSchema = new mongoose.Schema({
    title :{type:String, required:true},
    time :{type:String, required:true},
    imageUrl :{type:String, required:true},
    offerTags :{type:Array, required:true},
    category :{type:String,required:true},
    offerType :{type:Array, required:true},
    code :{type:String, required:true},
    isAvailable :{type:Boolean, required:true},
    vendor:{type:mongoose.Schema.Types.ObjectId,required:true},
    rating :{type:Number, min:1,max:5,defaul:3},
    ratingCount:{type:String,default:"267"},
    description:{type:String, required:true},
    offerDishes:{type:Array, required:true},
    quantity:{type:Number, required:true},
    price:{type:Number,required: true}


});

module.exports = mongoose.model('Offer',OfferSchema);