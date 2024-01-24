<!-- Vamos adicionar o logotipo do sistema -->

<p align="center">
<img src="https://github.com/hexagonix/Doc/blob/main/Img/banner.png">
</p>

<div align="center">

![](https://img.shields.io/github/license/hexagonix/build.svg)
![](https://img.shields.io/github/stars/hexagonix/build.svg)
![](https://img.shields.io/github/issues/hexagonix/build.svg)
![](https://img.shields.io/github/issues-closed/hexagonix/build.svg)
![](https://img.shields.io/github/issues-pr/hexagonix/build.svg)
![](https://img.shields.io/github/issues-pr-closed/hexagonix/build.svg)
![](https://img.shields.io/github/downloads/hexagonix/build/total.svg)
![](https://img.shields.io/github/release/hexagonix/build.svg)
[![](https://img.shields.io/twitter/follow/hexagonixOS.svg?style=social&label=Follow%20%40HexagonixOS)](https://twitter.com/hexagonixOS)

</div>

<hr>

# Dependencies needed to build Hexagonix

<div align="justify">

To build and test Hexagonix, you will need the following dependencies:

</div>

<div align="center">

![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
![fasm](https://img.shields.io/badge/Flat_Assembler-F57842?style=for-the-badge&logo=fasm&logoColor=white)
![Bash](https://img.shields.io/badge/GNU%20Bash-4EAA25?style=for-the-badge&logo=GNU%20Bash&logoColor=white)
![Git](https://img.shields.io/badge/GIT-E44C30?style=for-the-badge&logo=git&logoColor=white)
![qemu](https://img.shields.io/badge/Qemu-0A0A0A?style=for-the-badge&logo=qemu&logoColor=white)
![uuid](https://img.shields.io/badge/UUID-0078D6?style=for-the-badge&&logoColor=white)

</div>

<div align="justify">

You cannot start the process without these dependencies installed. To install the necessary dependencies, follow the steps below. Usually, most Linux distributions already have GNU Bash installed by default.

> Install dependencies on Debian, Ubuntu, Pop_OS! and derivatives:

For `Debian`, `Ubuntu` and derivatives, the following line will install their dependencies (root privileges required):

```
sudo apt install qemu qemu-system-i386 fasm git uuid
```

> Install on Fedora, CentOS and derivatives:

For `Fedora` and derivatives, the following line will install qemu and all its dependencies (root privileges required):

```
sudo dnf install qemu qemu-system-i386 fasm git uuid
```

</div>

<div align="center">

![virtualbox](https://img.shields.io/badge/VirtualBox-118515?style=for-the-badge&logo=virtualbox&logoColor=white)

</div>

<div align="justify">

You can also use VirtualBox to test the system, although its installation is not necessary. If you want to install VirtualBox, use:

> Install VirtualBox on Debian, Ubuntu, Pop_OS! and derivatives (root privileges required):

```
sudo apt install virtualbox
```

> Install on Fedora, CentOS and derivatives (root privileges required):

```
sudo dnf install virtualbox
```

After installation, you can proceed with this tutorial.

</div>

# Putting everything in its place

The Hexagonix build engine was built to automate the process of mounting system source code and creating a disk image that can be used to run and test the operating system on a virtual or physical machine. To perform these tasks, the build scripts expect to find files in certain places, which have already been chosen in advance. To facilitate this process for those who want to test the system and have not yet had contact with it, a script was created that clones the repositories necessary to build the system and puts everything in its place, leaving everything ready for construction and testing.

## hexagonix.sh

The script [hexagonix.sh](hexagonix.sh), present in this repository, is responsible for cloning the repositories and configuring files, leaving everything ready for construction. To get started, download the script or clone the repository to your computer. If you have the `git` command installed on your computer, use (already in the final directory where you want to add the system sources, such as `/home/user/`, for example):

```
git clone https://github.com/hexagonix/build
```

After cloning or downloading the [script](hexagonix.sh), you must prepare it for execution. For that use (with the terminal):

```
cd build # In case you have cloned. If not, go to the script download location
chmod +x hexagonix.sh
```

After configuring the script as executable, you must run it, using (you must have `git` installed on your computer):

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

After execution, you are ready to build the system. For that, you must use the `hx` tool, present in the system directory and which was also copied to `/usr/bin`. To generate an image of Hexagonix, use:

```
sudo hx -i hx  # Generate a Hexagonix image
```

## Execution and tests

To run the system, use (you must have the qemu tool installed on your computer):

```
hx -v hx  # To start the virtual machine using the Hexagonix image
```

For help using hx, use `hx -h`.

For more information, check out the documentation.

<!-- Versão do arquivo: 1.0

Copyright © 2015-2024 Felipe Miguel Nery Lunkes

-->
