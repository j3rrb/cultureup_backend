-- CreateTable
CREATE TABLE "Auth" (
    "id" SERIAL NOT NULL,
    "salt" TEXT NOT NULL,
    "hash" TEXT NOT NULL,
    "resetToken" TEXT NOT NULL,
    "resetTokenExp" TEXT NOT NULL,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "Auth_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "username" VARCHAR(20) NOT NULL,
    "photo" TEXT NOT NULL,
    "isActive" BOOLEAN NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AditionalInfo" (
    "id" SERIAL NOT NULL,
    "zip" VARCHAR(15) NOT NULL,
    "street" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "country" TEXT NOT NULL DEFAULT E'Brazil',
    "number" INTEGER NOT NULL,
    "phone" VARCHAR(20) NOT NULL,
    "phoneDDI" VARCHAR(5) NOT NULL,
    "phoneDDD" VARCHAR(5) NOT NULL,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "AditionalInfo_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Company" (
    "id" SERIAL NOT NULL,
    "companyId" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Company_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Employee" (
    "id" SERIAL NOT NULL,
    "employeeId" TEXT NOT NULL,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "birthday" TEXT NOT NULL,

    CONSTRAINT "Employee_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CompanyEmployee" (
    "id" SERIAL NOT NULL,
    "companyId" INTEGER NOT NULL,
    "employeeId" INTEGER NOT NULL,

    CONSTRAINT "CompanyEmployee_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Rate" (
    "id" SERIAL NOT NULL,
    "message" TEXT NOT NULL,
    "type" BOOLEAN NOT NULL,
    "time" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Rate_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "Auth_id_idx" ON "Auth"("id");

-- CreateIndex
CREATE INDEX "User_id_idx" ON "User"("id");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_username_key" ON "User"("email", "username");

-- CreateIndex
CREATE INDEX "AditionalInfo_id_idx" ON "AditionalInfo"("id");

-- CreateIndex
CREATE INDEX "Company_id_idx" ON "Company"("id");

-- CreateIndex
CREATE INDEX "Employee_id_idx" ON "Employee"("id");

-- CreateIndex
CREATE INDEX "Rate_id_idx" ON "Rate"("id");

-- AddForeignKey
ALTER TABLE "Auth" ADD CONSTRAINT "Auth_id_fkey" FOREIGN KEY ("id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AditionalInfo" ADD CONSTRAINT "AditionalInfo_id_fkey" FOREIGN KEY ("id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CompanyEmployee" ADD CONSTRAINT "CompanyEmployee_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES "Company"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CompanyEmployee" ADD CONSTRAINT "CompanyEmployee_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES "Employee"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
