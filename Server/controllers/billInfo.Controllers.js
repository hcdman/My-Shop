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

    let sql = `SELECT ct.* ,  sp.masp, sp.anh, sp.tensp, sp.hangsx, ROUND((100-sp.giamgia)*sp.gia/100,0) AS gia_goc FROM cthd ct, sanpham sp WHERE ct.masp = sp.masp and sohd=? `;
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
  db.query('select * from cthd where id_cthd = ? ', id_cthd, async (err, result) => {
    //console.log(result)
    if (err) {
      return res
        .status(400)
        .json({ message: "Server Error 1" });
    }

    // console.log(result)

    let sl = result[0].sl;
    let masp = result[0].masp;
    let sohd = result[0].sohd;

    db.query('select * from sanpham where masp = ?', masp, async (err, result) => {
      if (err) {
        return res
          .status(400)
          .json({ message: "Server Error 2" });
      }

      //console.log(result)

      let slsp = result[0].sl;
      let price = result[0].gia;
      let discount = result[0].giamgia;
      let totalPrice = price * sl * (100 - discount) / 100;

      db.query('update sanpham set sl = ? where masp = ?', [slsp + sl, masp], async (err, result) => {
        //console.log(result)
        if (err) {
          return res
            .status(400)
            .json({ message: "Server Error 3" })
        }
        db.query('update hoadon set trigia = trigia - ? where sohd =?', [totalPrice, sohd], async (err, result) => {
          //console.log(result)
          if (err) {
            return res
              .status(400)
              .json({ message: "Server Error 4" })
          }

          db.query('delete from cthd where id_cthd = ?', [id_cthd], async (err, result) => {
            //console.log(result)
            if (err) {
              return res
                .status(400)
                .json({ message: "Server Error 6" })
            }
            return res
              .status(200)
              .json({ message: "Xóa thành công!!" })
          })
        })
      })
    })

  })

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
        db.query("select * from sanpham where masp=?", [masp], async (err, result) => {
          if (error) {
            return res
              .status(400)
              .json({ message: "Server Error" });
          }
          if (result.length > 0) {
            let slsp = result[0].sl;
            if (slsp - sl >= 0) {
              db.query("update sanpham set sl = ? where masp=?", [slsp - sl, masp], async (err, result) => {
                if (error) {
                  return res
                    .status(400)
                    .json({ message: "Server Error" });
                }
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
                        .json({ message: "Server Error!!!" });


                    db.query("select * from sanpham where masp = ?", [masp], async (error, result) => {
                      let price = result[0].gia;
                      let discount = result[0].giamgia;
                      let totalPrice = price * sl * (100 - discount) / 100;
                      //console.log(sl);
                      //console.log(price);
                      //console.log(totalPrice);
                      console.log(totalPrice);
                      let sql = "UPDATE hoadon SET trigia = trigia + " + totalPrice + " WHERE sohd = " + sohd;
                      db.query(sql, async (error, result) => {
                        //console.log(error);
                        if (error) {
                          return res
                            .status(400)
                            .json({ message: "Server Error!!!" });
                        }
                        return res.status(200).json({
                          message: "Thêm chi tiết đơn hàng thàng công",
                        });
                      })

                    });

                  }
                );
              })
            } else {
              return res
                .status(400)
                .json({ message: "Số lượng tồn không đủ" });
            }
          }
          else {
            return res.status(400).json({ message: "Không tồn tại sản phẩm với mã sản phẩm" });
          }
        })

      } else return res.status(400).json({ message: "Hóa đơn không tồn tại" });
    }
  );
};



