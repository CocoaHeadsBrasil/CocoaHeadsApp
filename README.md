# CocoaHeads Brasil 🇧🇷

[![waffle board](https://img.shields.io/badge/waffle-board-blue.svg)](https://waffle.io/CocoaHeadsBrasil/CocoaHeadsApp)

## Setup inicial

### cocoapods-keys
Usamos o **cocoapods-keys** para gerenciar as chaves de acesso. Para instalar, execute:
```
gem install cocoapods-keys
```
Ambas as chaves `ParseApplicationId` e `ParseClientKey` estão configuradas. Criamos uma conta de teste para ser compartilhada. Procure saber quem as possui. Caso prefira, você também pode criar a sua própria app no Parse e utilizar suas próprias chaves de acesso.

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

##Contato
Os canais para contato são:
- [Twitter](https://twitter.com/cocoaheadsbr/)
- [Facebook](https://www.facebook.com/CocoaHeadsBrasil/)
- Email: contato@cocoaheads.com.br
- Temos também um channel exclusivo do Cocoaheads no [Slack](http://iosdevbr.slack.com). Caso você ainda não faça parte da comunidade, [faça seu cadastro](http://iosdevbr.herokuapp.com/) e nos ajude a crescer ainda mais.

##Licença
O CocoaHeadsApp é liberado sob a licença [MIT](https://github.com/CocoaHeadsBrasil/CocoaHeadsApp/blob/master/LICENSE).
