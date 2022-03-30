*** Settings ***
Library           SeleniumLibrary
Library    OperatingSystem


*** Variables ***
${URL}            https://www.amazon.com.br
${MENU_LIVRO}     //a[@href='/Livros/b/?ie=UTF8&node=6740748011&ref_=nav_cs_books'][contains(.,'Livros')]
${TEXTO_HEADER_LIVRO}    Loja de Livros
${HEADER_LIVRO}    //h1[contains(.,'Loja de Livros')]

*** Keywords ***
Abrir o navegador     
    Open Browser   browser=chrome
    Maximize Browser Window

Fechar o navegador
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To       url=${URL}
    Wait Until Element Is Visible      locator=${MENU_LIVRO} 

Entrar no menu "Livros"
    Click Element     locator=${MENU_LIVRO}

Verificar se aparece a frase "Loja de Livros"
    Wait Until Page Contains     text=${TEXTO_HEADER_LIVRO}
    Wait Until Element Is Visible     locator=${HEADER_LIVRO} 

