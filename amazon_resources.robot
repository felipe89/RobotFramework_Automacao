*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    String


*** Variables ***
${BROWSER}        chrome
${URL}            https://www.amazon.com.br
${MENU_LIVRO}     //a[@href='/Livros/b/?ie=UTF8&node=6740748011&ref_=nav_cs_books'][contains(.,'Livros')]
${HEADER_LIVRO}    //h1[contains(.,'Loja de Livros')]

*** Keywords ***
Abrir o navegador     
    Open Browser   browser=${BROWSER}
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To       url=${URL}
    Wait Until Element Is Visible      locator=${MENU_LIVRO} 

Entrar no menu "Livros"
    Click Element     locator=${MENU_LIVRO}

Verificar se aparece a frase "${TEXTO_FRASE}"
    Wait Until Page Contains     text=${TEXTO_FRASE}
    Wait Until Element Is Visible     locator=${HEADER_LIVRO} 

Verificar se o título da página fica "Loja de Livros | Amazon.com.br"
    Title Should Be     title=Loja de Livros | Amazon.com.br 
    
Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    locator=//a[@aria-label='${NOME_CATEGORIA}']

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa 
    Input text         locator=twotabsearchtextbox    text=${PRODUTO}

Clicar no botão de pesquisa
    Click Element        locator=nav-search-submit-button

Verificar o resultado da pesquisa listando o produto "${PRODOTO_PESQUISADO}"
    Wait Until Element Is Visible        locator=//img[contains(@alt,'${PRODOTO_PESQUISADO}')]
                                                    
    
    
    