const mysql = require("mysql");

const db = mysql.createConnection({
  host: process.env.DATABASE_HOST,
  user: process.env.DATABASE_USER,
  database: process.env.DATABASE,
  password: process.env.DATABASE_PASSWORD,
});

// get week
exports.getPieceWeek = async (req, res) => {
  let sql =
    "select l.tenloai as product, sum(ct.sl) as sl from hoadon hd, cthd ct, sanpham sp, loai l where ct.masp = sp.masp and sp.maloai = l.maloai and hd.sohd = ct.sohd and week(hd.nghd) = week(curdate()) group by l.maloai, l.tenloai order by sl desc";
  db.query(sql, (error, result) => {
    if (error) return res.status(400).json({ message: "Server error" });
    result = JSON.parse(JSON.stringify(result));
    return res.status(200).json({ data: result });
  });
};

// get year
exports.getPieceYear = async (req, res) => {
  console.log("request");
  let sql =
    "select l.tenloai as product, sum(ct.sl) as sl from hoadon hd, cthd ct, sanpham sp, loai l where ct.masp = sp.masp and sp.maloai = l.maloai and hd.sohd = ct.sohd and year(hd.nghd) = year(curdate()) group by l.maloai, l.tenloai order by sl desc";
  db.query(sql, (error, result) => {
    if (error) return res.status(400).json({ message: "Server error" });
    result = JSON.parse(JSON.stringify(result));
    return res.status(200).json({ data: result });
  });
};

// get month
exports.getPieceMonth = async (req, res) => {
  let sql =
    "select l.tenloai as product, sum(ct.sl) as sl from hoadon hd, cthd ct, sanpham sp, loai l where ct.masp = sp.masp and sp.maloai = l.maloai and hd.sohd = ct.sohd and month(hd.nghd) = month(curdate()) group by l.maloai, l.tenloai order by sl desc";
  db.query(sql, (error, result) => {
    if (error) return res.status(400).json({ message: "Server error" });
    result = JSON.parse(JSON.stringify(result));
    return res.status(200).json({ data: result });
  });
};
