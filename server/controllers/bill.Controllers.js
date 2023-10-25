const mysql = require("mysql");

const db = mysql.createConnection({
  host: process.env.DATABASE_HOST,
  user: process.env.DATABASE_USER,
  database: process.env.DATABASE,
});

// get all customer
exports.getAllBill = async (req, res) => {
  let sql = "SELECT * FROM hoadon";
  db.query(sql, (error, result) => {
    if (error) return res.status(400).json({ message: "Server error" });
    result = JSON.parse(JSON.stringify(result));

    return res.status(200).json({
      bill: result,
    });
  });
};

//lấy chi tiết 1 khách hàng
exports.getBill = async (req, res) => {
  const sohd = req.params.id;

  db.query(
    "SELECT * FROM hoadon WHERE sohd=?",
    [sohd],
    async (error, result) => {
      if (error) return res.status(400).json({ message: "Server Error" });
      if (result.length < 1)
        return res.status(400).json({ message: "Hóa đơn không tồn tại" });

      res.json({
        data: JSON.parse(JSON.stringify(result[0])),
      });
    }
  );
};

//thêm một đơn hàng
exports.addNew = async (req, res) => {
  const { sohd, nghd, makh, trigia } = req.body;

  if (!makh || makh.length !== 4 || sohd < 0 || !nghd || trigia <= 0)
    return res.status(400).json({ message: "Thông tin không hợp lệ" });

  db.query(
    "SELECT * FROM hoadon WHERE sohd=?",
    [sohd],
    async (error, result) => {
      if (result.length > 0)
        return res.status(400).json({ message: "Số hóa đơn đã tồn tại" });

      db.query(
        "insert into hoadon set ?",
        {
          sohd,
          nghd,
          makh,
          trigia,
        },
        async (error, result) => {
          if (error)
            return res
              .status(400)
              .json({ message: "Mã khách hàng không hợp lệ" });

          return res.status(200).json({
            message: "Thêm hóa đơn thành công",
          });
        }
      );
    }
  );
};

//xóa một khách hàng theo makh
exports.delete = async (req, res) => {
  const sohd = req.params.id;

  if (!sohd || sohd < 0)
    return res.status(400).json({ message: "Thông tin còn thiếu" });

  db.query(
    "select * from hoadon where sohd=?",
    [sohd],
    async (error, result) => {
      if (result.length > 0) {
        let sql = `DELETE FROM hoadon where sohd = '${sohd}'`;
        db.query(sql, async (error, result) => {
          if (error) {
            return res.status(400).json({
              message: "Số hóa đơn không tồn tại",
            });
          }
          return res.json({
            message: "Xóa hóa đơn thành công",
          });
        });
      } else {
        return res.status(400).json({
          message: "Số hóa đơn không tồn tại",
        });
      }
    }
  );
};

//update thông tin khách hàng
exports.update = async (req, res) => {
  const sohd = req.params.id;

  const { nghd, makh, trigia } = req.body;

  if (!makh || makh.length !== 4 || sohd < 0 || !nghd || trigia <= 0)
    return res.status(400).json({ message: "Thông tin không hợp lệ" });

  db.query(
    "select * from hoadon where sohd=?",
    [sohd],
    async (error, result) => {
      if (result.length > 0) {
        let sql = `UPDATE hoadon SET ? where sohd = '${sohd}'`;
        db.query(
          sql,
          {
            nghd,
            makh,
            trigia,
          },
          (error, result) => {
            if (error)
              return res.status(400).json({
                message: "Hóa đơn không tồn tại",
              });
            return res.status(200).json({
              message: "Update hóa đơn thành công",
            });
          }
        );
      } else {
        return res.status(400).json({ message: "Hóa đơn không tồn tại" });
      }
    }
  );
};

// get top 10 latest order
exports.latest = async (req, res) => {
  let sql =
    'SELECT hd.sohd, DATE_FORMAT(hd.nghd, "%d/%m/%Y") AS nghd, kh.hoten, hd.trigia FROM hoadon hd, khachhang kh WHERE hd.makh = kh.makh ORDER BY hd.nghd DESC LIMIT 10';
  db.query(sql, (error, result) => {
    if (error) return res.status(400).json({ message: "Server error" });
    result = JSON.parse(JSON.stringify(result));

    return res.status(200).json({
      bill: result,
    });
  });
};

// get top 10 latest order in week
exports.currentWeek = async (req, res) => {
  let sql =
    "SELECT * FROM hoadon WHERE YEARWEEK(nghd, 1) = YEARWEEK(CURDATE(), 1) ";

  db.query(sql, (error, result) => {
    if (error) return res.status(400).json({ message: "Server error" });
    result = JSON.parse(JSON.stringify(result));

    return res.status(200).json(result.length);
  });
};

// get top 10 latest order in month
exports.currentMonth = async (req, res) => {
  let sql =
    "SELECT * FROM hoadon WHERE YEAR(nghd) = YEAR(CURDATE()) and MONTH(nghd) = MONTH(CURDATE())";

  db.query(sql, (error, result) => {
    if (error) return res.status(400).json({ message: "Server error" });
    result = JSON.parse(JSON.stringify(result));

    return res.status(200).json(result.length);
  });
};

// get top 10 latest order in month
exports.todayMoney = async (req, res) => {
  let sql =
    "SELECT SUM(trigia) FROM hoadon WHERE YEAR(nghd) = YEAR(CURDATE()) and MONTH(nghd) = MONTH(CURDATE()) and DAY(nghd) = DAY(CURDATE())";

  db.query(sql, (error, result) => {
    if (error) return res.status(400).json({ message: "Server error" });
    result = JSON.parse(JSON.stringify(result));
    money = result[0]["SUM(trigia)"];
    if (money == null) money = 0;
    return res.status(200).json(money);
  });
};
