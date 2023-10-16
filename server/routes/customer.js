const express = require("express");
const customerController = require("../controllers/customer.Controllers");
const router = express.Router();

router.post("/add", customerController.addNew);
router.get("/getall", customerController.getAllCustomer);
router.get("/get/:id", customerController.getCustomer);
router.delete("/delete/:id", customerController.delete);
router.put("/update/:id", customerController.update);

module.exports = router;
