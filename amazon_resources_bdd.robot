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

Dado que estou na home page da Amazon.com.br
    Go To       url=${URL}
    Wait Until Element Is Visible      locator=${MENU_LIVRO} 

Quando acessar o menu "Livros"
    Click Element     locator=${MENU_LIVRO}

Então o título da página deve ficar "${TEXTO_FRASE}"
    Wait Until Page Contains     text=${TEXTO_FRASE}
    Wait Until Element Is Visible     locator=${HEADER_LIVRO} 
E o texto "Livros" deve ser exibido na página
    Title Should Be     title=Loja de Livros | Amazon.com.br 
E a categoria "${NOME_CATEGORIA}" deve ser exibida na página 
    Element Should Be Visible    locator=//a[@aria-label='${NOME_CATEGORIA}']

Quando pesquisar pelo produto "${PRODUTO}"
    Input text         locator=twotabsearchtextbox    text=${PRODUTO}
    Click Element        locator=nav-search-submit-button

Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    Title Should Be     title=Amazon.com.br : Xbox Series S