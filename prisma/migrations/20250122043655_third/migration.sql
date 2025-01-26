/*
  Warnings:

  - You are about to drop the column `name` on the `Receipt` table. All the data in the column will be lost.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Receipt" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "totalOfPeople" INTEGER NOT NULL,
    "total" REAL NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "new_Receipt" ("createdAt", "id", "total", "totalOfPeople") SELECT "createdAt", "id", "total", "totalOfPeople" FROM "Receipt";
DROP TABLE "Receipt";
ALTER TABLE "new_Receipt" RENAME TO "Receipt";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
