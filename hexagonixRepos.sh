#!/bin/bash
#
#*************************************************************************************************
#
# 88                                                                                88
# 88                                                                                ""
# 88
# 88,dPPPba,   ,adPPPba, 8b,     ,d8 ,adPPPPba,  ,adPPPb,d8  ,adPPPba,  8b,dPPPba,  88 8b,     ,d8
# 88P'    "88 a8P     88  `P8, ,8P'  ""     `P8 a8"    `P88 a8"     "8a 88P'   `"88 88  `P8, ,8P'
# 88       88 8PP"""""""    )888(    ,adPPPPP88 8b       88 8b       d8 88       88 88    )888(
# 88       88 "8b,   ,aa  ,d8" "8b,  88,    ,88 "8a,   ,d88 "8a,   ,a8" 88       88 88  ,d8" "8b,
# 88       88  `"Pbbd8"' 8P'     `P8 `"8bbdP"P8  `"PbbdP"P8  `"PbbdP"'  88       88 88 8P'     `P8
#                                               aa,    ,88
#                                                "P8bbdP"
#
#                    Sistema Operacional Hexagonix - Hexagonix Operating System
#
#                         Copyright (c) 2015-2024 Felipe Miguel Nery Lunkes
#                        Todos os direitos reservados - All rights reserved.
#
#*************************************************************************************************
#
# Português:
#
# O Hexagonix e seus componentes são licenciados sob licença BSD-3-Clause. Leia abaixo
# a licença que governa este arquivo e verifique a licença de cada repositório para
# obter mais informações sobre seus direitos e obrigações ao utilizar e reutilizar
# o código deste ou de outros arquivos.
#
# English:
#
# Hexagonix and its components are licensed under a BSD-3-Clause license. Read below
# the license that governs this file and check each repository's license for
# obtain more information about your rights and obligations when using and reusing
# the code of this or other files.
#
#*************************************************************************************************
#
# BSD 3-Clause License
#
# Copyright (c) 2015-2024, Felipe Miguel Nery Lunkes
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice, this
#    list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright notice,
#    this list of conditions and the following disclaimer in the documentation
#    and/or other materials provided with the distribution.
#
# 3. Neither the name of the copyright holder nor the names of its
#    contributors may be used to endorse or promote products derived from
#    this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# $HexagonixOS$

# Version 2.0

cloneRepositories()
{

clear

echo -e ";;****************************************************************************"
echo -e ";;                                                                            "
echo -e ";;                                                                            "
echo -e ";; ┌┐ ┌┐                              \e[1;94mHexagonix Operating System\e[0m"
echo -e ";; ││ ││                                                                      "
echo -e ";; │└─┘├──┬┐┌┬──┬──┬──┬─┐┌┬┐┌┐ \e[1;94mCopyright © 2015-2024 Felipe Miguel Nery Lunkes\e[0m"
echo -e ";; │┌─┐││─┼┼┼┤┌┐│┌┐│┌┐│┌┐┼┼┼┼┘           \e[1;94mAll rights reserved.\e[0m"
echo -e ";; ││ │││─┼┼┼┤┌┐│└┘│└┘││││├┼┼┐                                                "
echo -e ";; └┘ └┴──┴┘└┴┘└┴─┐├──┴┘└┴┴┘└┘                                                "
echo -e ";;              ┌─┘│                          \e[1;32mBuild Hexagonix\e[0m    "
echo -e ";;              └──┘                                                          "
echo -e ";;                                                                            "
echo -e ";;****************************************************************************"
echo
echo
echo "Cloning the repositories needed to build Hexagonix..."
echo 

# First, let's create the common directories

mkdir -p Hexagonix/

cd Hexagonix 

mkdir -p Apps/
mkdir -p Boot/
mkdir -p Dist/

# Let's clone Hexagon

git clone https://github.com/hexagonix/Hexagon Hexagon

# Let's clone Saturno and HBoot

git clone https://github.com/hexagonix/Saturno Boot/Saturno
git clone https://github.com/hexagonix/HBoot Boot/HBoot

# Let's now clone the utility repositories

git clone https://github.com/hexagonix/Unix-Apps Apps/Unix
git clone https://github.com/hexagonix/Andromeda-Apps Apps/Andromeda

# Let's clone the libraries

git clone https://github.com/hexagonix/lib lib

# Now let's place static and manual files

git clone https://github.com/hexagonix/man Dist/man
git clone https://github.com/hexagonix/etc Dist/etc

# Let's clone the graphic fonts

git clone https://github.com/hexagonix/xfnt Fonts

# Now fasmX

git clone https://github.com/hexagonix/fasmX Contrib/fasmX

# Now the image repository

git clone https://github.com/hexagonix/hexagonix hexagonix

# Now the documentation

git clone https://github.com/hexagonix/Doc

# Lastly, the system generation scripts

git clone https://github.com/hexagonix/scriptsHX Scripts

# Now let's put things in place

cd Scripts 

cp configure.sh hx ../
cp Contrib.sh ../Contrib

cd ..

# Let's clone hx autobuild 

git clone https://github.com/felipenlunkes/hexagonix-autobuild autohx

cd autohx 

cp autohx.py ../

cd ..

chmod +x configure.sh hx autohx.py

# Now remove the script itself

rm -r ../hexagonix.sh 

echo
echo -e "[\e[32mAll ready!\e[0m]"
echo

exit 

}

verifyDependencies()
{

clear

echo -e ";;****************************************************************************"
echo -e ";;                                                                            "
echo -e ";;                                                                            "
echo -e ";; ┌┐ ┌┐                              \e[1;94mHexagonix Operating System\e[0m"
echo -e ";; ││ ││                                                                      "
echo -e ";; │└─┘├──┬┐┌┬──┬──┬──┬─┐┌┬┐┌┐ \e[1;94mCopyright © 2015-2024 Felipe Miguel Nery Lunkes\e[0m"
echo -e ";; │┌─┐││─┼┼┼┤┌┐│┌┐│┌┐│┌┐┼┼┼┼┘           \e[1;94mAll rights reserved.\e[0m"
echo -e ";; ││ │││─┼┼┼┤┌┐│└┘│└┘││││├┼┼┐                                                "
echo -e ";; └┘ └┴──┴┘└┴┘└┴─┐├──┴┘└┴┴┘└┘                                                "
echo -e ";;              ┌─┘│                          \e[1;32mBuild Hexagonix\e[0m    "
echo -e ";;              └──┘                                                          "
echo -e ";;                                                                            "
echo -e ";;****************************************************************************"
echo
echo -e "Checking dependencies needed to clone the repositories..."
echo 

# Now let's check each build engine dependency

# Dependency 1

echo -n " > git "

if [ -e /usr/bin/git ] ; then

echo -e "[\e[32mOk\e[0m]"

else

echo -e "[\e[31mNot found\e[0m]"
echo -e "   > \e[1;31mYou CANNOT start without this dependency\e[0m."

exit

fi	

cloneRepositories

}

verifyDependencies
