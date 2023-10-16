const mysql = require("mysql");

const db = mysql.createConnection({
  host: process.env.DATABASE_HOST,
  user: process.env.DATABASE_USER,
  database: process.env.DATABASE,
});

//get all type
exports.getAllType = async (req, res) => {
  let sql = "SELECT * FROM loai";
  db.query(sql, (error, result) => {
    if (error) return res.status(400).json({ message: "Server error" });

    result = JSON.parse(JSON.stringify(result));

    return res.status(200).json({
      data: result,
    });
  });
};

//thêm loại mới
exports.addNew = async (req, res) => {
  const { maloai, tenloai } = req.body;

  if (!maloai || !tenloai)
    return res.status(400).json({ message: "Thông tin còn thiếu" });

  if (maloai.length !== 4)
    return res.status(400).json({ message: "Mã loại không hợp lệ" });

  db.query(
    "select * from loai where maloai=?",
    [maloai],
    async (error, result) => {
      if (result.length > 0) {
        return res.status(402).json({
          message: "Loại này đã tồn tại",
        });
      } else {
        let sql = `INSERT INTO loai (maloai, tenloai) VALUES ('${maloai}', '${tenloai}')`;
        db.query(sql, async (error, result) => {
          if (error) {
            return res.status(400).json({
              message: "Lỗi khi thêm loại",
            });
          }
          return res.json({
            message: "Thêm loại thành công",
          });
        });
      }
    }
  );
};

//xóa loại
exports.delete = async (req, res) => {
  const maloai = req.params.id;

  if (!maloai) return res.status(400).json({ message: "Thông tin còn thiếu" });

  if (maloai.length !== 4)
    return res.status(400).json({ message: "Mã loại không hợp lệ" });

  db.query(
    "select * from loai where maloai=?",
    [maloai],
    async (error, result) => {
      if (result.length > 0) {
        let sql = `DELETE FROM loai where maloai = '${maloai}'`;
        db.query(sql, async (error, result) => {
          if (error) {
            return res.status(400).json({
              message: "Lỗi khi xóa loại",
            });
          }
          return res.json({
            message: "Xóa loại thành công",
          });
        });
      } else {
        return res.status(400).json({
          message: "Loại này đã không tồn tại",
        });
      }
    }
  );
};

//update loại
exports.update = async (req, res) => {
  const maloai = req.params.id;
  const { tenloai } = req.body;

  if (!maloai || !tenloai)
    return res.status(400).json({ message: "Thông tin còn thiếu" });

  if (maloai.length !== 4)
    return res.status(400).json({ message: "Mã loại không hợp lệ" });

  db.query(
    "select * from loai where maloai=?",
    [maloai],
    async (error, result) => {
      if (result.length > 0) {
        let sql = `UPDATE loai SET tenloai = '${tenloai}' where maloai = '${maloai}'`;
        db.query(sql, (error, result) => {
          return res.status(200).json({ message: "Update loại thành công" });
        });
      } else {
        return res.status(400).json({ message: "Tên loại không tồn tại" });
      }
    }
  );
};
