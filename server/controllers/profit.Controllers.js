const mysql = require("mysql");

const db = mysql.createConnection({
  host: process.env.DATABASE_HOST,
  user: process.env.DATABASE_USER,
  database: process.env.DATABASE,
  password: process.env.DATABASE_PASSWORD,
});

// get week
exports.getProfitWeek = async (req, res) => {
  let sql =
    "select weekday(hd.nghd) as id, round(sum(hd.trigia - ct.sl * sp.gia_goc)/1000000,0) as tong from hoadon hd, cthd ct, sanpham sp where hd.sohd=ct.sohd and sp.masp=ct.masp group by weekday(hd.nghd)";
  db.query(sql, (error, result) => {
    if (error) return res.status(400).json({ message: "Server error" });
    result = JSON.parse(JSON.stringify(result));
    return res.status(200).json({ data: result });
  });
};

// get year
exports.getProfitYear = async (req, res) => {
  let sql =
    "select month(nghd) as id, round(sum(hd.trigia - ct.sl * sp.gia_goc)/1000000,0) as tong from hoadon hd, cthd ct, sanpham sp where hd.sohd=ct.sohd and sp.masp=ct.masp group by month(nghd)";
  db.query(sql, (error, result) => {
    if (error) return res.status(400).json({ message: "Server error" });
    result = JSON.parse(JSON.stringify(result));
    return res.status(200).json({ data: result });
  });
};

// get month
exports.getProfitMonth = async (req, res) => {
  let sql =
    "select day(hd.nghd) as id, round(sum(hd.trigia - ct.sl * sp.gia_goc)/1000000,0) as tong from hoadon hd, cthd ct, sanpham sp where hd.sohd=ct.sohd and sp.masp=ct.masp group by day(hd.nghd)";
  db.query(sql, (error, result) => {
    if (error) return res.status(400).json({ message: "Server error" });
    result = JSON.parse(JSON.stringify(result));
    return res.status(200).json({ data: result });
  });
};
