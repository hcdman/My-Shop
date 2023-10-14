const mysql = require("mysql");
const argon2 = require("argon2"); //hash password

const db = mysql.createConnection({
  host: process.env.DATABASE_HOST,
  user: process.env.DATABASE_USER,
  database: process.env.DATABASE,
});

exports.register = (req, res) => {
  const { username, password, confirm_password } = req.body;
  db.query(
    "select Username from account where Username=?",
    [username],
    async (error, result) => {
      if (error) {
        console.log(error);
        return res.status(400).json({
          message: "Server error",
          success: false,
        });
      }

      if (result.length > 0)
        return res.json({
          message: "Username is already taken",
          success: false,
        });

      if (password !== confirm_password)
        return res.json({
          message: "Password does not match",
          success: false,
        });

      const hashedPassword = await argon2.hash(password);

      db.query(
        "insert into account set ?",
        { Username: username, Password: hashedPassword, Available: 0 },
        (error, result) => {
          if (error) {
            console.log(error);
            return res.status(400).json({
              message: "Server error",
              success: false,
            });
          } else
            return res.json({
              message: "User Registration Success",
              success: true,
            });
        }
      );
    }
  );
};

exports.login = async (req, res) => {
  try {
    const { username, password } = req.body;
    if (!username || !password) {
      return res.status(400).json({
        message: "Please Enter Your Username and Passsword",
        success: false,
      });
    }

    db.query(
      "select * from account where Username=?",
      [username],
      async (error, result) => {
        if (result.length <= 0) {
          return res.status(402).json({
            message: "Username or Password Incorrect...",
            success: false,
          });
        } else {
          const passwordValid = await argon2.verify(
            result[0].Password,
            password
          );
          if (!passwordValid) {
            return res.status(402).json({
              message: "Username or Password Incorrect...",
              success: false,
            });
          }
          return res.status(200).json({
            message: `Hello ${username}`,
            success: true,
          });
        }
      }
    );
  } catch (error) {
    console.log(error);
    return res.status(400).json({
      message: "Server error",
      success: false,
    });
  }
};
