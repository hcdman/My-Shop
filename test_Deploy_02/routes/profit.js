const express = require("express");
const profitController = require("../controllers/profit.Controllers");
const router = express.Router();

router.post("/week", profitController.getProfitWeek);
router.post("/year", profitController.getProfitYear);
router.post("/month", profitController.getProfitMonth);

module.exports = router;
