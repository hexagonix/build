<!-- Vamos adicionar o logotipo do sistema -->

<p align="center">
<img src="https://github.com/hexagonix/Doc/blob/main/Img/Hexagonix.png" width="250" height="250">
</p>

# Putting everything in its place

The Hexagonix/Andromeda build engine was built to automate the process of mounting system fonts and creating a disk image that can be used to run and test the operating system on a virtual or physical machine. To perform these tasks, the build scripts expect to find files in certain places, which have already been chosen in advance. To facilitate this process for those who want to test the system and have not yet had contact with it, a script was created that clones the repositories necessary to build the system and puts everything in its place, leaving everything ready for construction and testing.

## hexagonix.sh

The script [hexagonix.sh](hexagonix.sh), present in this repository, is responsible for cloning the repositories and configuring files, leaving everything ready for construction. To get started, download the script or clone the repository to your computer. If you have the git command installed on your computer, use (already in the final directory where you want to add the system sources, such as /home/user/, for example):

```
git clone https://github.com/hexagonix/build
```

After cloning or downloading the [script](hexagonix.sh), you must prepare it for execution. For that use (with the terminal):

```
cd build # In case you have cloned. If not, go to the script download location
chmod +x hexagonix.sh
```

After configuring the script as executable, you must run it, using (you must have git installed on your computer):

```
./hexagonix.sh
```

The script will then clone the repositories, creating a directory called Hexagonix with the necessary sources.

## Building

After running the script, you must access the created Hexagonix directory, using:

```
cd Hexagonix
```

Now, you must configure the `configure.sh` script to run, using, in the terminal:

```
chmod +x configure.sh
```

The `configure.sh` script is responsible for creating static files needed for the build, such as build information and system configuration files, as well as checking all build dependencies and preparing the rest of the scripts and images for execution. The script must be executed as the root user, using:

```
sudo ./configure.sh
```

After execution, you are ready to build the system. For that, you must use the `hx` tool, present in the system directory and which was also copied to `/usr/bin`. To generate an image of Hexagonix and Andromeda, use:

```
hx img.HX        # Generate a Hexagonix image
hx img.ANDROMEDA # Generate an Andromeda image
```

## Execution and tests

To run the system, use (you must have the qemu tool installed on your computer):

```
hx mv.HX        # To start the virtual machine using the Hexagonix image
hx mv.ANDROMEDA # To start the virtual machine using the Andromeda image
```

For more information, check out the documentation.

<!-- Versão do arquivo: 1.0 -->

Copyright © 2015-2022 Felipe Miguel Nery Lunkes
