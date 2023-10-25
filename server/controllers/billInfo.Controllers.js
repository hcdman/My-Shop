const mysql = require("mysql");

const db = mysql.createConnection({
  host: process.env.DATABASE_HOST,
  user: process.env.DATABASE_USER,
  database: process.env.DATABASE,
});

// get all bill infor of sohd
exports.getAllBillInfo = async (req, res) => {
  let sql = "SELECT * FROM cthd";
  db.query(sql, (error, result) => {
    if (error) return res.status(400).json({ message: "Server error" });
    result = JSON.parse(JSON.stringify(result));

    return res.status(200).json({
      data: result,
    });
  });
};

//lấy chi tiết tất cả thông tin hóa đơn (sohd) (masp, tensp, ...)
exports.getBillInfo = async (req, res) => {
  const sohd = req.params.id;

  db.query("SELECT * FROM cthd WHERE sohd=?", [sohd], async (error, result) => {
    if (error) return res.status(400).json({ message: "Server Error" });
    if (result.length < 1)
      return res.status(400).json({ message: "Hóa đơn không tồn tại" });

    let sql = `SELECT * FROM cthd ct, sanpham sp WHERE ct.masp = sp.masp`;
    db.query(sql, async (error, result) => {
      if (error) return res.status(400).json({ message: "Server Error" });
      res.json({
        data: JSON.parse(JSON.stringify(result)),
      });
    });
  });
};

//thêm chi tiết đơn hàng cho một đơn hàng
exports.addNew = async (req, res) => {
  const { sohd, masp, sl } = req.body;

  if (!masp || masp.length !== 4 || sohd < 0 || sl <= 0)
    return res.status(400).json({ message: "Thông tin không hợp lệ" });

  db.query(
    "SELECT * FROM hoadon WHERE sohd=?",
    [sohd],
    async (error, result) => {
      if (result.length > 0) {
        db.query(
          "insert into cthd set ?",
          {
            sohd,
            masp,
            sl,
          },
          async (error, result) => {
            if (error)
              return res
                .status(400)
                .json({ message: "Mã sản phẩm không hợp lệ" });

            return res.status(200).json({
              message: "Thêm chi tiết đơn hàng thàng công",
            });
          }
        );
      } else return res.status(400).json({ message: "Hóa đơn không tồn tại" });
    }
  );
};

//xóa một chi tiết đơn hàng
exports.delete = async (req, res) => {
  const sohd = req.params.id;

  res.json({ message: "Update lasted" });
};

//update thông tin khách hàng
exports.update = async (req, res) => {
  const sohd = req.params.id;

  res.json({ message: "Update lasted" });
};
