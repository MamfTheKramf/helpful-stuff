# Setup new TypeScript project

<b>Note:</b> I'd recommend using the [TS-template](../project-templates/typescript/) but if you really want a fresh start, use this guide.

1. go into empty prject folder
2.

        npm init
        npm install --save-dev typescript @types/node
        npx tsc --init

3. in `tsconfig.json` set `rootDir` and `outDir`
4. add `build` script for `npm run`

        ...
        "build": "tsc"
        ...
