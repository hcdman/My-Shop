const mysql = require("mysql");

const db = mysql.createConnection({
  host: process.env.DATABASE_HOST,
  user: process.env.DATABASE_USER,
  database: process.env.DATABASE,
  password: process.env.DATABASE_PASSWORD,
});

// get week
exports.getRevenueWeek = async (req, res) => {
  let sql =
    "select weekday(nghd) as id, round(sum(trigia)/1000000,0) as tong from hoadon group by weekday(nghd)";
  db.query(sql, (error, result) => {
    if (error) return res.status(400).json({ message: "Server error" });
    result = JSON.parse(JSON.stringify(result));
    return res.status(200).json({ data: result });
  });
};

// get year
exports.getRevenueYear = async (req, res) => {
  let sql =
    "select month(nghd) as id, round(sum(trigia)/1000000,0) as tong from hoadon group by month(nghd)";
  db.query(sql, (error, result) => {
    if (error) return res.status(400).json({ message: "Server error" });
    result = JSON.parse(JSON.stringify(result));
    return res.status(200).json({ data: result });
  });
};

// get month
exports.getRevenueMonth = async (req, res) => {
  let sql =
    "select day(nghd) as id, round(sum(trigia)/1000000,0) as tong from hoadon group by day(nghd)";
  db.query(sql, (error, result) => {
    if (error) return res.status(400).json({ message: "Server error" });
    result = JSON.parse(JSON.stringify(result));
    return res.status(200).json({ data: result });
  });
};
