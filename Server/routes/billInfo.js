const express = require("express");
const billInfoController = require("../controllers/billInfo.Controllers");
const router = express.Router();

router.post("/add", billInfoController.addNew);
router.get("/getall", billInfoController.getAllBillInfo);
router.get("/get/:id", billInfoController.getBillInfo);
router.delete("/delete/:id", billInfoController.delete);

module.exports = router;
