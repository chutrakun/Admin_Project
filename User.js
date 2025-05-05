// // const express = require('express')
// // const app = express()
// // const ejs = require('ejs')
// // const expressSession = require('express-session')
// // const flash = require('connect-flash')
// // const dotenv = require("dotenv");
// // const bcrypt = require('bcrypt');
// // const jwt = require("jsonwebtoken")
// // const pg = require("pg");


// // // app.post("/register", async (req, res) => {
// // //     try {
// // //         const { username, email, password } = req.body;
// // //         const hasgedPassword = await bcrypt.hash(password, 10);

// // //         const result = await pool.query(
// // //             "INSERT INTO user"
// // //         )
// // //     }
// // // })

// // app.post("/login", async (req, res) => {
// //     try {
// //         const { username , password } = req.body;

// //         const result = await pool.query("SELECT * FROM user WHERE username = $1", [
// //             username
// //         ]);

// //         const user = result.rows[0];
// //         if (!user) {
// //             return res.status(400). json({ message: "Invalid Credentiadls" });
// //         }

// //         const isPasswordMatch = await bcrypt.compare(password, user.password);
// //         if (!isPasswordMatch) {
// //             return res.status(400).json({ message: "Invalid Credentials"});
// //         }

// //         const token = jwt.sign({ userId: user.id }, process.env.SECRET_KEY, {
// //             expiresIn: "lh"
// //         });
// //         res.json({ token });
// //     } catch (error) {
// //         console.error(error.message);
// //         res.status(500).send("Server Error");
// //     }
    
// // });

// // function verifyToken(req, res, next) {
// //     const token = 
// //     req.headers.authorization && req.headers.authorization.split(" ")[l];

// // if (!token) {
// //     return res.status(401).json({ message: "Missing token"});
// // }

// // try {
// //     const decoded = jwt.verify(token, process.env.SECRET_KEY);
// //     req.user = decoded;
// //     next();
// // } catch (error){
// //     console.error("Token veirfication failed:", error.message);
// //     res.status(401).json({ message: "Invalid token"});
// // }

// // }



// const express = require('express');
// const bodyParser = require('body-parser');
// const { Pool } = require('pg');

// const app = express();
// const port = 3000;

// // เชื่อมต่อฐานข้อมูล PostgreSQL
// const pool = new Pool({
//   user: 'your_pg_user',
//   host: 'localhost',
//   database: 'Admin_Project',
//   password: 'admin',
//   port: 5432, // default PostgreSQL port
// });

// app.use(bodyParser.urlencoded({ extended: true }));
// app.use(bodyParser.json());

// // ให้ Express รับ static HTML
// app.use(express.static('public')); // สมมุติว่าไฟล์ login.html อยู่ในโฟลเดอร์ public

// // ตรวจสอบการ login
// app.post('/login', async (req, res) => {
//   const { username, password } = req.body;

//   try {
//     const result = await pool.query(
//       'SELECT * FROM users WHERE username = $1 AND password = $2',
//       [username, password]
//     );

//     if (result.rows.length > 0) {
//       // Login สำเร็จ
//       res.send('Login สำเร็จ! ยินดีต้อนรับ ' + result.rows[0].username);
//     } else {
//       // Login ไม่สำเร็จ
//       res.status(401).send('Username หรือ Password ไม่ถูกต้อง');
//     }
//   } catch (err) {
//     console.error(err);
//     res.status(500).send('เกิดข้อผิดพลาดของระบบ');
//   }
// });

// // เริ่มเซิร์ฟเวอร์
// app.listen(port, () => {
//   console.log(`Server is running on http://localhost:${port}`);
// });
