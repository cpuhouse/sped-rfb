# SPED-RFB

Este projeto tem como finalidade empacotar para distribuição para os diversos sistemas GNU/Linux os programas fornecidos pela Receita Federal do Brasil, RFB.

![GitHub repo size](https://img.shields.io/github/repo-size/cpuhouse/sped-rfb?style=for-the-badge)
![GitHub language count](https://img.shields.io/github/languages/count/cpuhouse/sped-rfb?style=for-the-badge)
![GitHub forks](https://img.shields.io/github/forks/cpuhouse/sped-rfb?style=for-the-badge)
![Github open issues](https://img.shields.io/github/issues/cpuhouse/sped-rfb?style=for-the-badge)
## Sistema Público de Escrituração Digital - SPED

O SPED, abreviação de **Sistema Público de Escrituração Digital** tem como objetivo unificar a recepção, validação, armazenamento e autenticação de livros e documentos integrantes das escriturações contábil e fiscal das [pessoas jurídicas](https://pt.wikipedia.org/wiki/Pessoas_jur%C3%ADdicas "Pessoas jurídicas"), através de um fluxo computadorizado de informações. O SPED também visa facilitar a fiscalização, integrando informações de interesse dos governos federal e estadual.

O projeto é composto pelas seguintes bases:

- [EFD – Escrituração Fiscal Digital]();
	- [EFD ICMS/IPI]();
	- [EFD PIS/COFINS (Contribuições)]();
- [ECD – Escrituração Contábil Digital]();
- [ECF – Escrituração Contábil Fiscal]();
- [NF-e – Nota Fiscal Eletrônica]();
- [CT-e - Conhecimento de Transporte Eletrônico]().
- [eSocial]() - em fase de implementação.

A Receita Federal do Brasil fornece aplicativos para a geração e validação de arquivos de transferência eletrônica para as bases do SPED de acordo com a tabela a seguir:

|Componente           |Descrição                            |Versão   |Pacotes      |
|---------------------|-------------------------------------|---------|-------------|
|Sped Fiscal          |Gerador de EFD ICMS/IPI              | 3.0.1   |DEB,RPM      |
|Sped Contribuições   |Gerador de EFD PIS/COFINS            | 5.0.2   |DEB,RPM      |
|Sped Contábil        |Validador de ECD                     | 10.0.2  |DEB,RPM      |
|Sped Contábil ECF    |Validador de ECF                     | 8.0.7   |DEB,RPM      |
|ReceitaNet¹          |Transmissor de declarações IRPJ/IRPF | 1.24    |DEB,RPM,JAR  |
|ReceitaNetBX¹        |Transmissor de arquivos das bases RFB| 1.9.18  |JAVA SFX     |
|ReceitaNetBX Serviço¹|Serviço do ReceitaNetBX              | 1.9.18  |JAVA SFX     |

[¹ Pacotes fornecidos pela RFB](https://www.gov.br/receitafederal/pt-br/centrais-de-conteudo/download/receitanet)

## Pré-requisitos

Antes de começar, verifique se o seu computador atende aos seguintes requisitos:
* Possui uma versão 64 bits do GNU/Linux instalada: `x86_64, amd64`. Para saber qual a sua arquitetura execute o seguinte comando:
	```
	uname -a
	```
* O seu sistema está possui uma interface gráfica instalada: `KDE Plasma, Gnome, XFCE, etc.` 
* O seu sistema GNU/Linux está executando uma distribuição compatível:
	* [Ubuntu e derivados](https://ubuntu.com) (apenas 18.04 LTS / 20.04 LTS)
	* [Fedora](https://getfedora.org) (36+/Rawhide)
<!--
	* [Debian](https://debian.org)(apenas instalação manual de pacotes - não testado)
	* [Rocky Linux](https://rockylinux.org)(ainda não suportado)
	* [Alma Linux](https://almalinux.org)(ainda não suportado)
	* [CentOS Stream](https://centos.org)(ainda não suportado)
	* [Oracle Linux (OL)](https://www.oracle.com/br/linux/)(ainda não suportado)
	* [Amazon Linux (AL)](https://aws.amazon.com/amazon-linux/)(ainda não suportado)
	* [Red Hat Enterprise Linux (RHEL)](https://www.redhat.com/pt-br/technologies/linux-platforms/enterprise-linux)(ainda não suportado)

ou
* O seu sistema suporta AppImage (ainda não implementado)
* O seu sistema suporta Flatpak (ainda não implementado)
-->

## Instalando os aplicativos SPED
Para instalar os aplicativos do SPED em sua máquina con GNU/Linux, siga estas etapas:

Ubuntu e derivados:
```
pushd /tmp; wget -q -O cpuhouse-repo.deb https://s.cpuhouse.cloud/cpuhrel-<suite> && dpkg -i cpuhouse-repo.deb; popd
sudo apt update && apt install sped-*
```
Trocar `<suite>` pelo codename da versão do Ubuntu/derivado que você usa. No momento apenas as seguintes suites estão disponíveis:

* `focal - Ubuntu 20.04 LTS`
* `bionic - Ubuntu 18.04 LTS`

Fedora:
Execute os seguintes comandos em seu terminal:
```
sudo dnf copr enable cpuhouse/sped-rfb
sudo dnf install --refresh sped-*
```
<!--
Fedora/RHEL e derivados (Rocky/Alma/CentOS/OL/AL):

Caso você utilize o Fedora ou uma versão do Rocky/Alma/CentOS/OL/AL/RHEL que já possua o dnf instalado execute os seguintes comandos em seu terminal:
```
sudo dnf install yum-plugin-copr
sudo dnf copr enable cpuhouse/sped
sudo dnf install sped-*
```
Caso não tenha o dnf instalado, execute os comandos ao seguir ao invés:
```
sudo yum install yum-plugin-copr
sudo dnf copr enable cpuhouse/sped
sudo dnf install sped-*
```
-->

## Como Contribuir
Para contribuir com este projeto, siga estas etapas:

1. Bifurque este repositório. Você pode fazer isso clicando no botão ![GitHub fork](https://img.shields.io/github/forks/cpuhouse/sped-rfb?label=Fork&?style=for-the-badge)
2. Crie um branch: `git checkout -b <nome_branch>`.
4. Faça suas alterações e confirme-as: `git commit -m '<mensagem_commit>'`
5. Envie para o branch original: `git push origin <nome_do_projeto> / <local>`
6. Crie a solicitação de pull.

Como alternativa, consulte a documentação do GitHub em [como criar uma solicitação pull](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request).

<!--
## Colaboradores

Agradecemos às seguintes pessoas que contribuíram para este projeto:

<table>
  <tr>
    <td align="center">
      <a href="#">
        <img src="https://avatars.githubusercontent.com/u/7252968?v=4" width="100px;" alt="Foto do Christian Tosta no GitHub"/><br>
        <sub>
          <b>Christian Tosta</b>
        </sub>
      </a>
    </td>
   </tr>
</table>
-->

## Seja um contribuidor<br>

Quer fazer parte desse projeto? Clique [AQUI](CONTRIBUTING.md) e leia como contribuir.

## 📝 Licença

Esse projeto está sob a licença GPLv3 ou superior. Veja o arquivo [LICENÇA](LICENSE) para mais detalhes.

[⬆ Voltar ao topo](#SPED-RFB)<br>
