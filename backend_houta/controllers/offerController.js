const Offer = require('../models/Offer');
const Vendor = require('../models/Vendor');

module.exports = {
    AddOffer: async (req, res) => {
        const { title, offerTags, category, code, vendor, description, time, price, quantity,offerDishes, imageUrl } = req.body;
        if (!title || !offerTags || !imageUrl || !category || !vendor || !code || !description
            || !time || !price || !quantity || !offerDishes) {
            return res.status(400).json({ status: false, message: "You have a missing field" });
        }
        try {
            const newOffer = await new Offer(req.body);
            await newOffer.save();
          const vendorData = await Vendor.findOne({_id:vendor});
          if (!vendorData) {
            return res.status(404).json({ status: false, message: "Vendor not found" });
        }
        vendorData.offers.push(newOffer._id); // Assuming offerList is an array of offer IDs in the Vendor model
        await vendorData.save();
        return res.status(201).json({ status: true, message: "Offer added successfully!" });
            
        } catch (error) {
            return res.status(500).json({ status: true, message: error.message });
        }
    },
    getOfferById: async (req, res) => {
        const id = req.params.id;
        try {
            const offer = await Offer.findById(id);
            return res.status(200).json(food);
        } catch (error) {
            return res.status(500).json({ status: false, message: error.message });
        }
    },
    getRandomOffer: async (req, res) => {

        //check if the code was given in the params
        try {
            let randomOfferList=[];
            if (req.params.code) {
                randomOfferList = await Offer.aggregate([
                    { $match: { code: req.params.code } },
                    { $sample: { size: 3 } },
                   // { $project: { __v: 0 } }
                ]);
            }
            // if no code was provided in params and no offer matches
            if (!randomOfferList.length) {
                randomOfferList = await Offer.aggregate([
                    { $sample: { size: 5 } },
                   // { $project: { __v: 0 } }
                ]);
            }
            //Respond with the results
            if(randomOfferList.length){
                res.status(200).json(randomOfferList);
            }
            else{
                res.status(404).json({status:false,message:'No offer found'});
            }
        } catch (error) {
            res.status(500).json({ status: false, message: error.message });
        }



    },
    // Restaurant Menu
    getOfferByVendor: async (req, res) => {
        const id = req.params.id;
       // console.log(req.params.id);
        try {
            const offer = await Offer.find({ vendor: id });
            res.status(200).json(offer);
        } catch (error) {
            res.status(500).json({ status: false, message: error.message });
        }

    },

    // la7tha 9as charg
    //mrigl
    // get offer by vendor name
    getOfferByVendorName: async (req, res) => {
        console.log("running get offer by name");

        const name = req.params.name;
        console.log(name);
        try {
            const vendor = await Vendor.findOne({owner:name})
           // console.log(vendor)
            console.log(vendor._id)

            const offer = await Offer.find({vendor: vendor._id});
            res.status(200).json(offer);
        } catch (error) {
            res.status(500).json({ status: false, message: error.message });
        }

    },
    getOffersByCategoryAndCode: async (req, res) => {
        const { category, code } = req.params;
        try {
            const offers = await Offer.aggregate([
                { $match: { category: category, code: code, isAvailable: true } },
              //  { $project: { __v } }
            ]);
           // if (offers.length == 0) {
               // return res.status(200).json({ status: false, message: "No Offer found" });
           // }
            return res.status(200).json(offers);
        } catch (error) {
            res.status(500).json({ status: false, message: error.message });
        }
    },
    getAllOfferByCode: async(req, res) =>{
        const code= req.params.code;

        try {
            const offerList = await Offer.find({code:code});
            return res.status(200).json(offerList)
        } catch (error) {
            return res.status(500).json({status: false, message: error.message})

        }
    },

    searchOffers: async (req, res) => {
        const search = req.params.search;

        try {
            const results = await Offer.aggregate([
                {
                    $search: {
                        index: "offers",
                        text: {
                            query: search,
                            path: {
                                wildcard: "*"
                            }
                        }
                    }
                }
            ])
            res.status(200).json(results);
        } catch (error) {
            res.status(500).json({ status: false, message: error.message });
        }
    },
    getRandomOffersByCategoryAndCode: async (req, res) => {
        const { category, code } = req.params;

        try {
            let offers;
            offers = await Offer.aggregate([
                { $match: { category: category, code: code, isAvailable: true } },
                { $sample: { size: 10 } },
              //  { $project: { __v: 0 } }
            ])
            if (!offers || offers.length == 0) {
                offers = await Offer.aggregate([
                    { $match: { code: code, isAvailable: true } },
                    { $sample: { size: 10 } },
                ])
            }
            else if (!offers || offers.length === 0) {
                offers = await Offer.aggregate([
                    { $match: { isAvailable: true } },
                    { $sample: { size: 10 } },
                ])
            }
            res.status(200).json(offers);
        } catch (error) {
            res.status(500).json({ status: false, message: error.message });
        }


    }
};