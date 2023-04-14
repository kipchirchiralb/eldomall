const express = require("express");
const mysql = require("mysql");
const dbconn = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "eldomall_db",
});
dbconn.connect((err, conn) => {
  console.log(conn);
});
// dbconn.query("ALTER TABLE users ADD COLUMN password VARCHAR(255) AFTER email");
// dbconn.query("ALTER TABLE users MODIFY COLUMN phone VARCHAR(255)");

const app = express();

app.set("view engine", "ejs");
app.use(express.static("public")); // middleware
app.use((req, res, next) => {
  console.log("this is another middleware-- running in all routes");
  // authentication logic
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
    res.render("home");
  }
);

app.get("/login", (req, res) => {
  res.render("login");
});

app.get("/signup", (req, res) => {
  res.render("signup");
});
app.post("/signup", (req, res) => {
  console.log(req.body);
  // save the data to the db
  dbconn.query(
    "INSERT INTO users (fullname, email,password,phone,location,id) VALUES(?,?,?,?,?,?)",
    [
      req.body.name,
      req.body.email,
      req.body.password,
      req.body.phone,
      req.body.location,
      87872872,
    ],
    (err) => {
      if (err) console.log(err);
      res.redirect("/login");
    }
  );
});

app.listen(3003, () => console.log("App running")); // starting the app
