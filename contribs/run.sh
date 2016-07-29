#!/bin/bash

WORKSPACE=/opt/jmvc

if [ $# -ne 0 ]; then 
	RUN_COMMAND=$1
	shift
fi

case "$RUN_COMMAND" in
    build)
        npm run build
    ;;
    run)
        npm run $@
    ;;
    server)
	    cd ${WORKSPACE} && http-server -p 80
    ;;
    -h|-\?|--help)
        cat /README.md
        exit 127;
    ;;
    *)
	    echo "Unsupported command. Forward to bash... "
	    $RUN_COMMAND $@
    ;;
esac
