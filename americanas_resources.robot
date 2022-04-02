*** Settings ***
Library        SeleniumLibrary
Library    OperatingSystem
Library    XML


*** Variables ***
${BROWSER}    chrome
${URL}    https://www.americanas.com.br/
${MENU_PRODUTO}    //a[@class='trending-departments-item__Link-sc-1q0sogn-2 iFczCe'][contains(.,'informática')]
${LUPA_BUSCA}    //input[contains(@type,'text')] 
${BOTAO_BUSCAR}    //button[contains(@class,'search__SearchButtonUI-sc-1wvs0c1-4 laEttB')]

*** Keywords ***

Abrir o navegador
    Open Browser       browser=${BROWSER}
    Maximize Browser Window

Fechar o navegador
    Close Browser
    Capture Page Screenshot

Acessar a home page do site da lojas "Americanas"
    Go To     url=${URL}

Acessar a opção "informática"
    Wait Until Element Is Visible     locator=${MENU_PRODUTO} 
    Click Element    locator=${MENU_PRODUTO} 

Validar que eu esteja na pagina contendo o texto "${TEXTO_SAUDACAO}" como titulo
    Element Should Be Visible    locator=//h2[contains(.,'${TEXTO_SAUDACAO}')]

No campo de busca informar o produto "${PRODUTO}"
    Input text     locator=${LUPA_BUSCA}    text=${PRODUTO}
    Click Button    locator=${BOTAO_BUSCAR} 

Validar o resultado da busca
    Wait Until Element Is Visible     locator=//div[contains(@class,'grid__StyledGrid-sc-1man2hx-0 iFeuoP src__GridItem-sc-122lblh-0 gGJHBq')]

Clicar em um do produtos da busca 
    Wait Until Element Is Visible     locator=//img[@alt='Console Playstation 5 - PS5']
    Mouse Down        locator=//img[@alt='Console Playstation 5 - PS5']
    Click Element    text=Console Playstation 5 - PS5