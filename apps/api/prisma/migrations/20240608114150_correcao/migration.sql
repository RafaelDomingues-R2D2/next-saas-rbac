/*
  Warnings:

  - You are about to drop the column `userId` on the `invites` table. All the data in the column will be lost.
  - You are about to drop the column `user_id` on the `projects` table. All the data in the column will be lost.
  - Added the required column `owne_id` to the `projects` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "invites" DROP CONSTRAINT "invites_userId_fkey";

-- DropForeignKey
ALTER TABLE "projects" DROP CONSTRAINT "projects_user_id_fkey";

-- AlterTable
ALTER TABLE "invites" DROP COLUMN "userId",
ADD COLUMN     "author_id" TEXT;

-- AlterTable
ALTER TABLE "projects" DROP COLUMN "user_id",
ADD COLUMN     "owne_id" TEXT NOT NULL;

-- AddForeignKey
ALTER TABLE "invites" ADD CONSTRAINT "invites_author_id_fkey" FOREIGN KEY ("author_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "projects" ADD CONSTRAINT "projects_owne_id_fkey" FOREIGN KEY ("owne_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
