-- CreateTable
CREATE TABLE `LaptopModel` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `notebId` INTEGER NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `extraName` VARCHAR(191) NULL,
    `submodelInfo` JSON NOT NULL,
    `launchDate` DATETIME(3) NULL,

    UNIQUE INDEX `LaptopModel_notebId_key`(`notebId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ModelResource` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `laptopModelId` INTEGER NOT NULL,
    `thumbnail` VARCHAR(191) NULL,
    `images` JSON NOT NULL,
    `officialLink` VARCHAR(191) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Configuration` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `laptopModelId` INTEGER NOT NULL,
    `configId` VARCHAR(191) NOT NULL,
    `price` DOUBLE NOT NULL,
    `score` DOUBLE NOT NULL,
    `batteryLifeHours` VARCHAR(191) NOT NULL,
    `totalStorageCapacity` INTEGER NOT NULL,
    `cpuId` INTEGER NOT NULL,
    `gpuId` INTEGER NOT NULL,
    `displayId` INTEGER NOT NULL,
    `memoryId` INTEGER NOT NULL,
    `primaryStorageId` INTEGER NOT NULL,
    `secondaryStorageId` INTEGER NULL,
    `wirelessCardId` INTEGER NULL,
    `opticalDriveId` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `CPU` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `prod` VARCHAR(191) NOT NULL,
    `model` VARCHAR(191) NOT NULL,
    `lithography` INTEGER NOT NULL,
    `cache` INTEGER NOT NULL,
    `baseSpeed` DOUBLE NOT NULL,
    `boostSpeed` DOUBLE NOT NULL,
    `cores` INTEGER NOT NULL,
    `tdp` INTEGER NOT NULL,
    `integratedVideo` VARCHAR(191) NULL,
    `rating` DOUBLE NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `GPU` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `prod` VARCHAR(191) NOT NULL,
    `model` VARCHAR(191) NOT NULL,
    `architecture` VARCHAR(191) NOT NULL,
    `lithography` INTEGER NOT NULL,
    `shaders` INTEGER NOT NULL,
    `baseSpeed` DOUBLE NOT NULL,
    `boostSpeed` DOUBLE NOT NULL,
    `memorySize` INTEGER NOT NULL,
    `memoryType` VARCHAR(191) NOT NULL,
    `tdp` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Display` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `size` DOUBLE NOT NULL,
    `resolution` VARCHAR(191) NOT NULL,
    `type` VARCHAR(191) NOT NULL,
    `sRGB` INTEGER NULL,
    `touch` BOOLEAN NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Memory` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `size` INTEGER NOT NULL,
    `speed` INTEGER NOT NULL,
    `type` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Storage` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `model` VARCHAR(191) NOT NULL,
    `cap` INTEGER NOT NULL,
    `rpm` INTEGER NULL,
    `readSpeed` DOUBLE NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `WirelessCard` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `model` VARCHAR(191) NOT NULL,
    `speed` DOUBLE NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `OpticalDrive` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `type` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `ModelResource` ADD CONSTRAINT `ModelResource_laptopModelId_fkey` FOREIGN KEY (`laptopModelId`) REFERENCES `LaptopModel`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Configuration` ADD CONSTRAINT `Configuration_laptopModelId_fkey` FOREIGN KEY (`laptopModelId`) REFERENCES `LaptopModel`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Configuration` ADD CONSTRAINT `Configuration_cpuId_fkey` FOREIGN KEY (`cpuId`) REFERENCES `CPU`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Configuration` ADD CONSTRAINT `Configuration_gpuId_fkey` FOREIGN KEY (`gpuId`) REFERENCES `GPU`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Configuration` ADD CONSTRAINT `Configuration_displayId_fkey` FOREIGN KEY (`displayId`) REFERENCES `Display`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Configuration` ADD CONSTRAINT `Configuration_memoryId_fkey` FOREIGN KEY (`memoryId`) REFERENCES `Memory`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Configuration` ADD CONSTRAINT `Configuration_primaryStorageId_fkey` FOREIGN KEY (`primaryStorageId`) REFERENCES `Storage`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Configuration` ADD CONSTRAINT `Configuration_secondaryStorageId_fkey` FOREIGN KEY (`secondaryStorageId`) REFERENCES `Storage`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Configuration` ADD CONSTRAINT `Configuration_wirelessCardId_fkey` FOREIGN KEY (`wirelessCardId`) REFERENCES `WirelessCard`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Configuration` ADD CONSTRAINT `Configuration_opticalDriveId_fkey` FOREIGN KEY (`opticalDriveId`) REFERENCES `OpticalDrive`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
