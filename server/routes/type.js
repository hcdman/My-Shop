const express = require("express");
const typeController = require("../controllers/type.Controllers");
const router = express.Router();

router.get("/getall", typeController.getAllType);
router.post("/add", typeController.addNew);
router.delete("/delete/:id", typeController.delete);
router.put("/update/:id", typeController.update);

module.exports = router;
