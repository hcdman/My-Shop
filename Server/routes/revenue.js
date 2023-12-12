const express = require("express");
const revenueController = require("../controllers/revenue.Controllers");
const router = express.Router();

router.post("/week", revenueController.getRevenueWeek);
router.post("/year", revenueController.getRevenueYear);
router.post("/month", revenueController.getRevenueMonth);

module.exports = router;
