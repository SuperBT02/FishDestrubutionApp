const mongoose = require ('mongoose');
const orderItemSchema = new mongoose.Schema({
    offerId:{type: mongoose.Schema.Types.ObjectId, ref: 'Offer'},
    quantity: {type: Number, default: 1},
    price:{type:Number, required: true},
    instructions:{type: String, default: ''}

});


const OrderSchema = new mongoose.Schema({
    userId: {type: mongoose.Schema.Types.ObjectId, ref: 'User'},
    orderItems: [orderItemSchema],
    orderTotal:{type: Number, required: true},
    orderFee:{type: Number, required: true},
    grandTotal:{type: Number, required: true},
    deliveryAddress: {type: mongoose.Schema.Types.ObjectId, ref: 'Address', required: true},
    vendorAddress: {type: String, required: true},
    paymentMethod: {type: String, required: true},
    paymentStatus: {type: String, default: 'Pending', enum:['Pending', 'Completed', 'Failed']},
    orderStatus: {type: String, default: 'Placed', enum: ['Placed', 'Preparing', 'Manual' , 'Delivered', 'Cancelled', 'Ready', 'Out_for_Delivery']},
    vendorId: {type: mongoose.Schema.Types.ObjectId, ref: 'Vendor', required: 'true'},
    vendorCoords:{Number},
    recipientCoords:{Number},
    rating: {type: Number, min:1 , max:5, default:3},
    feedback:{type: String}

},{timestamps: true});


exports.module = mongoose.model('Order', OrderSchema);