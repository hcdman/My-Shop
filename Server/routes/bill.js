const express = require("express");
const billController = require("../controllers/bill.Controllers");
const router = express.Router();

router.post("/add", billController.addNew);
router.get("/getall", billController.getAllBill);
router.get("/get/:id", billController.getBill);
router.delete("/delete/:id", billController.delete);
router.put("/update/:id", billController.update);
router.get("/latest", billController.latest);
router.get("/currentWeek", billController.currentWeek);
router.get("/currentMonth", billController.currentMonth);
router.get("/todayMoney", billController.todayMoney);

module.exports = router;
