const router = require('express').Router();
const cartController =require('../controllers/cartController');
const {verifyTokenAndAuthorization} = require('../middleware/verifyToken')

// protected route : User should be authorized to perform those actions
router.post("/", verifyTokenAndAuthorization, cartController.addProductToCart);
router.get("/decrement/:id", verifyTokenAndAuthorization, cartController.decrementProductQty);
router.delete("/:id", verifyTokenAndAuthorization, cartController.removeCartItem);
router.get("/", verifyTokenAndAuthorization, cartController.getCart);
router.get("/count", verifyTokenAndAuthorization, cartController.getCartCount);
router.post("/confirm/:userId", cartController.confirmCart);



module.exports = router;