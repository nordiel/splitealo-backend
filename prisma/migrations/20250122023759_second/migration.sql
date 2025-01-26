/*
  Warnings:

  - Added the required column `name` to the `Receipt` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Receipt" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "totalOfPeople" INTEGER NOT NULL,
    "total" REAL NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "new_Receipt" ("createdAt", "id", "total", "totalOfPeople") SELECT "createdAt", "id", "total", "totalOfPeople" FROM "Receipt";
DROP TABLE "Receipt";
ALTER TABLE "new_Receipt" RENAME TO "Receipt";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
