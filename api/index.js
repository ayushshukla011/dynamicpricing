const express = require('express')
const cors = require('cors')
require('dotenv').config();
const swaggerUi=require('swagger-ui-express');
const YAML=require('yamljs');
const path = require('path');


const app=express()
app.use(cors())
app.use(express.json())



// Construct the absolute path to your Swagger YAML file
const swaggerFilePath = path.resolve(__dirname, '..', 'Docs', 'swagger.yaml');
// Load your Swagger YAML file
const swaggerDocument = YAML.load(swaggerFilePath);

// Serve Swagger UI on the root URL
app.use('/', swaggerUi.serve);
app.get('/', swaggerUi.setup(swaggerDocument));

//adding routes
app.use('',require('./routes/delivery.js'))

const port= process.env.PORT || 5000;
app.listen(port,()=>{
    console.log(`Inotebook backend  listening at http://localhost:${port}`)
})