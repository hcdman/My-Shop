const express = require("express");
const pieceController = require("../controllers/piece.Controllers");
const router = express.Router();

router.post("/week", pieceController.getPieceWeek);
router.post("/year", pieceController.getPieceYear);
router.post("/month", pieceController.getPieceMonth);

module.exports = router;
