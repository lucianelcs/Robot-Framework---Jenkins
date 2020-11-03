*** Settings ***
Documentation    Cadastro de usuário
...              Sendo um usuário do sistema 
...              Quero cadastrar no sistema
...              Para ter acesso a lista de funcionários


Resource    ../resources/actions.robot

# Ganho que é executa toda vez que um Caso de teste termina
Suite Setup     Open Session
Suite Teardown  Close Session

Test Teardown   After Test

*** Test Cases ***
Cadastro com sucesso
    [tags]     cadastro
    Dado que eu acesso a página de login
    Quando eu faço o cadastro do usuário    usuario.json

Este cadastro já existe
    Quando eu faço o cadastro do usuário    usuario.json
 
    [Teardown]      After Test WCLS
