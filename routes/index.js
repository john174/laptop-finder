const express = require('express');
const router = express.Router();
const modelController = require('../controllers/modelController'); 

router.get('/get-model-info', modelController.getModelInfo);
router.get('/get-model-info-all', modelController.getModelInfoAll);
router.get('/list-models', modelController.listModels);

module.exports = router;
