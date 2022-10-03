import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

async function main() {
  const uri = Date.now().toString();
  console.log({ uri });

  await prisma.campaign.create({
    data: {
      uri,
    },
  });

  await prisma.campaignFunder.create({
    data: {
      address: `${uri}-address`,
      value: 0,
      campaign: { connect: { uri } },
      events: {
        create: {
          hash: `${uri}-funder`,
          blockNumber: 10,
        },
      },
    },
  });

  const res = await prisma.campaignFunder.findMany({
    where: {
      campaign: { uri },
    },
    orderBy: {
      events: {
        blockNumber: 'desc',
      },
    },
    include: {
      events: true,
    },
  });

  console.log({ res: JSON.stringify(res) });
}

main()
  .then(async () => {
    await prisma.$disconnect();
  })
  .catch(async (e) => {
    console.error(e);
    await prisma.$disconnect();
    process.exit(1);
  });
