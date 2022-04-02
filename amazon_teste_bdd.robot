*** Settings ***
Documentation   Essa suite testa o site da amazon.com.br
Resource        amazon_resources_bdd.robot
Test Setup      Abrir o navegador
Test Teardown   Fechar o navegador

*** Test Cases ***

Caso de Teste 01 - Acessar ao menu "Livros"
    [Documentation]  Esse teste verifica o menu eletronico do site da amazon.com.br 
    ...              e verifica a categoria computadores e informatica
    [Tags]           menus  categorias
    Dado que estou na home page da Amazon.com.br
    Quando acessar o menu "Livros"
    Então o título da página deve ficar "Loja de Livros"
    E o texto "Livros" deve ser exibido na página
    E a categoria "Livros em Oferta - Aproveite as promoções" deve ser exibida na página  

Caso de Teste 02 - Pesquisa de "Produto"
    [Documentation]  Esse teste verifica a busca de um produto através da pesquisa do mesmo
    [Tags]           busca_produtos   resultado_busca
    Dado que estou na home page da Amazon.com.br
    Quando pesquisar pelo produto "Xbox Series S"
    # Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    # E um produto da linha "Xbox Series S" deve ser mostrado na página