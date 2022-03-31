*** Settings ***
Documentation   Essa suite testa o site da amazon.com.br
Resource        amazon_resources.robot
Test Setup      Abrir o navegador
Test Teardown   Fechar o navegador

*** Test Cases ***

Caso de Teste 01 - Acessar ao menu "Livros"
    [Documentation]  Esse teste verifica o menu eletronico do site da amazon.com.br 
    ...              e verifica a categoria computadores e informatica
    [Tags]           menus  categorias
    Acessar a home page do site Amazon.com.br
    Entrar no menu "Livros"
    Verificar se aparece a frase "Loja de Livros"
    Verificar se o título da página fica "Loja de Livros | Amazon.com.br"
    Verificar se aparece a categoria "Livros em Oferta - Aproveite as promoções"
    
Caso de Teste 02 - Pesquisa de "Produto"
    [Documentation]  Esse teste verifica a busca de um produto através da pesquisa do mesmo
    [Tags]           busca_produtos   resultado_busca
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa 
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa listando o produto "Console Xbox Series S"