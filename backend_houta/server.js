const express = require('express')
const app = express()
const dotenv = require('dotenv');
const mongoose = require('mongoose');
const CategoryRoute = require("./routes/category");
const VendorRoute = require("./routes/vendor");
const OfferRoute = require("./routes/offer");
const RatingRoute = require("./routes/rating");
const AuthRoute = require("./routes/auth");
const UserRoute = require("./routes/user");
const AddressRoute = require("./routes/address");
const CartRoute = require("./routes/cart");
const OrderRoute = require("./routes/order");
dotenv.config();

mongoose.connect(process.env.MONGOURL).then(()=>console.log('Houta connected to database')).catch((err) =>console.log(err));



app.use(express.json());
app.use(express.urlencoded({extended: true}));
app.use("/",AuthRoute);
app.use("/api/users",UserRoute);
app.use("/api/category",CategoryRoute);
app.use("/api/vendor",VendorRoute);
app.use("/api/offers",OfferRoute);
app.use("/api/rating",RatingRoute);
app.use("/api/address",AddressRoute);
app.use("/api/cart",CartRoute);
app.use("/api/orders",OrderRoute);



app.listen(process.env.PORT || 6013, () => console.log(`Houta Backend is runnning on port : ${process.env.PORT}`))