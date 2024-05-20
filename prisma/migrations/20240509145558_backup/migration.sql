/*
  Warnings:

  - You are about to drop the column `apiModelId` on the `LaptopModel` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[notebName,name,extraName]` on the table `LaptopModel` will be added. If there are existing duplicate values, this will fail.

*/
-- DropIndex
DROP INDEX `LaptopModel_apiModelId_key` ON `LaptopModel`;

-- AlterTable
ALTER TABLE `LaptopModel` DROP COLUMN `apiModelId`,
    ADD COLUMN `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3);

-- CreateIndex
CREATE UNIQUE INDEX `LaptopModel_notebName_name_extraName_key` ON `LaptopModel`(`notebName`, `name`, `extraName`);
