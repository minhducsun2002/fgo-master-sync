import { config } from 'dotenv'; config();
import { execSync } from 'child_process';
import { readdirSync } from 'fs';
import { basename, join } from 'path';
import chalk from 'chalk';

const { HOST, USER, PASSWORD } = process.env

readdirSync('./dataset').forEach(variation => {
    const basePath = `./dataset/${variation}/master`;
    readdirSync(basePath).forEach(fileName => {
        const fullPath = join(basePath, fileName);
        if ((require(`../${fullPath}`) as any[]).length == 0) return;
        const collectionName = basename(fullPath, '.json');
        console.log(`Pushing ${chalk.green(fullPath)} to ${variation}.${chalk.yellow(collectionName)}`)
        const cmd = `mongoimport --host ${HOST} --port 27017 --username ${USER} --password ${PASSWORD} --ssl --collection ${
            collectionName
        } --file ${fullPath} --jsonArray --drop --authenticationDatabase admin --db ${variation}`
        execSync(cmd, { stdio: 'inherit' })
    })
})