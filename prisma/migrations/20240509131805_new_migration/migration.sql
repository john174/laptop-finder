/*
  Warnings:

  - You are about to drop the column `notebId` on the `LaptopModel` table. All the data in the column will be lost.
  - You are about to drop the `CPU` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Configuration` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Display` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `GPU` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Memory` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `OpticalDrive` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Storage` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `WirelessCard` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[notebName,name,extraName]` on the table `LaptopModel` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `notebName` to the `LaptopModel` table without a default value. This is not possible if the table is not empty.
  - Added the required column `launchDate` to the `ModelResource` table without a default value. This is not possible if the table is not empty.
  - Added the required column `primaryModel` to the `ModelResource` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `Configuration` DROP FOREIGN KEY `Configuration_cpuId_fkey`;

-- DropForeignKey
ALTER TABLE `Configuration` DROP FOREIGN KEY `Configuration_displayId_fkey`;

-- DropForeignKey
ALTER TABLE `Configuration` DROP FOREIGN KEY `Configuration_gpuId_fkey`;

-- DropForeignKey
ALTER TABLE `Configuration` DROP FOREIGN KEY `Configuration_laptopModelId_fkey`;

-- DropForeignKey
ALTER TABLE `Configuration` DROP FOREIGN KEY `Configuration_memoryId_fkey`;

-- DropForeignKey
ALTER TABLE `Configuration` DROP FOREIGN KEY `Configuration_opticalDriveId_fkey`;

-- DropForeignKey
ALTER TABLE `Configuration` DROP FOREIGN KEY `Configuration_primaryStorageId_fkey`;

-- DropForeignKey
ALTER TABLE `Configuration` DROP FOREIGN KEY `Configuration_secondaryStorageId_fkey`;

-- DropForeignKey
ALTER TABLE `Configuration` DROP FOREIGN KEY `Configuration_wirelessCardId_fkey`;

-- DropIndex
DROP INDEX `LaptopModel_notebId_key` ON `LaptopModel`;

-- AlterTable
ALTER TABLE `LaptopModel` DROP COLUMN `notebId`,
    ADD COLUMN `notebName` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `ModelResource` ADD COLUMN `launchDate` DATETIME(3) NOT NULL,
    ADD COLUMN `officialLink2` VARCHAR(191) NULL,
    ADD COLUMN `primaryModel` INTEGER NOT NULL;

-- DropTable
DROP TABLE `CPU`;

-- DropTable
DROP TABLE `Configuration`;

-- DropTable
DROP TABLE `Display`;

-- DropTable
DROP TABLE `GPU`;

-- DropTable
DROP TABLE `Memory`;

-- DropTable
DROP TABLE `OpticalDrive`;

-- DropTable
DROP TABLE `Storage`;

-- DropTable
DROP TABLE `WirelessCard`;

-- CreateIndex
CREATE UNIQUE INDEX `LaptopModel_notebName_name_extraName_key` ON `LaptopModel`(`notebName`, `name`, `extraName`);
