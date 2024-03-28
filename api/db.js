const { Pool } = require('pg');
require('dotenv').config();


const pool = new Pool({
    user: "ayush",
    host: "dpg-co20g9q1hbls73a4eiog-a.oregon-postgres.render.com",
    database: "dprice",
    password: process.env.DB_PASS,
    port: "5432",
    ssl: {
        rejectUnauthorized: false // This is necessary if you're using self-signed certificates
      }
});


//to test connection
const connectToDb=async ()=>{
    try {
        const client = await pool.connect();
        console.log("connection successfull");
       
        
        
        client.release();
    } catch (err) {
        console.error('Error executing query', err);
        
    }
}

module.exports=pool;