# App-Marvel-Teste
Marvel-API-Criaçao de um app para consumo da API 


#Aplicação 
O app foi desenvolvido no intuito de fazer uma listagem/detlhe do consumo da Marvel API, atendendo os requisitos do User Stories
Como foi sugerido a utilização de no maximo 3 pods, me permiti desenovler o app fazendo a utilizaçao de apenas um pod para 
a criptografia da Hash, tentando ser o mais puro na linguagem possivel. 
US01 - List -  A etapa list foi concluida com sucesso fazendo a utilizaçao do limit 20 e offset para a craiçao da paginação.
US02 - Detail - O detalhe de cada caracter esta respeitando as regras e com isso trazendo apenas 3 elementos de cada com titulo
e descriçao se o mesmo existir. 
US03 - Search - Foi criado um search diretamente na api utilizando nameStartsWith para buscar qualquer personagem.
US04 - Favorites - O ponto critico para o desenvolvimento e sem sucesso doi o botao de favorito, o mesmo funciona mas de uma forma
erronea, fiz a busca em diversos sites para procurar uma soluçao para o mesmo e nao encontrei, pensei na criaçao de uma memoria 
temporaria onde guardo o nome eum status se favorito ou nao, mas nao sabia se seria permitido.(não concluido)

Todo o projeto foi Desenvolvido em view code tentando manter o mais clean possivel a interface e agradar o usuario de uma forma 
que nao fique confuso.



#Instruções para execução

instalação/atualizaçao dos Pods

Case instalação -  $ sudo gem install cocoapods
                   $ pod init 
                   $ pod install 
                   
Case update  -  $ pod update 


# Pods utilizados 
  Pod 'CryptoSwift'
  pod 'CryptoSwift', :git => "https://github.com/krzyzanowskim/CryptoSwift", :branch => "master"
  Copyright (C) 2014-2017 Marcin Krzyżanowski marcin@krzyzanowskim.com This software is provided 'as-is',
  without any express or implied warranty.

  A utilizaçao deste pode foi necessaria para a criaçao da hash para acesso a API. utilizando a criptografia .md5()
 
 
 


