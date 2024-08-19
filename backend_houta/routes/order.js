const router = require('express').Router();
const orderController =require('../controllers/orderController');
const {verifyTokenAndAuthorization} = require('../middleware/verifyToken')

// protected route : User should be authorized to perform those actions
router.post("/", verifyTokenAndAuthorization, orderController.placeOrder);
router.get("/", verifyTokenAndAuthorization, orderController.getUserOrders);


module.exports = router;