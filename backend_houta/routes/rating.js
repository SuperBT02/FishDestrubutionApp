const router = require('express').Router();
const ratingController =require('../controllers/ratingController');
const {verifyTokenAndAuthorization} = require('../middleware/verifyToken')

// protected route : User should be authorized to perform those actions
router.post("/", verifyTokenAndAuthorization, ratingController.addRating);
router.get("/", verifyTokenAndAuthorization, ratingController.checkUserRating);


module.exports = router;