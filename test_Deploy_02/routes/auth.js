const express = require("express");
const userController = require("../controllers/users");
const router = express.Router();

router.post("/register", userController.register);
router.post("/login", userController.login);
router.post("/active", userController.active);
router.post("/addCode", userController.addCode);
module.exports = router;
