# qt3-3_docker_demo
Demo repository for [https://hub.docker.com/r/balagct/qt-3.3] docker image

How to build docker image
--------------------------
- ./build.sh

How to run docker container
---------------------------
- docker-compose up -d

Troubleshoot
------------
If X-Window is not enabled in the host PC. Please make sure x11-apps package installed and execute "xhost +"

Disclaimer
----------
Since this is a demo project, the qt3.3 cpp file is not deleted after the compilation. Please do delete the source and header files, if you are deploying your application in production environment.
