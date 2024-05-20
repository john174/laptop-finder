const axios = require('axios');
const { PrismaClient } = require('@prisma/client');

const prisma = new PrismaClient();
const API_URL = process.env.API_URL;
const API_KEY = process.env.API_KEY;

/**
 * Fetches all model data from the API in a single call.
 */
async function fetchAllModels() {
    const params = new URLSearchParams({
        apikey: API_KEY,
        method: 'list_models',
        'param[model_name]': ''  // Ensuring this is included even if empty
    });

    try {
        const response = await axios.post(API_URL, params);
        console.log("API Response:", response.data);  // Log the full API response
        const data = response.data.result || {};
        return { models: Object.values(data) };
    } catch (error) {
        console.error('Failed to fetch models from API:', error);
        throw error;
    }
}

/**
 * Store models into the database using a transaction.
 */
async function storeModels(models) {
    const transactions = models.map(model => {
        if (!model.model_info || model.model_info.length === 0) {
            console.error("Model info is undefined or empty, skipping model:", model);
            return null;
        }
        const modelData = model.model_info[0]; // Assuming model_info contains at least one item
        return prisma.laptopModel.upsert({
            where: {
                notebName_name_extraName: {
                    notebName: modelData.noteb_name,
                    name: modelData.name,
                    extraName: modelData.extra_name || '',
                }
            },
            update: {
                selfId: modelData.id,
                submodelInfo: JSON.stringify(modelData.submodel_info || []),
                launchDate: new Date(model.model_resources.launch_date)
            },
            create: {
                selfId: modelData.id,
                notebName: modelData.noteb_name,
                name: modelData.name,
                extraName: modelData.extra_name || '',
                submodelInfo: JSON.stringify(modelData.submodel_info || []),
                launchDate: new Date(model.model_resources.launch_date)
            }
        });
        
        
    }).filter(transaction => transaction !== null);
    

    try {
        await prisma.$transaction(transactions);
        console.log('All models have been stored in the database.');
    } catch (error) {
        console.error('Failed to store models:', error);
    }
}


/**
 * Orchestrate the whole process.
 */
async function fetchAndStoreModels() {
    try {
        const { models } = await fetchAllModels();
        console.log(`Total model count fetched: ${models.length}`);
        await storeModels(models);
    } catch (error) {
        console.error('Unexpected error occurred:', error);
    } finally {
        await prisma.$disconnect();
    }
}

// Execute the script
fetchAndStoreModels();
