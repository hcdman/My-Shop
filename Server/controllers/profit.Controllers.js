const mysql = require("mysql");

const db = mysql.createConnection({
  host: process.env.DATABASE_HOST,
  user: process.env.DATABASE_USER,
  database: process.env.DATABASE,
  password: process.env.DATABASE_PASSWORD,
});

// get week
exports.getProfitWeek = async (req, res) => {
  let { day, month, year } = req.body;
  let date1 = new Date(year, month - 1, day);
  let thh = date1.setTime(date1.getTime() + 7 * 24 * 60 * 60 * 1000);
  date2 = new Date(thh);
  const day2 = date2.getDate();
  const month2 = date2.getMonth() + 1;
  const year2 = date2.getFullYear();
  const str1 = `${year}-${month}-${day}`;
  const str2 = `${year2}-${month2}-${day2}`;

  let sql = `select weekday(hd.nghd) as id, round(sum(hd.trigia - ct.sl * sp.gia_goc)/1000000,0) as tong from hoadon hd, cthd ct, sanpham sp where hd.sohd=ct.sohd and sp.masp=ct.masp and datediff(nghd, "${str1}") >= 0 and datediff(nghd, "${str1}") < datediff("${str2}", "${str1}") group by weekday(hd.nghd)`;
  db.query(sql, (error, result) => {
    if (error) return res.status(400).json({ message: "Server error" });
    result = JSON.parse(JSON.stringify(result));
    return res.status(200).json({ data: result });
  });
};

// get year
exports.getProfitYear = async (req, res) => {
  const { year } = req.body;
  let sql = `select month(nghd) as id, round(sum(hd.trigia - ct.sl * sp.gia_goc)/1000000,0) as tong from hoadon hd, cthd ct, sanpham sp where hd.sohd=ct.sohd and sp.masp=ct.masp and year(nghd) = ${year} group by month(nghd)`;
  db.query(sql, (error, result) => {
    if (error) return res.status(400).json({ message: "Server error" });
    result = JSON.parse(JSON.stringify(result));
    return res.status(200).json({ data: result });
  });
};

// get month
exports.getProfitMonth = async (req, res) => {
  const { year, month } = req.body;
  let sql = `select day(hd.nghd) as id, round(sum(hd.trigia - ct.sl * sp.gia_goc)/1000000,0) as tong from hoadon hd, cthd ct, sanpham sp where hd.sohd=ct.sohd and sp.masp=ct.masp and year(nghd) = ${year} and month(nghd) = ${month} group by day(hd.nghd)`;
  db.query(sql, (error, result) => {
    if (error) return res.status(400).json({ message: "Server error" });
    result = JSON.parse(JSON.stringify(result));
    return res.status(200).json({ data: result });
  });
};
