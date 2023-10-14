const mysql = require("mysql");
const cloudinary = require("cloudinary").v2;

const db = mysql.createConnection({
  host: process.env.DATABASE_HOST,
  user: process.env.DATABASE_USER,
  database: process.env.DATABASE,
});

cloudinary.config({
  cloud_name: process.env.CLOUNDINARY_CLOUND_NAME,
  api_key: process.env.CLOUNDINARY_API_KEY,
  api_secret: process.env.CLOUNDINARY_API_SECRET,
});

// get all product
exports.getAllProduct = async (req, res) => {
  let sql = "SELECT * FROM sanpham";
  db.query(sql, (error, result) => {
    if (error)
      return res.status(400).json({ message: "Server error", success: false });
    result = JSON.parse(JSON.stringify(result));

    return res.status(200).json({
      data: result,
      success: true,
    });
  });
};

//lấy chi tiết 1 product
exports.getProduct = async (req, res) => {
  const masp = req.params.id;

  db.query(
    "SELECT * FROM sanpham WHERE masp=?",
    [masp],
    async (error, result) => {
      if (error)
        return res
          .status(400)
          .json({ message: "Server Error", success: false });
      if (result.length < 1)
        return res
          .status(400)
          .json({ message: "Sản phẩm không tồn tại", success: false });

      res.json({
        data: JSON.parse(JSON.stringify(result[0])),
        success: true,
      });
    }
  );
};

//thêm sản phẩm mới
exports.addNew = async (req, res) => {
  const { masp, anh, tensp, hangsx, gia_goc, gia, sl, maloai, giamgia } =
    req.body;

  if (
    !masp ||
    masp.length !== 4 ||
    !anh ||
    !tensp ||
    gia_goc <= 0 ||
    gia <= 0 ||
    sl <= 0 ||
    !maloai
  )
    return res
      .status(400)
      .json({ message: "Thông tin không hợp lệ", success: false });

  db.query(
    "SELECT * FROM sanpham WHERE masp=?",
    [masp],
    async (error, result) => {
      if (result.length > 0)
        return res
          .status(400)
          .json({ message: "Mã sản phẩm đã tồn tại", success: false });
      db.query(
        "SELECT * FROM loai WHERE maloai=?",
        [maloai],
        async (error, result) => {
          if (result.length < 1) {
            return res
              .status(400)
              .json({ message: "Mã loại không tồn tại", success: false });
          } else {
            cloudinary.uploader.upload(
              anh,
              { public_id: "olympic_flag" },
              function (error, result) {
                if (error)
                  return res
                    .status(400)
                    .json({ message: "Cloundinary Error", success: false });

                db.query(
                  "insert into sanpham set ?",
                  {
                    masp,
                    anh: result.url,
                    tensp,
                    hangsx,
                    gia_goc,
                    gia,
                    sl,
                    maloai,
                    giamgia,
                  },
                  async (error, result) => {
                    if (error)
                      return res
                        .status(400)
                        .json({ message: "Server Error", success: false });

                    return res.json({
                      message: "Thêm sản phẩm thành công",
                      success: true,
                    });
                  }
                );
              }
            );
          }
        }
      );
    }
  );
};

//xóa một sản phẩm theo masp
exports.delete = async (req, res) => {
  const masp = req.params.id;

  if (!masp)
    return res
      .status(400)
      .json({ message: "Thông tin còn thiếu", success: false });

  if (masp.length !== 4)
    return res
      .status(400)
      .json({ message: "Mã loại không hợp lệ", success: false });

  db.query(
    "select * from sanpham where masp=?",
    [masp],
    async (error, result) => {
      if (result.length > 0) {
        let sql = `DELETE FROM sanpham where masp = '${masp}'`;
        db.query(sql, async (error, result) => {
          if (error) {
            return res.status(400).json({
              message: "Lỗi khi xóa sản phẩm",
              success: false,
            });
          }
          return res.json({
            message: "Xóa sản phẩm thành công",
            success: true,
          });
        });
      } else {
        return res.status(400).json({
          message: "Mã sản phẩm không tồn tại",
          success: false,
        });
      }
    }
  );
};

//update sản phẩm
exports.update = async (req, res) => {
  const masp = req.params.id;
  const { anh, tensp, hangsx, gia_goc, gia, sl, maloai, giamgia } = req.body;
  if (
    !masp ||
    masp.length !== 4 ||
    !anh ||
    !tensp ||
    gia_goc <= 0 ||
    gia <= 0 ||
    sl <= 0 ||
    !maloai
  )
    return res
      .status(400)
      .json({ message: "Thông tin không hợp lệ", success: false });

  db.query(
    "select * from sanpham where masp=?",
    [masp],
    async (error, result) => {
      if (result.length > 0) {
        db.query(
          "select * from loai where maloai=?",
          [maloai],
          async (error, result) => {
            if (result.length < 1)
              return res
                .status(400)
                .json({ message: "Mã loại không tồn tại", success: false });

            cloudinary.uploader.upload(
              anh,
              { public_id: "olympic_flag" },
              function (error, result) {
                if (error)
                  return res
                    .status(400)
                    .json({ message: "Ảnh không tồn tại", success: false });
                let sql = `UPDATE sanpham SET ? where masp = '${masp}'`;
                db.query(
                  sql,
                  {
                    anh: result.url,
                    tensp,
                    hangsx,
                    gia_goc,
                    gia,
                    sl,
                    maloai,
                    giamgia,
                  },
                  (error, result) => {
                    return res.status(200).json({
                      message: "Update sản phẩm thành công",
                      success: true,
                    });
                  }
                );
              }
            );
          }
        );
      } else {
        return res
          .status(400)
          .json({ message: "Sản phẩm không tồn tại", success: false });
      }
    }
  );
};
