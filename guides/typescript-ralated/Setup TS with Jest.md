# Setup Jest for a TypeScript project

Do normal TS setup first

then...

1. rename `tsconfig.json` (e.g., to `tsconfig-base.json`)
2. create new `tsconfig.json` with following content:

        {
            "extends": "./tsconfig-base.json",
            "exclude": [
                "./tests/*"
            ]
        }

3. run

        npm install --save-dev jest ts-jest @types/jest

4. create file 'jest.config.js' with following content:

        /** @type {import('ts-jest').JestConfigWithTsJest} */
        module.exports = {
            preset: 'ts-jest',
            testEnvironment: 'node',
        };

5. add 'test'-script in 'package.json' (write 'jest' as value)
5. add test-files into 'tests' directory (files that contains tests should end with '.test.ts')