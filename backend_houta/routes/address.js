const router = require('express').Router();
const addressController =require('../controllers/addressController');
const {verifyTokenAndAuthorization} = require('../middleware/verifyToken')

// protected route : User should be authorized to perform those actions
router.post("/", verifyTokenAndAuthorization, addressController.addAddress);
router.get("/default", verifyTokenAndAuthorization, addressController.getDefaultAddress);
router.get("/all", verifyTokenAndAuthorization, addressController.getAddresses);
router.delete("/:id", verifyTokenAndAuthorization, addressController.deleteAddress);
router.patch("/default/:id", verifyTokenAndAuthorization, addressController.setAddressDefault);

module.exports = router;