const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

async function showAllData() {
    try {
        // Fetch all LaptopModel entries including related resources
        const laptopModels = await prisma.laptopModel.findMany({
            include: {
                resources: true, // Include related resources
            }
        });

        console.log("Laptop Models and Their Resources:");
        console.log(JSON.stringify(laptopModels, null, 2));

        // Add additional fetch queries for other models if needed
        // For example, to fetch Configurations:
        // const configurations = await prisma.configuration.findMany();
        // console.log("Configurations:");
        // console.log(JSON.stringify(configurations, null, 2));

    } catch (error) {
        console.error('Error fetching data from the database:', error);
    } finally {
        await prisma.$disconnect(); // Disconnect the Prisma client
    }
}

showAllData();
