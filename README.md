# iMX8-top-level-build
Use this to initialise a Yocto project for a SolidRun i.MX8 board, with a custom meta-boggybrn layer

Once the prerequisites have been met, then inside the Docker container run fetch_yocto_sources.sh to fetch all the sources and to set-up the yocto build folder.
Once that has run:
```
cd yocto
source setup-environment build
```
This should leave you in /workspace/yocto/build from where you can use bitbake.


## Prerequisites
This project is set up to use a Docker container as the build environment. This should work best on a Linux (e.g. Ubuntu PC) but can be made to work under Windows / WSL

The easiest way of managing that container is by using vscode with the Dev Containers extension.

1. Ensure that Docker is installed on the PC
2. Install vscode and the Microsoft Dev Containers extension
3. Add the following lines to your ~/.bashrc script, then source this or login again:
```
export DOCKER_GID=$(id -g)
export DOCKER_UID=$(id -u)
```
This ensures that any files created inside the Docker container have the same ownership as your local files. Thus you will be able to access them outside the container too.

4. Open the folder in vscode and you should be prompted to "Reopen in Container". Click on that and the Docker container should be built and started. You can then open a terminal within vscode and it should be in the /workspace folder within the container.

## Considerations for running under Windows
 - For any sort of reasonable performance store everyghing in the Linux installation area e.g. /home/<name>/Project
 - start from a WSL session (you may need to change the default user from root first)
 - You may need to add the location of vscode to your linux path
 - If your PC has lots of memory it may help to give wsl more than the default amount