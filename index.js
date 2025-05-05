const express = require('express')
const app = express()
const ejs = require('ejs')
const expressSession = require('express-session')
const flash = require('connect-flash')
const dotenv = require("dotenv");
const bcrypt = require('bcrypt');
const jwt = require("jsonwebtoken")
const pg = require("pg");


const { Pool } = require("pg");

const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'Admin_Project',
  password: 'admin',
  port: 5432,
});





//controllers
const indexControllers = require('./controllers/indexControllers')
const loginControllers = require('./controllers/loginControllers')
const registerControllers = require('./controllers/registerControllers')


app.use(express.static('public'))
app.use(express.json())
app.use(express.urlencoded())
app.use(flash())
app.set('view engine', 'ejs')

app.get('/', indexControllers)
app.get('/login', loginControllers)
app.get('/register', registerControllers)
app.post('/login', async (req, res) => {
    const { username, password } = req.body;
    console.log("Login Attempt:", username, password);

    try {
        const result = await pool.query('SELECT * FROM users WHERE username = $1', [username]);

        if (result.rows.length === 0) {
            return res.send('ไม่พบบัญชีผู้ใช้');
        }

        const user = result.rows[0];
        const match = await bcrypt.compare(password, user.password);

        if (!match) {
            return res.send('รหัสผ่านไม่ถูกต้อง');
        }

        res.send(`ยินดีต้อนรับ ${user.username}`);
    } catch (err) {
        console.error('เกิดข้อผิดพลาด:', err);  // ดูตรงนี้
        res.status(500).send('เกิดข้อผิดพลาดของระบบ');
    }
});



app.listen(3000, () =>{
    console.log("App listening on port 3000")
})