const express = require("express");
const productController = require("../controllers/product.Controllers");
const router = express.Router();

router.post("/add", productController.addNew);
router.get("/getall", productController.getAllProduct);
router.get("/get/:id", productController.getProduct);
router.delete("/delete/:id", productController.delete);
router.put("/update/:id", productController.update);

module.exports = router;
