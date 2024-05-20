const express = require('express');
const logger = require('./middlewares/logger');
const app = express();
const port = 3000;

const modelRoutes = require('./routes/index'); 

app.use(logger);

app.use('/', modelRoutes);

app.listen(port, () => {
    console.log(`Server running on http://localhost:${port}`);
});
