*** Settings ***
Documentation    Login
...              Sendo um usuario do sistema 
...              Quero me autenticar no sistema


Resource    ../resources/actions.robot

# Ganho que é executa toda vez que um Caso de teste termina
Suite Setup     Open Session
Suite Teardown  Close Session

Test Teardown   After Test

*** Test Cases ***
Login com sucesso
    [tags]     login
    Dado que eu acesso a página de login
    Quando eu submeto minhas credenciais "lucianeTest" e "123456"
    Entao devo ser autenticado

    [Teardown]      After Test WCLS

*** Keywords ***
Tentativa de login
    [Arguments]    ${username}    ${pass}    ${saida}

    Dado que eu acesso a página de login
    Entao devo ver uma mensagem de alerta
    Quando eu submeto minhas credenciais "${username}" e "${pass}"
    Login para cadastrar funcionario "${username}" e "${pass}"


