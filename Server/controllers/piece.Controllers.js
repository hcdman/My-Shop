const mysql = require("mysql");

const db = mysql.createConnection({
  host: process.env.DATABASE_HOST,
  user: process.env.DATABASE_USER,
  database: process.env.DATABASE,
  password: process.env.DATABASE_PASSWORD,
});

// get week
exports.getPieceWeek = async (req, res) => {
  let { day, month, year } = req.body;
  let date1 = new Date(year, month - 1, day);
  let thh = date1.setTime(date1.getTime() + 7 * 24 * 60 * 60 * 1000);
  date2 = new Date(thh);
  const day2 = date2.getDate();
  const month2 = date2.getMonth() + 1;
  const year2 = date2.getFullYear();
  const str1 = `${year}-${month}-${day}`;
  const str2 = `${year2}-${month2}-${day2}`;

  let sql = `select l.tenloai as product, sum(ct.sl) as sl from hoadon hd, cthd ct, sanpham sp, loai l where ct.masp = sp.masp and sp.maloai = l.maloai and hd.sohd = ct.sohd and datediff(nghd, "${str1}") >= 0 and datediff(nghd, "${str1}") < datediff("${str2}", "${str1}") group by l.maloai, l.tenloai order by sl desc`;
  db.query(sql, (error, result) => {
    if (error) return res.status(400).json({ message: "Server error" });
    result = JSON.parse(JSON.stringify(result));
    return res.status(200).json({ data: result });
  });
};

// get year
exports.getPieceYear = async (req, res) => {
  const { day, month, year } = req.body;

  let sql = `select l.tenloai as product, sum(ct.sl) as sl from hoadon hd, cthd ct, sanpham sp, loai l where ct.masp = sp.masp and sp.maloai = l.maloai and hd.sohd = ct.sohd and year(hd.nghd) = ${year} group by l.maloai, l.tenloai order by sl desc`;
  db.query(sql, (error, result) => {
    if (error) return res.status(400).json({ message: "Server error" });
    result = JSON.parse(JSON.stringify(result));
    return res.status(200).json({ data: result });
  });
};

// get month
exports.getPieceMonth = async (req, res) => {
  const { day, month, year } = req.body;

  let sql = `select l.tenloai as product, sum(ct.sl) as sl from hoadon hd, cthd ct, sanpham sp, loai l where ct.masp = sp.masp and sp.maloai = l.maloai and hd.sohd = ct.sohd and month(hd.nghd) = ${month} and year(hd.nghd)= ${year} group by l.maloai, l.tenloai order by sl desc`;
  db.query(sql, (error, result) => {
    if (error) return res.status(400).json({ message: "Server error" });
    result = JSON.parse(JSON.stringify(result));
    return res.status(200).json({ data: result });
  });
};
