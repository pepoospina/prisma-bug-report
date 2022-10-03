-- CreateTable
CREATE TABLE "Campaign" (
    "uri" TEXT NOT NULL,

    CONSTRAINT "Campaign_pkey" PRIMARY KEY ("uri")
);

-- CreateTable
CREATE TABLE "CampaignFunder" (
    "id" TEXT NOT NULL,
    "campaignId" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "value" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "CampaignFunder_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FundEvent" (
    "hash" TEXT NOT NULL,
    "campaignId" TEXT NOT NULL,
    "funderId" TEXT NOT NULL,
    "blockNumber" INTEGER NOT NULL,

    CONSTRAINT "FundEvent_pkey" PRIMARY KEY ("hash")
);

-- AddForeignKey
ALTER TABLE "CampaignFunder" ADD CONSTRAINT "CampaignFunder_campaignId_fkey" FOREIGN KEY ("campaignId") REFERENCES "Campaign"("uri") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FundEvent" ADD CONSTRAINT "FundEvent_campaignId_fkey" FOREIGN KEY ("campaignId") REFERENCES "Campaign"("uri") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FundEvent" ADD CONSTRAINT "FundEvent_funderId_fkey" FOREIGN KEY ("funderId") REFERENCES "CampaignFunder"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
