/*
  Warnings:

  - A unique constraint covering the columns `[selfId]` on the table `LaptopModel` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `selfId` to the `LaptopModel` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `LaptopModel` ADD COLUMN `selfId` INTEGER NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX `LaptopModel_selfId_key` ON `LaptopModel`(`selfId`);
