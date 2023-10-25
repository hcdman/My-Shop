const mysql = require("mysql");
const cloudinary = require("cloudinary").v2;
const fs = require("fs");

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
    if (error) return res.status(400).json({ message: "Server error" });
    result = JSON.parse(JSON.stringify(result));

    return res.status(200).json({
      product: result,
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
      if (error) return res.status(400).json({ message: "Server Error" });
      if (result.length < 1)
        return res.status(400).json({ message: "Sản phẩm không tồn tại" });

      res.json({
        data: JSON.parse(JSON.stringify(result[0])),
      });
    }
  );
};

//thêm sản phẩm mới
exports.addNew = async (req, res) => {
  data = JSON.parse(req.body.data);
  console.log("data");
  const b64 = Buffer.from(req.file.buffer).toString("base64");
  let dataURI = "data:" + req.file.mimetype + ";base64," + b64;

  const { masp, tensp, hangsx, anh, gia_goc, gia, sl, maloai, giamgia } = data;

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
    return res.status(400).json({ message: "Thông tin không hợp lệ" });

  db.query(
    "SELECT * FROM sanpham WHERE masp=?",
    [masp],
    async (error, result) => {
      if (result.length > 0)
        return res.status(400).json({ message: "Mã sản phẩm đã tồn tại" });
      db.query(
        "SELECT * FROM loai WHERE maloai=?",
        [maloai],
        async (error, result) => {
          if (result.length < 1) {
            return res.status(400).json({ message: "Mã loại không tồn tại" });
          } else {
            cloudinary.uploader.upload(dataURI, function (error, result) {
              if (error)
                return res.status(400).json({ message: "Cloundinary Error" });

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
                    return res.status(400).json({ message: "Server Error" });

                  return res.json({
                    message: "Thêm sản phẩm thành công",
                  });
                }
              );
            });
          }
        }
      );
    }
  );
};

//xóa một sản phẩm theo masp
exports.delete = async (req, res) => {
  const masp = req.params.id;

  if (!masp) return res.status(400).json({ message: "Thông tin còn thiếu" });

  if (masp.length !== 4)
    return res.status(400).json({ message: "Mã loại không hợp lệ" });

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
            });
          }
          return res.json({
            message: "Xóa sản phẩm thành công",
          });
        });
      } else {
        return res.status(400).json({
          message: "Mã sản phẩm không tồn tại",
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
    return res.status(400).json({ message: "Thông tin không hợp lệ" });

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
              return res.status(400).json({ message: "Mã loại không tồn tại" });

            cloudinary.uploader.upload(anh, function (error, result) {
              if (error)
                return res.status(400).json({ message: "Ảnh không tồn tại" });
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
                  });
                }
              );
            });
          }
        );
      } else {
        return res.status(400).json({ message: "Sản phẩm không tồn tại" });
      }
    }
  );
};

// lấy danh sách top 5 sản phẩm bán chạy nhất
exports.getTop5 = async (req, res) => {
  let sql =
    "SELECT * FROM cthd ct, sanpham sp where ct.masp = sp.masp  GROUP BY ct.masp ORDER BY sum(ct.sl) DESC LIMIT 5";
  db.query(sql, (error, result) => {
    if (error) return res.status(400).json({ message: "Server error" });
    result = JSON.parse(JSON.stringify(result));

    return res.status(200).json({
      product: result,
    });
  });
};

function stringToPrice(price) {
  switch (price) {
    case "Below 2.000.000":
      return "gia < 2000000";
    case "2.000.000 - 3.999.999":
      return "gia >= 2000000 and gia < 4000000";
    case "4.000.000 - 6.999.999":
      return "gia >= 4000000 and gia < 7000000";
    case "7.000.000 - 12.999.999":
      return "gia >= 7000000 and gia < 13000000";
    case "13.000.000 - 20.000.000":
      return "gia >= 13000000 and gia <= 20000000";
    case "Over 20.000.000":
      return "gia > 20000000";
  }
  return "gia > 0";
}

//filter product
exports.filter = async (req, res) => {
  const { name, price, maloai, SortBy, per_page, page } = req.body;

  let sql = "SELECT * FROM sanpham";
  db.query(sql, (error, result) => {
    if (error) return res.status(400).json({ message: "Server error" });
    result = JSON.parse(JSON.stringify(result));

    let skip = (page - 1) * per_page;
    sql = `select *, count(*) over() as Total from sanpham where tensp like '%${name}%' and maloai like '%${maloai}%' and ${stringToPrice(
      price
    )}`;
    if (SortBy === "Price descending") sql += ` order by gia desc, masp`;
    else if (SortBy === "Price ascending") sql += ` order by gia asc, masp`;
    else sql += " order by masp";
    sql += ` limit ${per_page} offset ${skip}`;

    try {
      db.query(sql, (error, result) => {
        if (error) return res.status(400).json({ message: "Server error" });
        result = JSON.parse(JSON.stringify(result));
        return res.status(200).json({
          product: result,
        });
      });
    } catch (e) {
      console.log(e);
      res.status(400).json({ message: "Server error" });
    }
  });
};
