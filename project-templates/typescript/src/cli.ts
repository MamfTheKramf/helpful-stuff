import { parse } from 'ts-command-line-args';


/**
 * Exit code for CLI parsing errors
 */
export const EX_CLI_ERR = 15;

/**
 * Exit code for log configuration errors
 */
export const EX_LOG_ERR = 16;


/**
 * Available command line arguments
 */
export type Args = {
    /**
     * Path to the OpenAPI-Specification file, either a local file or a remote URL
     */
    oas: string;

    /**
     * Port the server should listen on
     */
    port: number;

    /**
     * Path to the log configuration file
     */
    logConfig: string;

    /**
     * Prints the help guide
     */
    help?: boolean;
};


/**
 * Parses the arguments passed to the command line.
 * Npm run scripts pass the arguments after a double dash (--) to the command.
 * Depending on the node version, two double dashes (-- --) may be required.
 *
 * @returns The parsed command line arguments
 */
export function parseArgs(): Args {
    return parse<Args>({
        oas: { type: String, description: 'Path to the OpenAPI-Specification file' },
        port: { type: Number, alias: 'p', defaultValue: 12000, description: 'Port to listen on'},
        logConfig: { type: String, defaultValue: './logConfig.json', description: 'Path to the logging configuration file. The content must be a configuration object like here: https://log4js-node.github.io/log4js-node/api.html#configuration-object'},
        help: { type: Boolean, optional: true, alias: 'h', description: 'Prints this help guide' }
    }, {
        helpArg: 'help'
    });
}

/**
 * Parses the arguments passed to the command line.
 * Exits the process with exit code EX_CLI_ERR if the arguments couldn't be parsed.
 *
 * Npm run scripts pass the arguments after a double dash (--) to the command.
 * Depending on the node version, two double dashes (-- --) may be required.
 *
 * @returns The parsed command line arguments.
 */
export function parseArgsExitOnError(): Args {
    try {
        return parseArgs();
    } catch (error) {
        console.error('Couldn\'t read command line args.', error);
        console.error('Args: ', process.argv);
        process.exit(EX_CLI_ERR);
    }
}

