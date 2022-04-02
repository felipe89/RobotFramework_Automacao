*** Settings ***
Documentation     Teste para praticar a automação robot framework
Test Setup        Abrir o navegador
Resource          americanas_resources.robot
Test Teardown     Fechar o navegador

*** Test Cases ***

Caso de Testes 01 - Acessar ao menu "informatica"
    [Documentation]    Cenários de testes para validar fins de navegação de produtos relacionados
    [Tags]    informatica
    Acessar a home page do site da lojas "Americanas"
    Acessar a opção "informática"
    Validar que eu esteja na pagina contendo o texto "aqui você encontra tuuudo em informática :)" como titulo

Caso de Testes 02 - Buscar produto 
    [Documentation]    Efetuar busca de produtos via lupa de busca pelo site
    [Tags]    busca
    Acessar a home page do site da lojas "Americanas"
    No campo de busca informar o produto "Playstation 5"
    Validar o resultado da busca 

Caso de Testes 03 - Adicionar produto no carinho de compras
    [Documentation]   Adicionar o produto desejado em pesquisa no carinho de compra
    [Tags]     carinho
    Acessar a home page do site da lojas "Americanas"
    No campo de busca informar o produto "Playstation 5"
    Clicar em um do produtos da busca 
    # Validar o acesso na pagina do produto
    # Informar o CEP de entrega do produto 
    # Clicar no botão "Comprar"
    # Validar que eu esteja na tela de Comprar
    # Clicar no botão "Ir Para Cesta"
