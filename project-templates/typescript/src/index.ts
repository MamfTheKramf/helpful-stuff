import * as log4js from 'log4js';

import { parseArgsExitOnError } from './cli';
import { configureLogWithReconfiguration } from './log';


const args = parseArgsExitOnError();

const logger = log4js.getLogger('GraphQL');
configureLogWithReconfiguration(args.logConfig, logger);
