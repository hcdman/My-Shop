const mysql = require("mysql");
const argon2 = require("argon2"); //hash password

const db = mysql.createConnection({
  host: process.env.DATABASE_HOST,
  user: process.env.DATABASE_USER,
  password: process.env.DATABASE_PASSWORD,
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
        });
      }

      if (result.length > 0)
        return res.json({
          message: "Username is already taken",
        });

      if (password !== confirm_password)
        return res.json({
          message: "Password does not match",
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
            });
          } else
            return res.json({
              message: "User Registration Success",
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
      });
    }
    db.query(
      "select * from account where Username=?",
      [username],
      async (error, result) => {
        if (result.length <= 0) {
          return res.status(402).json({
            message: "Username or Password Incorrect...",
          });
        } else {
          const passwordValid = await argon2.verify(
            result[0].Password,
            password
          );
          if (!passwordValid) {
            return res.status(402).json({
              message: "Username or Password Incorrect...",
            });
          }

          const { Available } = result[0];
          if (Available === 0) {
            let date = new Date(result[0].Startday);
            let currentDay = new Date();
            let Difference_In_Time = currentDay.getTime() - date.getTime();

            let Difference_In_Days = Difference_In_Time / (1000 * 3600 * 24);

            if (Difference_In_Days > 15) {
              return res.status(400).json({
                message: `code`,
              });
            }
          }

          return res.status(200).json({
            message: `Hello ${username}`,
          });
        }
      }
    );
  } catch (error) {
    console.log(error);
    return res.status(400).json({
      message: "Server error",
    });
  }
};

exports.active = async (req, res) => {
  try {
    const { username, password, code } = req.body;

    if (!username || !password) {
      return res.status(400).json({
        message: "Please Enter Your Username and Passsword",
      });
    }

    db.query(
      "select * from account where Username=?",
      [username],
      async (error, result) => {
        if (result.length <= 0) {
          return res.status(402).json({
            message: "Username or Password Incorrect...",
          });
        } else {
          const passwordValid = await argon2.verify(
            result[0].Password,
            password
          );
          if (!passwordValid) {
            return res.status(402).json({
              message: "Username or Password Incorrect...",
            });
          }

          const { Available } = result[0];
          let valid = true;

          if (Available === 0) {
            let date = new Date(result[0].Startday);
            let currentDay = new Date();
            let Difference_In_Time = currentDay.getTime() - date.getTime();

            let Difference_In_Days = Difference_In_Time / (1000 * 3600 * 24);

            if (Difference_In_Days > 15) {
              // check code
              valid = false;
            }
          }

          if (!valid) {
            await db.query(
              "select * from code where code=?",
              [code],
              async (error, result) => {
                if (result.length <= 0) {
                  return res.status(400).json({
                    message: `Invalid Code, please check again`,
                  });
                } else {
                  db.query(
                    "delete from code where id=?",
                    [result[0].id],
                    async (error, result) => {
                      db.query(
                        "update account set Available = 1 where Username = ?",
                        [username],
                        async (e, result) => {
                          return res.status(200).json({
                            message: `Hello ${username}`,
                          });
                        }
                      );
                    }
                  );
                }
              }
            );
          } else {
            return res.status(200).json({
              message: `Hello ${username}`,
            });
          }
        }
      }
    );
  } catch (error) {
    console.log(error);
    return res.status(400).json({
      message: "Server error",
    });
  }
};

exports.addCode = async (req, res) => {
  const { code } = req.body;

  db.query("insert into code set ?", { code }, (error, result) => {
    if (error) {
      console.log(error);
      return res.status(400).json({
        message: "Server error",
      });
    } else
      return res.json({
        message: "Add new code successfully!!!",
      });
  });
};
