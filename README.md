# CocoaHeads Brasil 🇧🇷

[![waffle board](https://img.shields.io/badge/waffle-board-blue.svg)](https://waffle.io/CocoaHeadsBrasil/CocoaHeadsApp)
[![Build Status](https://travis-ci.org/CocoaHeadsBrasil/CocoaHeadsApp.svg?branch=master)](https://travis-ci.org/CocoaHeadsBrasil/CocoaHeadsApp)

## Quem Somos
CocoaHeads é um grupo formado por desenvolvedores (profissionais e iniciantes), que se organizam para reunir pessoas com a mesma paixão: Programação para os iDevices da Apple (OSX e iOS). Nossos encontros são informais e servem para juntar pessoas que gostam do mesmo assunto que você [programação! :) ]. Promovemos Talks e Palestras de até 20 minutos dadas por membros do grupo local ou de convidados especiais e é lógico, comidas, bebidas e snacks ao final.

## Setup inicial

### Instalação das Dependências

```
bundle install
```


## Guidelines de desenvolvimento

#### UI
Usamos um storyboard **Main.storyboard** para definir o fluxo do app, porém o desenvolvimento da tela não é feito diretamente no storyboard. Para desenvolver uma tela você deve:

1. Criar um viewController para esta tela
2. Criar uma view que extenda de **NibDesignable**
3. Criar um Xib com o mesmo nome da View.
4. Definir a classe do **File's Owner** para a classe da view que você criou
5. Adicionar uma nova scene no storyboard.
6. Definir a classe do **ViewController** para o controller criado no *passo 1*
7. Arrastar uma nova View para dentro dele, e definir a classe dessa view para a view criada no *passo 2*

Com isso, a view será renderizada corretamente no storyboard, mas sua edição será no arquivo Xib criado.

#### Interação com a View
Devemos seguir alguns conceitos e princípios para separar a lógica de nossa funcionalidade:

1. O ViewController deve apenas interagir com a view quando esta tiver que mudar de tamanho, ou apresentar outros ViewControllers
2. Crie uma classe que extenda de **ViewModel**.
3. Adicione uma propriedade viewModel para a classe View.
4. A classe ViewModel deve conter informações sobre o estado da view, e lógicas que alterem esses estados.
5. A classe View deve monitorar estes estados para alterar visualmente sua aparência.

##### Dynamics
Para que a view consiga responder a mudanças de valores das propriedades do ViewModel, ao invés de declarar uma propriedade como:

```swift
var enabled = true
```

voce pode utilizar a classe Dynamic, e sua propriedade ficaria assim:

```swift
let enabled = Dynamic(true)
```

com isso voce pode adicionar listeners para quando esta propriedade mudar:

```swift
viewModel.enable.bind(self) { enabled in
	//your code here
}
```

Para acessar o valor atual de enabled, utilize a propriedade value:

```swift
if viewModel.enable.value {
	
}
```

A classe Dynamic possui dois métodos para fazer esse *bind*: **bind** e **bindAndFire**

* **bind** vai apenas escutar por novas mudanças de valores
* **bindAndFire** vai executar o bloco com o valor atual e escutar por mudanças de valores

## Quem pode contribuir
Todos desenvolvedores iOS estão aptos a colaborar com essa iniciativa, basta seguir o workflow de contribuição.

## Guideline de contribuição

Neste projeto, estamos usando o [Github Flow](https://guides.github.com/introduction/flow/) integrado com o  [Forking Wokflow](https://www.atlassian.com/git/tutorials/comparing-workflows/forking-workflow).

### Preparação

- Faça o [fork](https://github.com/CocoaHeadsBrasil/CocoaHeadsApp#fork-destination-box) do projeto.
- Clone o seu projeto <br/>
```
$ git clone git@github.com:<github_user>/CocoaHeadsApp.git
```
- Sincronize o branch master <br/>
```
$ git pull origin master
```
- Adicione o projeto original como `upstream` remote <br/>
```
$ git remote add upstream git@github.com:CocoaHeadsBrasil/CocoaHeadsApp.git
```
- Atualize a tabela do seu repositório <br/>
```
$ git fetch --all
```
- Sincronize o branch master do projeto original <br/>
```
$ git checkout -b cocoaheads/master upstream/master
```

### Desenvolvimento

- Mude para o `master` do seu fork e crie um novo `branch` com a sua feature <br/>
```
$ git checkout master; git checkout -b feature_name
```
- Faça todas as alterações necessárias

### Publicação

- Quando a feature estiver pronta para publicação, atualize a tabela do seu repositório <br/>
```
$ git fetch --all
```
- Atualize o branch `master` do projeto original <br/>
```
$ git checkout cocoaheads/master; git pull upstream master
```
- `Rebase` seu branch master <br/>
```
$ git checkout master; git rebase cocoaheads/master
```
- `Push` seu branch master para seu fork <br/>
```
$ git push origin master
```
<br />
*Caso necessário (uma vez que o histório do git é remodelo no `rebase`), você pode forçar a atualização* <br/>
```
$ git push -f origin master
```
- `Rebase` o branch da sua feature <br/>
```
$ git checkout feature_name; git rebase master
```
- `Push` o branch da sua feature para seu fork <br/>
```
$ git push origin feature_name
```
<br/>
*Caso necessário (uma vez que o histório do git é remodelo no `rebase`), você pode forçar a atualização* <br/>
```
$ git push -f origin feature_name
```
- Crie um novo [`Pull Request`](https://github.com/CocoaHeadsBrasil/CocoaHeadsApp/pull/new/master)

## Features do projeto

Todo o desenvolvimento do app está concentrado no github. Portanto, para gerenciá-lo, usamos [issues](https://github.com/CocoaHeadsBrasil/CocoaHeadsApp/issues), [labels](https://github.com/CocoaHeadsBrasil/CocoaHeadsApp/labels) e [milestones](https://github.com/CocoaHeadsBrasil/CocoaHeadsApp/milestones).

### Issues

**Workflow**

1. Quando uma nova issue é criada, ela entra `in review`. Assim, os participantes do projeto podem conversar a respeito e colaborar com a proposta.
2. Uma prosposta pode ser negada (`Declined`) ou transformada em item do backlog do projeto (`Onboard`).
3. As `issues` em `onboard` podem começar a serem desenvolvidas (`In progress`).
4. Quando o desenvolvimento da feature é completado, o desenvolvedor por criar um pull request e associar à issue (`Waiting PR review`).
5. Os demais participantes do projeto podem revisar os pull requests (`In PR review`).
6. Quando for feito o merge, aquela issue é encerrada (`Delivered`).

### Labels

**Progresso**

- `In review`: Propostas que estão abertas para discussão se será implementado ou não
- `Declined`: Dado as conversas na issue, a funcionalidade/refatoração foi negada (e a issue é fechada).
- `Onboard`: Proposta que foi "aceita" e pode entrar em uma das milestones do projeto. Nesse ponto, a conversação na issue é bloqueada
- `In progess`: Issue que está em desenvolvimento por 1 ou mais pessoas (que devem ser associadas à issue)
- `Waiting PR review`: Uma indicação de que o issue foi finalizada e precisa passar por review de PR.
- `In PR review`: O PR está sendo avaliado por 1 ou mais pessoas
- `Delivered`:  PR foi aceito (e a issue é fechada)

**Informativo**

- `Code base enhancement`: Propostas que visam uma melhor implementação ou estrutura de código
- `Product enhancement`: Propostas de novas funcionalidades para o produto
- `bug`: Informar bugs no código
- `ci`: Propostas de novas funções ou melhorias no sistema de C.I.
- `docs`:	Adição ou melhoria na documentação
- `question`: Questões sobre o projeo
- `easy`: Proposta considerada de fácil implementação
- `medium`: Proposta com dificuldade média
- `hard`: Proposta de implementação complexa

### Milestone

O projeto, hoje, possui os seguintes milestones:

- `Remover Parse`: Tirar o parse do projeto e substituir por dados mockados.
- `Integrar API`: Integrar a API rails
- `Versão de teste`: Uma primeira versão do aplicativo, algo que pode ser disponibilizado para beta testers (não precisa ter 100% das funcionalidades)
- `1.0`: Coisas que queremos que sejam válidas para uma versão 1.0
- `Distribuição`: Issues relacionadas à distribuição do app (caso seje relevante)

## Motivação da criação do App
O crescimento do número de chapters em inúmeras cidades se fez a necessidade de ter um local onde pudessemos ver e organizar tantos eventos. Assim surgiu a ideia de fazermos o aplicativo do CocoaHeads Brasil com a presença de todos os eventos. A visualização destes além das informações mais detalhadas, além de apresentar a lista de participantes por evento, sorteios e muito mais.

## Licença
[The MIT License](https://raw.githubusercontent.com/CocoaHeadsBrasil/CocoaHeadsApp/master/LICENSE)
