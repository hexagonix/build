<!-- Vamos adicionar o logotipo do sistema -->

<p align="center">
<img src="https://github.com/hexagonix/Doc/blob/main/Img/Hexagonix.png" width="250" height="250">
</p>

# Colocando tudo em seu lugar

O mecanismo de construção do Hexagonix/Andromeda foi construído para automatizar o processo de montar os fontes do sistema e criar uma imagem de disco que pode ser utilizada para executar e testar o sistema operacional em máquina virtual ou física. Para executar essas tarefas, os scripts de construção esperam encontrar arquivos em determinados lugares, que já foram previamente escolhidos. Para facilitar esse processo para quem quer testar o sistema e ainda não teve contato com ele, foi criado um script que realiza a clonagem dos repositórios necessários à construção do sistema e coloca tudo em seu lugar, já deixando tudo pronto para a construção e testes.

## hexagonix.sh

O script [hexagonix.sh](hexagonix.sh), presente neste repositório, é responsável por realizar a clonagem dos repositórios e configuração de arquivos. deixando tudo pronto para a construção. Para começar, realize o download do script ou clone o repositório para seu computador. Caso tenha o comando git instalado em seu computador, use (já no diretório final que deseja adicionar os fontes do sistema, como /home/usuario/, por exemplo):

```
git clone https://github.com/hexagonix/build
```

Após a clonagem ou download do [script](hexagonix.sh), você deve prepar ele para a execução. Para isso, use (com o terminal):

```
cd build # Caso você tenha clonado. Se não, vá até o local de download do script
chmod +x hexagonix.sh
```

Após configurar o script como executável, você deve executá-lo, utilizando (é necessário ter o git instalado em seu computador):

```
./hexagonix.sh
```

O script vai então realizar a clonagem dos repositórios, criando um diretório chamado Hexagonix com os fontes necessários.

## Construção

Após a execução do script, você deve acessar o diretório Hexagonix criado, usando:

```
cd Hexagonix
```

Agora, você deve configurar o script configure.sh para execução, utilizando, no terminal:

```
chmod +x configure.sh
```

O script configure.sh é responsável por criar arquivos estáticos necessários à construção, como informações de build e arquivos de configuração do sistema, bem como checar todas as dependências de construção e preparar o restante dos scripts e imagens para a execução. A execução do script deve ser realizada como usuário root, utilizando:

```
sudo ./configure.sh
```

Após a execução, você está apto a construir o sistema. Para isso, você deve utilizar a ferramenta hx, presente no diretório do sistema e que também foi copiada para /usr/bin. Para gerar uma imagem do Hexagonix e Andromeda, use:

```
hx img.HX        # Gerar uma imagem do Hexagonix
hx img.ANDROMEDA # Gerar uma imagem do Andromeda
```

## Execução e testes

Para executar o sistema, utilize (você deve ter a ferramenta qemu instalada em seu computador):

```
hx mv.HX        # Para iniciar amáquina virtual utilizando a imagem do Hexagonix
hx mv.ANDROMEDA # Para iniciar amáquina virtual utilizando a imagem do Andromeda
```

Para mais informações, confira a documentação.

<!-- Versão do arquivo: 1.0 -->

Copyright © 2015-2022 Felipe Miguel Nery Lunkes