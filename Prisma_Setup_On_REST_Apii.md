## Add the Prisma CLI as a development dependency to your project:
$ npm install prisma --save-dev

## Now invoke the Prisma CLI by prefixing it with npx:
$ npx prisma

## Set up your Prisma ORM project by creating your Prisma Schema file with the following command:
$ npx prisma init --datasource-provider postgresql --output ../generated/prisma


## Add a line to your *.gitignore* in order to exclude the generated client from your application. In this example, we want to exclude the generated/prisma directory.
generated/prisma/

## Install and generate Prisma Client:
$ npm install @prisma/client

## Then, run prisma generate which reads your Prisma schema and generates the Prisma Client.
$ npx prisma generate

![prisma_gif](https://github.com/user-attachments/assets/135f8eaa-8576-446c-87c3-3b65cdc748e7)

## Now import prismaclient and use in controllers or getting things to do with database:
import { PrismaClient } from '@prisma/client';
const prisma = new PrismaClient();
//like this 
async function main() {
  const allUsers = await prisma.user.findMany()
  console.log(allUsers)
}
