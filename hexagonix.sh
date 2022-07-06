#!/bin/bash
# Esse script deve ficar na raiz do projeto
# 
# Esse script foi adaptado para rodar sobre o Linux, mas pode ser executado sobre o WSL (Windows)
#
#;;************************************************************************************
#;;
#;;    
#;; ┌┐ ┌┐                                 Sistema Operacional Hexagonix®
#;; ││ ││
#;; │└─┘├──┬┐┌┬──┬──┬──┬─┐┌┬┐┌┐    Copyright © 2016-2022 Felipe Miguel Nery Lunkes
#;; │┌─┐││─┼┼┼┤┌┐│┌┐│┌┐│┌┐┼┼┼┼┘          Todos os direitos reservados
#;; ││ │││─┼┼┼┤┌┐│└┘│└┘││││├┼┼┐
#;; └┘ └┴──┴┘└┴┘└┴─┐├──┴┘└┴┴┘└┘
#;;              ┌─┘│          
#;;              └──┘                              Versão 1.0
#;;
#;;
#;;************************************************************************************

clonarRepos()
{

clear

echo -e ";;****************************************************************************"
echo -e ";;                                                                            "
echo -e ";;                                                                            "
echo -e ";; ┌┐ ┌┐                              \e[1;94mSistema Operacional Hexagonix®\e[0m          "
echo -e ";; ││ ││                                                                      "
echo -e ";; │└─┘├──┬┐┌┬──┬──┬──┬─┐┌┬┐┌┐ \e[1;94mCopyright © 2016-2022 Felipe Miguel Nery Lunkes\e[0m"
echo -e ";; │┌─┐││─┼┼┼┤┌┐│┌┐│┌┐│┌┐┼┼┼┼┘       \e[1;94mTodos os direitos reservados\e[0m             "
echo -e ";; ││ │││─┼┼┼┤┌┐│└┘│└┘││││├┼┼┐                                                "
echo -e ";; └┘ └┴──┴┘└┴┘└┴─┐├──┴┘└┴┴┘└┘                                                "
echo -e ";;              ┌─┘│                  \e[1;32mConstruir o Hexagonix/Andromeda\e[0m "
echo -e ";;              └──┘                                                          "
echo -e ";;                                                                            "
echo -e ";;****************************************************************************"
echo
echo
echo "Clonando os repositórios necessários para construir o Hexagonix®/Andromeda®..."
echo 

# Primeiro, vamos criar os diretórios comuns

mkdir -p Hexagonix/

cd Hexagonix 

mkdir -p Apps/
mkdir -p Boot/
mkdir -p Externos/
mkdir -p Dist/

# Vamos clonar o Hexagon

git clone https://github.com/hexagonix/Hexagon Hexagon

# Vamos clonar o Saturno e o HBoot

git clone https://github.com/hexagonix/Saturno Boot/Saturno
git clone https://github.com/hexagonix/HBoot "Boot/Hexagon Boot"

# Vamos agora clonar os respositórios de utilitários

git clone https://github.com/hexagonix/Unix-Apps Apps/Unix
git clone https://github.com/hexagonix/Andromeda-Apps Apps/Andromeda

# Vamos clonar as bibliotecas 

git clone https://github.com/hexagonix/lib lib

# Agora vamos clocar arquivos estáticos e manuais

git clone https://github.com/hexagonix/man Dist/man
git clone https://github.com/hexagonix/etc Dist/etc

# Vamos clonar as fontes gráficas

git clone https://github.com/hexagonix/xfnt Fontes

# Agora, fasmX

git clone https://github.com/hexagonix/fasmX Externos/fasmX

# Agora o repositório de imagens

git clone https://github.com/hexagonix/hexagonix hexagonix

# Por último, os scripts de geração do sistema

git clone https://github.com/hexagonix/scriptsHX Scripts

# Agora vamos colocar as coisas no lugar 

cd Scripts 

cp configure.sh hx ../
cp Externos.sh ../Externos

cd ..

chmod +x configure.sh hx 

echo
echo -e "[\e[32mTudo pronto!\e[0m]"
echo

exit 

}

checarDependencias()
{

clear

echo -e ";;****************************************************************************"
echo -e ";;                                                                            "
echo -e ";;                                                                            "
echo -e ";; ┌┐ ┌┐                              \e[1;94mSistema Operacional Hexagonix®\e[0m          "
echo -e ";; ││ ││                                                                      "
echo -e ";; │└─┘├──┬┐┌┬──┬──┬──┬─┐┌┬┐┌┐ \e[1;94mCopyright © 2016-2022 Felipe Miguel Nery Lunkes\e[0m"
echo -e ";; │┌─┐││─┼┼┼┤┌┐│┌┐│┌┐│┌┐┼┼┼┼┘       \e[1;94mTodos os direitos reservados\e[0m             "
echo -e ";; ││ │││─┼┼┼┤┌┐│└┘│└┘││││├┼┼┐                                                "
echo -e ";; └┘ └┴──┴┘└┴┘└┴─┐├──┴┘└┴┴┘└┘                                                "
echo -e ";;              ┌─┘│                  \e[1;32mConstruir o Hexagonix/Andromeda\e[0m "
echo -e ";;              └──┘                                                          "
echo -e ";;                                                                            "
echo -e ";;****************************************************************************"
echo
echo -e "Verificando dependências necessárias para clonar os repositórios..."

# Agora vamos verificar cada dependência do mecanismo de construção

# Dependência 1

echo -n " > git "

if [ -e /usr/bin/git ] ; then

echo -e "[\e[32mOk\e[0m]"

else

echo -e "[\e[31mNão localizado\e[0m]"
echo -e "   > \e[1;31mVocê NÃO pode iniciar sem essa dependência\e[0m."

exit

fi	

clonarRepos

}

checarDependencias