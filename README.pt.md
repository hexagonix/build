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

# Dependências necessárias à construção do Hexagonix

<div align="justify">

Para construir e testar o Hexagonix, você vai precisar das seguintes dependências:

</div>

<div align="center">

![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
![fasm](https://img.shields.io/badge/Flat_Assembler-F57842?style=for-the-badge&logo=fasm&logoColor=white)
![Bash](https://img.shields.io/badge/GNU%20Bash-4EAA25?style=for-the-badge&logo=GNU%20Bash&logoColor=white)
![Git](https://img.shields.io/badge/GIT-E44C30?style=for-the-badge&logo=git&logoColor=white)
![qemu](https://img.shields.io/badge/Qemu-0A0A0A?style=for-the-badge&logo=qemu&logoColor=white)

</div>

<div align="justify">

Você não pode iniciar o processo sem essas dependências instaladas. Para instalar as dependências necessárias, siga os passos a seguir. Normalmente, a maioria das distruições Linux já contam com o GNU Bash instalado por padrão.

> Instalar as dependências no Debian, Ubuntu, Pop_OS! e derivados:

Para o `Debian`, `Ubuntu` e derivados , a linha a seguir irá instalar as suas dependências (privilégios de superusuário necessários):

```
sudo apt install qemu qemu-system-i386 fasm git
```

> Instalar no Fedora, CentOS e derivados:

Para o `Fedora` e derivados, a linha a seguir irá instalar o qemu e todas as suas dependências (privilégios de superusuário necessários):

```
sudo dnf install qemu qemu-system-i386 fasm git
```

</div>

<div align="center">

![virtualbox](https://img.shields.io/badge/VirtualBox-118515?style=for-the-badge&logo=virtualbox&logoColor=white)

</div>

<div align="justify">

Você também pode utilizar o VirtualBox para testar o sistema, embora sua instalação não seja necessária. Caso queira instalar o VirtualBox, use:

> Instalar o VirtualBox no Debian, Ubuntu, Pop_OS! e derivados (privilégios de superusuário necessários):

```
sudo apt install virtualbox
```

> Instalar no Fedora, CentOS e derivados (privilégios de superusuário necessários):

```
sudo dnf install virtualbox
```

Após a instalação, você poderá seguir com este tutorial.

</div>

# Colocando tudo em seu lugar

<div align="justify">

O mecanismo de construção do Hexagonix foi construído para automatizar o processo de montar os fontes do sistema e criar uma imagem de disco que pode ser utilizada para executar e testar o sistema operacional em máquina virtual ou física. Para executar essas tarefas, os scripts de construção esperam encontrar arquivos em determinados lugares, que já foram previamente escolhidos. Para facilitar esse processo para quem quer testar o sistema e ainda não teve contato com ele, foi criado um script que realiza a clonagem dos repositórios necessários à construção do sistema e coloca tudo em seu lugar, já deixando tudo pronto para a construção e testes.

</div>

## hexagonix.sh

<div align="justify">

O script [hexagonix.sh](hexagonix.sh), presente neste repositório, é responsável por realizar a clonagem dos repositórios e configuração de arquivos, deixando tudo pronto para a construção. Para começar, realize o download do script ou clone o repositório para seu computador. Caso tenha o comando `git` instalado em seu computador, use (já no diretório final que deseja adicionar os fontes do sistema, como `/home/usuario/`, por exemplo):

```
git clone https://github.com/hexagonix/build
```

Após a clonagem ou download do [script](hexagonix.sh), você deve preparar ele para a execução. Para isso, use (com o terminal):

```
cd build # Caso você tenha clonado. Se não, vá até o local de download do script
chmod +x hexagonix.sh
```

Após configurar o script como executável, você deve executá-lo, utilizando (é necessário ter o `git` instalado em seu computador):

```
./hexagonix.sh
```

O script vai então realizar a clonagem dos repositórios, criando um diretório chamado Hexagonix com os fontes necessários.

</div>

## Construção

<div align="justify">

Após a execução do script, você deve acessar o diretório Hexagonix criado, usando:

```
cd Hexagonix
```

Agora, você deve configurar o script `configure.sh` para execução, utilizando, no terminal:

```
chmod +x configure.sh
```

O script `configure.sh` é responsável por criar arquivos estáticos necessários à construção, como informações de build e arquivos de configuração do sistema, bem como checar todas as dependências de construção e preparar o restante dos scripts e imagens para a execução. A execução do script deve ser realizada como usuário root, utilizando:

```
sudo ./configure.sh
```

Após a execução, você está apto a construir o sistema. Para isso, você deve utilizar a ferramenta `hx`, presente no diretório do sistema e que também foi copiada para `/usr/bin`. Para gerar uma imagem do Hexagonix, use:

```
sudo hx -i hx  # Gerar uma imagem do Hexagonix
```

</div>

## Execução e testes

<div align="justify">

Para executar o sistema, utilize (você deve ter a ferramenta qemu instalada em seu computador):

```
hx -v hx  # Para iniciar a máquina virtual utilizando a imagem do Hexagonix
```

Para ajuda sobre como utilizar o hx, utilize `hx -h`.

Para mais informações, confira a documentação.

</div>

<!-- Versão do arquivo: 1.0

Copyright © 2015-2022 Felipe Miguel Nery Lunkes

-->
