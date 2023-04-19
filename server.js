const express = require("express");
const mysql = require("mysql");
const session = require("express-session");

const dbconn = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "eldomall_db",
});

// dbconn.query("ALTER TABLE users ADD COLUMN password VARCHAR(255) AFTER email");
// dbconn.query("ALTER TABLE users MODIFY COLUMN phone VARCHAR(255)");

const app = express();

app.set("view engine", "ejs");
app.use(express.static("public")); // middleware

app.use(
  session({
    secret: "secret",
    resave: false,
    saveUninitialized: false,
  })
);

app.use((req, res, next) => {
  // authentication logic
  if (req.session.isLoggedIn) {
    res.locals.isLoggedIn = true;
    res.locals.user = req.session.user;
  } else {
    res.locals.isLoggedIn = false;
  }
  next();
});

// body parser middleware
app.use(express.urlencoded({ extended: false }));

app.get(
  "/",
  function (req, res, next) {
    console.log("this is middleware");
    next();
  },
  (req, res) => {
    console.log(req.sessionID);
    res.render("home");
  }
);

app.get("/login", (req, res) => {
  // console.log(req.session.isLoggedIn);
  res.render("login");
});
app.post("/login", (req, res) => {
  // get email and password (req.body)
  // check if email is in db - - SELECT EMAIL, PASSWORD FROM users where email = ?
  // compare email in req.body vs email in resultfrom ===
  dbconn.query(
    `SELECT email,fullname, password FROM users WHERE email = '${req.body.email}'`,
    (error, user) => {
      if (error) {
        // console.error(error);
        res.send("A problem occured");
      }
      if (user.length > 0) {
        if (user[0].password === req.body.password) {
          // create a session
          req.session.user = user[0];
          req.session.isLoggedIn = true;
          res.redirect("/");
        } else {
          res.render("login", {
            errorMessage: "email or password incorret -----",
          });
        }
      } else {
        res.render("login", { errorMessage: "email or password incorret" });
      }
    }
  );
});

app.get("/signup", (req, res) => {
  res.render("signup");
});
app.post("/signup", (req, res) => {
  // console.log(req.body);
  // save the data to the db
  // add id number field on the frontend

  dbconn.query(
    "INSERT INTO users (fullname, email,password,phone,location,id) VALUES(?,?,?,?,?,?)",
    [
      req.body.name,
      req.body.email,
      req.body.password,
      req.body.phone,
      req.body.location,
      req.body.id,
    ],
    (err) => {
      if (err) {
        res.send("a problem occured");
      } else {
        res.redirect("/login");
      }
    }
  );
});
app.get("/account", (req, res) => {
  if (req.session.isLoggedIn) {
    dbconn.query(
      `SELECT * FROM users WHERE email = '${req.session.user.email}'`,
      (err, result) => {
        if (err) {
          res.send("a problem occurred");
        } else {
          res.render("account", { user: result[0] });
        }
      }
    );
  } else {
    res.redirect("/login");
  }
});

app.get("/logout", (req, res) => {
  req.session.destroy((error) => {
    res.redirect("/");
  });
});

app.listen(3003, () => console.log("App running")); // starting the app
