require("dotenv").config();
const express = require("express");
const mysql = require("mysql");
const app = express();
const cookieParser = require("cookie-parser");
const cors = require("cors");
const bodyParser = require("body-parser");

const db = mysql.createConnection({
  host: process.env.DATABASE_HOST,
  user: process.env.DATABASE_USER,
  database: process.env.DATABASE,
});

db.connect((err) => {
  if (err) console.log(err);
  else console.log("MySQL Connection Success");
});

app.use(cookieParser());

app.use(bodyParser.urlencoded({ extended: false })); //get data from frontend
app.use(bodyParser.json());

app.use(express.json());
app.use(cors());

app.use("/auth", require("./routes/auth"));
app.use("/type", require("./routes/type"));
app.use("/product", require("./routes/product"));
app.use("/customer", require("./routes/customer"));
app.use("/bill", require("./routes/bill"));
app.use("/cthd", require("./routes/billInfo"));

const PORT = process.env.PORT;
app.listen(PORT, () => {
  console.log(`Server is running at port ${PORT}`);
});
