# Setup ESBuild for a TypeScript project

```Bash
npm install --save-dev esbuild
```

In package.json:

```JSON
...

"build": "esbuild src/index.js --bundle --minify --sourcemap --outfile=dist/index.min.js"

...
```