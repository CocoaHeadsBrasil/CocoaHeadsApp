# CocoaHeads Brasil 🇧🇷

[![waffle board](https://img.shields.io/badge/waffle-board-blue.svg)](https://waffle.io/CocoaHeadsBrasil/CocoaHeadsApp)
[![Build Status](https://travis-ci.org/CocoaHeadsBrasil/CocoaHeadsApp.svg?branch=master)](https://travis-ci.org/CocoaHeadsBrasil/CocoaHeadsApp)

## Quem Somos
CocoaHeads é um grupo formado por desenvolvedores (profissionais e iniciantes), que se organizam para reunir pessoas com a mesma paixão: Programação para os iDevices da Apple (OSX e iOS). Nossos encontros são informais e servem para juntar pessoas que gostam do mesmo assunto que você [programação! :) ]. Promovemos Talks e Palestras de até 20 minutos dadas por membros do grupo local ou de convidados especiais e é lógico, comidas, bebidas e snacks ao final.

## Setup inicial

### 1. cocoapods-keys
Usamos o plugin **cocoapods-keys** para gerenciar as chaves de acesso. Para instalar, execute:

```
$ gem install cocoapods-keys
```

### 2. CocoaPods
Instalado o plugin, baixe e instale as dependências usando o CocoaPods:

```
$ cd CocoaHeadsApp && pod install
```

Esse comando vai pedir as seguintes chaves: `ParseApplicationId` e `ParseClientKey`, que são as chaves de acesso ao projeto criado no Parse. Após ter criado seu próprio projeto lá, utilize aqui essas chaves.

*OBS: Se preferir, existe também uma conta de teste compartilhada do CocoaHeads Brasil. Se quiser utilizá-la, procure saber quem possui as chaves.*

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

 

## Motivação da criação do App
O crescimento do número de chapters em inúmeras cidades se fez a necessidade de ter um local onde pudessemos ver e organizar tantos eventos. Assim surgiu a ideia de fazermos o aplicativo do CocoaHeads Brasil com a presença de todos os eventos. A visualização destes além das informações mais detalhadas, além de apresentar a lista de participantes por evento, sorteios e muito mais.

## Licença
[The MIT License](https://raw.githubusercontent.com/CocoaHeadsBrasil/CocoaHeadsApp/master/LICENSE)
