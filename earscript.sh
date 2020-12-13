#!/bin/bash
date
java -cp /data/middleware/wlserver/server/lib/weblogic.jar weblogic.Deployer -adminurl t3://172.20.3.195:7001 -username weblogic -password weblogic123 -name obdx.cz.app.domain -undeploy -library

java -cp /data/middleware/wlserver/server/lib/weblogic.jar weblogic.Deployer -adminurl t3://172.20.3.195:7001 -username weblogic -password weblogic123 -deploy -library -name obdx.cz.app.domain -targets AdminServer,OBDXCLUSTER -source /data/Dev_EAR/obdx.cz.app.domain.ear

exit 0
 