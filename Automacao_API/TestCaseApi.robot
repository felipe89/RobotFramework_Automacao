*** Settings ***
Documentation      Documentação de API: https://fakerestapi.azurewebsites.net/index.html
Resource           ResourcesAPI.robot
Suite Setup        Conectar a minha API

*** Test Cases ***
Buscar a listagem de todos os livros (GET em todos os livors)
    Requisitar todos os livros
    Conferir o status code         200
    Conferir o reason            OK
    Conferir se a api retorna "30" itens listados

Buscar um item especifico (GET item especifico)
    Requisitar o item "10"
    Conferir o status code         200
    Conferir o reason             OK
    Conferir se retorna todos os dados corretos do item 10

Cadastrar um novo item (POST)
    Cadastrar um novo item
    Conferir o status code         200
    Conferir o reason             OK

# Alterar um item cadastrado (PUT)

# Deletar um item cadastrado (DELETE)
