echo This script deploys backend to 238 server
echo Please enter password for AFX 238 oracle user (Admin12)
@echo off

ssh oracle@172.20.3.238 -p 22 /u01/app/weblogic/Middleware/backend-deployment/New-Deployment/moveafxwar.sh

echo %date% %time%

scp -r -P 22 "C:\CodeBase\HRSBackend\master\web-app\target\tlxfs.war" oracle@172.20.3.238:/u01/app/weblogic/Middleware/backend-deployment/New-Deployment

echo %date% %time%

ssh oracle@172.20.3.238 -p 22 java -cp /u01/app/weblogic/Middleware/Oracle_Home/wlserver/server/lib/weblogic.jar weblogic.Deployer -adminurl t3://172.20.3.238:7001 -username weblogic -password weblogic1 -name tlxfs -undeploy

ssh oracle@172.20.3.238 -p 22 java -cp /u01/app/weblogic/Middleware/Oracle_Home/wlserver/server/lib/weblogic.jar weblogic.Deployer -adminurl t3://172.20.3.238:7001 -username weblogic -password weblogic1 -deploy -name tlxfs -targets AdminServer -source /u01/app/weblogic/Middleware/backend-deployment/New-Deployment/tlxfs.war

set /p DUMMY=Hit ENTER to continue...