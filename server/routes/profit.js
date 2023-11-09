const express = require("express");
const profitController = require("../controllers/profit.Controllers");
const router = express.Router();

router.get("/week", profitController.getProfitWeek);
router.get("/year", profitController.getProfitYear);
router.get("/month", profitController.getProfitMonth);

module.exports = router;
