const express = require("express");
const pieceController = require("../controllers/piece.Controllers");
const router = express.Router();

router.get("/week", pieceController.getPieceWeek);
router.get("/year", pieceController.getPieceYear);
router.get("/month", pieceController.getPieceMonth);

module.exports = router;
