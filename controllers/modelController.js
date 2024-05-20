const axios = require('axios');

exports.getModelInfo = async (req, res) => {
    const apiUrl = process.env.API_URL;
    const params = new URLSearchParams({
        apikey: process.env.API_KEY,
        method: 'get_model_info',
        'param[model_id]': req.query.model_id
    });

    try {
        const response = await axios.post(apiUrl, params);
        res.send(response.data);
    } catch (error) {
        console.error('Error making API call:', error);
        res.status(500).send('Failed to retrieve data');
    }
};

exports.listModels = async (req, res) => {
    const apiUrl = process.env.API_URL;
    let params = new URLSearchParams({
        apikey: process.env.API_KEY,
        method: 'list_models',
        'param[model_name]': req.query.model_name || '' 
    });

    try {
        const response = await axios.post(apiUrl, params);
        const data = response.data;
        res.send(data);
    } catch (error) {
        console.error('Error making API call:', error);
        res.status(500).send('Failed to retrieve data');
    }
};

exports.getModelInfoAll = async (req, res) => {
    const apiUrl = process.env.API_URL;
    const params = new URLSearchParams({
        apikey: process.env.API_KEY,
        method: 'get_model_info_all',
        'param[model_id]': req.query.model_id
    });

    try {
        const response = await axios.post(apiUrl, params);
        res.send(response.data);
    } catch (error) {
        console.error('Error making API call:', error);
        res.status(500).send('Failed to retrieve data');
    }
};