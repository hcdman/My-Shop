const mysql = require("mysql");

const db = mysql.createConnection({
  host: process.env.DATABASE_HOST,
  user: process.env.DATABASE_USER,
  database: process.env.DATABASE,
  password: process.env.DATABASE_PASSWORD,
});

// get all customer
exports.getAllCustomer = async (req, res) => {
  let sql = "SELECT * FROM khachhang";
  db.query(sql, (error, result) => {
    if (error) return res.status(400).json({ message: "Server error" });
    result = JSON.parse(JSON.stringify(result));

    return res.status(200).json({
      customer: result,
    });
  });
};

//lấy chi tiết 1 khách hàng
exports.getCustomer = async (req, res) => {
  const makh = req.params.id;

  db.query(
    "SELECT * FROM khachhang WHERE makh=?",
    [makh],
    async (error, result) => {
      if (error) return res.status(400).json({ message: "Server Error" });
      if (result.length < 1)
        return res.status(400).json({ message: "Khách hàng không tồn tại" });

      res.json({
        data: JSON.parse(JSON.stringify(result[0])),
      });
    }
  );
};

//thêm một khách hàng mới
exports.addNew = async (req, res) => {
  const { makh, hoten, dchi, sodt, ngsinh, email, ngdk } = req.body;

  if (
    !makh ||
    makh.length !== 4 ||
    !hoten ||
    !dchi ||
    !sodt ||
    !ngsinh ||
    !email ||
    !ngdk
  )
    return res.status(400).json({ message: "Thông tin không hợp lệ" });

  db.query(
    "SELECT * FROM khachhang WHERE makh=?",
    [makh],
    async (error, result) => {
      if (result.length > 0)
        return res.status(400).json({ message: "Mã khách hàng đã tồn tại" });

      db.query(
        "insert into khachhang set ?",
        {
          makh,
          hoten,
          dchi,
          sodt,
          ngsinh,
          email,
          ngdk,
        },
        async (error, result) => {
          if (error) return res.status(400).json({ message: "Server Error" });

          return res.status(200).json({
            message: "Thêm khách hàng thành công",
          });
        }
      );
    }
  );
};

//xóa một khách hàng theo makh
exports.delete = async (req, res) => {
  const makh = req.params.id;

  if (!makh) return res.status(400).json({ message: "Thông tin còn thiếu" });

  if (makh.length !== 4)
    return res.status(400).json({ message: "Mã khách hàng không hợp lệ" });

  db.query(
    "select * from khachhang where makh=?",
    [makh],
    async (error, result) => {
      if (result.length > 0) {
        let sql = `DELETE FROM khachhang where makh = '${makh}'`;
        db.query(sql, async (error, result) => {
          if (error) {
            return res.status(400).json({
              message: "Lỗi khi xóa sản phẩm",
            });
          }
          return res.json({
            message: "Xóa khách hàng thành công",
          });
        });
      } else {
        return res.status(400).json({
          message: "Mã khách hàng không tồn tại",
        });
      }
    }
  );
};

//update thông tin khách hàng
exports.update = async (req, res) => {
  const makh = req.params.id;

  const { hoten, dchi, sodt, ngsinh, email, ngdk } = req.body;

  if (
    !makh ||
    makh.length !== 4 ||
    !hoten ||
    !dchi ||
    !sodt ||
    !ngsinh ||
    !email ||
    !ngdk
  )
    return res.status(400).json({ message: "Thông tin không hợp lệ" });

  db.query(
    "select * from khachhang where makh=?",
    [makh],
    async (error, result) => {
      if (result.length > 0) {
        let sql = `UPDATE khachhang SET ? where makh = '${makh}'`;
        db.query(
          sql,
          {
            hoten,
            dchi,
            sodt,
            ngsinh,
            email,
            ngdk,
          },
          (error, result) => {
            if (error)
              return res.status(400).json({
                message: "Server lỗi",
              });
            return res.status(200).json({
              message: "Update khách hàng thành công",
            });
          }
        );
      } else {
        return res.status(400).json({ message: "Khách hàng không tồn tại" });
      }
    }
  );
};
