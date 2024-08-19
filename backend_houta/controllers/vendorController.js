const Vendor = require('../models/Vendor');

module.exports = {
    addVendor: async (req, res) => {
        const { title, time, imageUrl, owner, code, logoUrl, coords} = req.body;
        if (!title ||!time ||!imageUrl ||!owner ||!code||!logoUrl||!coords
            ||!coords.latitude||!coords.longitude||!coords.address||!coords.title) {
            return res.status(400).json({ status: false, message: "you have a missing field" });
        }
        try {
            const newVendor = new Vendor(req.body);
            await newVendor.save();
            res.status(201).json({status: true, message: "Vendor has been succesfully!"});
        } catch (error) {
            res.status(500).json({ status: false, message: error.message });
        }
     },
    getVendorById: async (req, res) => {
        const id = req.params.id;
        try {
            const vendor = await Vendor.findById(id)
            res.status(200).json(vendor);
        } catch (error) {
            res.status(500).json({ status: false, message: error.message });
        }
    },
    getRandomVendors: async (req, res) => {
        const code = req.params.code;
        try {
            let randomVendor = [];
            console.log(code);

            if (code) {
                randomVendor =await  Vendor.aggregate([
                    { $match: { code: code, isAvailable: true}},
                    { $sample: { size: 5 } },
                    { $project: { __v: 0 } }
                ]);
                
            }
            if (randomVendor.length == 0) {
                randomVendor = await Vendor.aggregate([
                    { $match: { isAvailable: true } },
                    { $sample: { size: 5 } },
                    { $project: { __v: 0 } }
                ]);
            }
            res.status(200).json(randomVendor);
        } catch (error) {
            res.status(500).json({ status: false, message: error.message });
        }
    },
    getAllNearByVendors: async (req, res) => {
        const code = req.params.code;
        try {
            let getAllNearByVendors = [];

            if (code) {
                getAllNearByVendors =await  Vendor.aggregate([
                    { $match: { code: code, isAvailable: true } },
                    { $sample: { size: 5 } },
                    { $project: { __v: 0 } }
                ]);
            }
            if (getAllNearByVendors.length == 0) {
                getAllNearByVendors = await Vendor.aggregate([
                    { $match: { isAvailable: true } },
                    { $project: { __v: 0 } }
                ]);
            }
            res.status(200).json(getAllNearByVendors);
        } catch (error) {
            res.status(500).json({ status: false, message: error.message });
        }
    },
}