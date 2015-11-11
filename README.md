# CocoaHeads Brasil 🇧🇷
## Guidelines para desenvolver novas features do app
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
```
var enabled = true
```
voce pode utilizar a classe Dynamic, e sua propriedade ficaria assim:
```
let enabled = Dynamic(true)
```
com isso voce pode adicionar listeners para quando esta propriedade mudar:
```
viewModel.enable.bind(self) { enabled in
	//your code here
}
```
Para acessar o valor atual de enabled, utilize a propriedade value:
```
if viewModel.enable.value {
	
}
```
A classe Dynamic possui dois métodos para fazer esse *bind*: **bind** e **bindAndFire**
* **bind** vai apenas escutar por novas mudanças de valores
* **bindAndFire** vai executar o bloco com o valor atual e escutar por mudanças de valores 