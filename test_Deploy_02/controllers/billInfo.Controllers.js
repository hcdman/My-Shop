const mysql = require("mysql");

const db = mysql.createConnection({
  host: process.env.DATABASE_HOST,
  user: process.env.DATABASE_USER,
  password: process.env.DATABASE_PASSWORD,
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
      return res.json({ data: [] });

    let sql = `SELECT * FROM cthd ct, sanpham sp WHERE ct.masp = sp.masp and sohd=? `;
    db.query(sql, [sohd], async (error, result) => {
      if (error) return res.status(400).json({ message: "Server Error" });
      res.json({
        data: JSON.parse(JSON.stringify(result)),
      });
    });
  });
};


//xoa mot chi tiet hoa don dua theo id_cthd
exports.delete = async (req, res) => {
  const id_cthd = req.params.id;
  // console.log(id_cthd);
  let sql1 = "select masp from cthd where id_cthd = " + id_cthd;
  //let price = 0;
  let masp = '';
  db.query(sql1, async (error, result) => {
    //console.log(error)
    // console.log(result)
    //console.log(result[0]);
    masp = result[0].masp;
    let sohd = 0;
    let sql2 = "SELECT sohd FROM cthd WHERE id_cthd = " + id_cthd;
    db.query(sql2, async (error, result) => {
      //console.log(error)
      //sohd = result[0].sohd
      //console.log(result[0]);
      sohd = result[0].sohd;

      let sql3 = "SELECT sl FROM cthd WHERE id_cthd = " + id_cthd;
      let sl = 0;
      db.query(sql3, async (error, result) => {
        //sohd = result[0].sohd;
        sl = result[0].sl;
        console.log(masp)
        let sql4 = "SELECT gia FROM sanpham WHERE masp = '" + masp + "'";
        let gia = 0;
        db.query(sql4, async (error, result) => {

          gia = result[0].gia;
          let ttPrice = gia * sl;
          console.log(ttPrice);
          console.log(sohd);

          let sql = `DELETE FROM cthd where id_cthd = '${id_cthd}'`;
          db.query(sql, async (error, result) => {
            if (error) {
              return res.status(400).json({
                message: "delete khong thanh cong",
              });
            }

            let sql = "UPDATE hoadon SET trigia = trigia -  " + ttPrice + " WHERE sohd = " + sohd;
            db.query(sql, async (error, result) => {
              console.log(error);
              return res.status(200).json({
                message: "Xóa chi tiet hoa don thành công",
              });
            })
          });

        })
      })
    })
  })


};


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
            db.query("select gia from sanpham where masp = ?", [masp], async (error, result) => {
              let price = result[0].gia;
              let totalPrice = price * sl;
              console.log(sl);
              console.log(price);
              console.log(totalPrice);
              let sql = "UPDATE hoadon SET trigia = trigia + " + totalPrice + " WHERE sohd = " + sohd;
              db.query(sql, async (error, result) => {
                console.log(error);
                return res.status(200).json({
                  message: "Thêm chi tiết đơn hàng thàng công",
                });
              })

            });

          }
        );
      } else return res.status(400).json({ message: "Hóa đơn không tồn tại" });
    }
  );
};


