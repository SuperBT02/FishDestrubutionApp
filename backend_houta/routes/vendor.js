const router = require('express').Router();
const vendorController =require('../controllers/vendorController');
const {verifyTokenAndAuthorization} = require('../middleware/verifyToken')


router.post("/", verifyTokenAndAuthorization, vendorController.addVendor);

router.get("/:code", vendorController.getRandomVendors);

router.get("/all/:code", vendorController.getAllNearByVendors);

router.get("/byId/:id", vendorController.getVendorById);

module.exports = router;