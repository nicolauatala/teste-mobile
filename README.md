# Teste Madeinweb: Mobile
Desenvolver uma aplicação Mobile

## Instruções
- Faça um fork desse projeto para a sua conta pessoal do GitHub, ou BitBucket.
- Siga as especificações abaixo.
- Crie um README com as instruções para compilar, testar e rodar o projeto.
- O link do repositório deverá ser enviado para o e-mail rh@madeinweb.com.br com o título **Teste Mobile [plataforma]** (substituir plataforma por Android/iOS/Hibrido)

## Especificações tecnicas
- Utilizar a [API de busca do YouTube](https://developers.google.com/youtube/v3/docs/search/list)
- Cores livres, imagens livres
- Gitflow
- Layout mobile: [clique aqui](https://projects.invisionapp.com/share/WKD0CYIRG#/screens/248337735_iPhone_7)
- Você pode baixar as specs do projeto  [clicando aqui](https://drive.google.com/open?id=0B6TTk9-0XqYXVWFER19zZHotbkE).
* A pasta "Teste_made_mobile_specs" contém um arquivo "index.html", que pode ser usado para verificar as propriedades de cada elemento do layout. As imagens em png (Logo e ícone de voltar) podem ser baixadas, ao clicar nas imagens, é possível acessar o arquivo .png do lado direito ou através da segunda aba do canto superior esquerdo.

## Especificações funcionais
### Tela Inicial
Essa tela terá um formulário de busca posicionado no meio da tela com campo de texto com placeholder "Pesquisar" e um botão "Buscar". Esse formulário deverá ter validação.

Essa busca deverá chamar a url https://www.googleapis.com/youtube/v3/search?part=id,snippet&q={termo_de_busca}&key={API_KEY}

Ao fazer a busca, o formulário deve ser movido para o topo da tela usando animações e mostrar a lista de resultados com os campos título, descrição, thumbnail e um link para a página de detalhes. As sugestões de animações a ser utilizada estão no ZIP, com o nome "Video_mobile.mov".

### Tela de detalhes
A partir do videoId retornado na outra chamada, deve ser feito uma chamada para https://www.googleapis.com/youtube/v3/videos?id={VIDEO_ID}&part=snippet,statistics&key={API_KEY}

A partir desse retorno, deve-se montar uma tela contendo embed do video, título, descrição e visualizações.

Essa tela deve ter um botão para voltar para resultados da busca.

## O que será avaliado?
- Organização do projeto
- Lógica do código
- Uso do Git
- Qualidade visual (layout, animações utilizadas)

## Pontos Extras:
* Fazer paginação na tela de vídeos, utilizando os [recursos de paginação da api](https://developers.google.com/youtube/v3/guides/implementation/pagination?hl=pt-br).
* Utilizar animações para os novos resultados caso utilize a paginação
* Utilização de estruturas de códigos reconhecidas pelo mercado (a escolha do candidato)
* Injeção de dependencias
* Testes automatizados :)
* Qualquer item desenvolvido além do que foi pedido, desde animações até funcionalidades, contam também como pontos extras. Nos mostre sua criatividade :D
