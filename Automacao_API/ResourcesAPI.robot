*** Settings ***
Documentation     Documentação de API: https://fakerestapi.azurewebsites.net/index.html
Library        RequestsLibrary
Library        Collections

*** Variables ***
${URL_API}     https://fakerestapi.azurewebsites.net/api/v1/
&{ITEM_API}    id=10
...            title=Activity 10
...            dueDate=2022-04-04T09:22:52.3902564+00:00
...            completed=True



*** Keywords ***
###Setup e TearDown
Conectar a minha API
    Create Session        fakeApi    ${URL_API} 

###Ações API
Requisitar todos os livros
    ${RESPOSTA}    Get Request    fakeApi        Activities
    Log        ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA} 

Requisitar o item "${ID_ITEM}"
    ${RESPOSTA}    Get Request    fakeApi        Activities/${ID_ITEM}
    Log        ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA} 

Cadastrar um novo item
    ${HEADERS}     Create Dictionary              content-type=application/json
    ${RESPOSTA}    Post Request    fakeApi        Activities
    ...                            data={"id": 1551,"title": "TESTES AUTOMATIZADO","dueDate": "2022-04-03T23:47:03.478Z","completed": true}
    ...                            headers=${HEADERS} 
    Log    ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA} 

####Conferencias 
Conferir o status code
    [Arguments]    ${STATUS_CODE_DESEJADO}
    Should Be Equal As Strings     ${RESPOSTA.status_code}    ${STATUS_CODE_DESEJADO}

Conferir o reason 
    [Arguments]    ${REASON_DESEJADO}
    Should Be Equal As Strings    ${RESPOSTA.reason}    ${REASON_DESEJADO}

Conferir se a api retorna "${QTDE_ITENS}" itens listados 
    Length Should Be        ${RESPOSTA.json()}         ${QTDE_ITENS}  

Conferir se retorna todos os dados corretos do item 10
    Dictionary Should Contain Item    ${RESPOSTA.json()}     id            ${ITEM_API.id} 
    Dictionary Should Contain Item    ${RESPOSTA.json()}     title         ${ITEM_API.title} 
    
    Should Not Be Empty    ${RESPOSTA.json()["dueDate"]} 

    Dictionary Should Contain Item    ${RESPOSTA.json()}     completed         ${ITEM_API.completed} 
