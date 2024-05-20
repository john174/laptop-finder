const axios = require('axios');

const apiUrl = 'https://noteb.com/api/webservice.php';

exports.makeApiRequest = async (method, params) => {
    const urlParams = new URLSearchParams({
        apikey: process.env.API_KEY, ...params
    });

    try {
        return await axios.post(apiUrl, urlParams);
    } catch (error) {
        console.error(`API Request Failed: ${error}`);
        throw error;
    }
}