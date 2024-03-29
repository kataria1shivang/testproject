var express = require('express'),
    employees = require('./routes/employees'),
    app = express();

app.use(express.static('www'));

// CORS (Cross-Origin Resource Sharing) headers to support Cross-site HTTP requests
app.all('*', function(req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "X-Requested-With");
    next();
});

app.get('/employees', employees.findAll);
app.get('/employees/:id', employees.findById);

app.set(5000);

app.listen(app.get(5000), function () {
    console.log('Express server listening on port ' + app.get(5000));
});
