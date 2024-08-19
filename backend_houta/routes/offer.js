const router = require('express').Router();
const offerController =require('../controllers/offerController');
const {verifyVendor} = require('../middleware/verifyToken')

router.post("/", verifyVendor, offerController.AddOffer);
router.get("/recommendation/:code", offerController.getRandomOffer);
router.get("/:id", offerController.getOfferById);
router.get("/byCode/:code", offerController.getAllOfferByCode);

router.get("/search/:search", offerController.searchOffers);
router.get("/:category/:code", offerController.getOffersByCategoryAndCode);
router.get("/vendor/offers/:name", offerController.getOfferByVendorName);

router.get("/vendor/:id", offerController.getOfferByVendor);


module.exports = router;