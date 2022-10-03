-- CreateTable
CREATE TABLE "CampaignFunder" (
    "id" TEXT NOT NULL,

    CONSTRAINT "CampaignFunder_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FundEvent" (
    "hash" TEXT NOT NULL,
    "funderId" TEXT NOT NULL,
    "blockNumber" INTEGER NOT NULL,

    CONSTRAINT "FundEvent_pkey" PRIMARY KEY ("hash")
);

-- AddForeignKey
ALTER TABLE "FundEvent" ADD CONSTRAINT "FundEvent_funderId_fkey" FOREIGN KEY ("funderId") REFERENCES "CampaignFunder"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
