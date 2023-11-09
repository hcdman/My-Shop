const express = require("express");
const revenueController = require("../controllers/revenue.Controllers");
const router = express.Router();

router.get("/week", revenueController.getRevenueWeek);
router.get("/year", revenueController.getRevenueYear);
router.get("/month", revenueController.getRevenueMonth);

module.exports = router;
