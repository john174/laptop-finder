/*
  Warnings:

  - You are about to drop the column `createdAt` on the `LaptopModel` table. All the data in the column will be lost.

*/
-- DropIndex
DROP INDEX `LaptopModel_notebName_name_extraName_key` ON `LaptopModel`;

-- AlterTable
ALTER TABLE `LaptopModel` DROP COLUMN `createdAt`;
