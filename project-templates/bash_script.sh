#!/bin/bash

# specify arguments here
DUMMY_ARG=5

printUsage() {
        cat << EndOfMessage

        Usage: $0 [-d DUMMY_ARG] [-h]

        Options:
                -d DUMMY_ARG : Some dummy arg to test cli args (default: ${DUMMY_ARG})

EndOfMessage
}

# parse cli args
while getopts ":d:h" opt; do
        case ${opt} in
                d)
                        DUMMY_ARG=${OPTARG}
                        ;;
                h)
                        printUsage
                        exit 0
                        ;;
                :)
                        echo "Option -${OPTARG} requires argument"
                        printUsage
                        exit 1
                        ;;
                ?)
                        echo "Invalid option: -${OPTARG}"
                        printUsage
                        exit 1
                        ;;
        esac
done

echo "DUMMY_ARG: ${DUMMY_ARG}"
