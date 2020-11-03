*** Settings ***
Documentation    Cadastro de um novo funcionario
...              Sendo um administrador do sistema 
...              Quero cadastrar um novo funcionario no sistema


Resource    ../resources/actions.robot

# Ganho que é executa toda vez que um Caso de teste termina
Suite Setup     Open Session
Suite Teardown  Close Session

Test Teardown   After Test

*** Test Cases ***
Cadastrar Funcionario
    [tags]     cadastro
    Dado que eu acesso a página de login
    Login para cadastrar funcionario "lucianeTest" e "123456"
    Quando eu faço o cadastro do funcionario    funcionario_pj.json

Editar Funcionario
    Editar funcionario cadastrado 

Deletar Funcionário
    Deletar funcionario cadastrado


    [Teardown]      After Test WCLS
