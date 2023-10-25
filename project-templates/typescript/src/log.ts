import * as log4js from 'log4js';

import { EX_LOG_ERR } from './cli';


/**
 * Configures the log4js with the given configuration file
 * @param logConfigFile The path to the log configuration file
 * @param exitOnError True, if the process should exit on error, e.g. for the first configuration before the server is started.
 * False, if the process should not exit on error, e.g. for reconfigurations during runtime.
 * @param logger The logger to log any configuration errors to. Optional. If not given, the errors will be logged to the console.
 */
export function configureLog(
    logConfigFile: string,
    exitOnError = true,
    logger?: log4js.Logger
) {
    try {
        log4js.configure(logConfigFile);
    } catch (error) {
        const msg = 'Couldn\'t configure logger. Make sure, your configuration file exists and has the correct format.';
        if (logger) {
            logger.warn(msg, error);
        } else {
            console.error(msg, error);
        }
        if (exitOnError) {
            process.exit(EX_LOG_ERR);
        }
    }
}

/**
 * Configures the logger and adds a signal handler to reconfigure the logger on SIGUSR1
 * @param logConfigFile The path to the log configuration file
 * @param logger The logger to log the reconfiguration event to
 */
export function configureLogWithReconfiguration(logConfigFile: string, logger: log4js.Logger) {
    configureLog(logConfigFile);

    process.on('SIGUSR1', () => {
        logger.info('Recieved SIGUSR1 ==> reconfigure logger');
        configureLog(logConfigFile, false, logger);
    });
}
