** Settings ***
Documentation    Actions é o arquivo que terá keywords que implementam os steps

Library    SeleniumLibrary
Library    OperatingSystem

Resource    pages/BasePage.robot
Resource    pages/LoginPage.robot
Resource    pages/CadastroPage.robot
Resource    pages/CadastroFuncionarioPage.robot
Resource    pages/Sidebar.robot


*** Keywords ***
### Helpers
Get Lista Json
    [Arguments]     ${file_name}

    ${file}=    Get File    resources/fixtures/${file_name}
    ${json}=    Evaluate    json.loads($file)          json

    [return]    ${json}


Dado que eu acesso a página de login
    Go To      ${base_url}/accounts/login 

##Cadastro
Quando eu faço o cadastro do usuário
   [Arguments]     ${file_name}

   ${lista_json}=    Get Lista Json     ${file_name}
    Click Element   class:txt2 
    Cadastro novo usuario    ${lista_json}

##Cadastro já existe
Quando eu tento cadastrar um usuário já cadastrado
   [Arguments]     ${file_name}

   ${lista_json}=    Get Lista Json     ${file_name}
    Click Element   class:txt2 
    Cadastro novo usuario    ${lista_json}
    Wait Until Element Is Visible     class:container-login100-form-btn     

### Login
Quando eu submeto minhas credenciais "${username}" e "${pass}"
    Login With    ${username}    ${pass}

Entao devo ser autenticado
    # Checkpoint
    Wait Until Element Is Visible    ${LOGGED_USER}

Entao devo ver uma mensagem de alerta
    Login With    ${username}    ${pass}
    Wait Until Element Contains    class:alert    ${expect_message}


###Cadastro de Funcionario
Login para cadastrar funcionario "${username}" e "${pass}"
    Login With    ${username}    ${pass}

Quando eu faço o cadastro do funcionario
   [Arguments]     ${file_name}

   ${lista_json}=    Get Lista Json     ${file_name}
    Click Link       xpath=//a[@href="/empregados/new_empregado"]
    Cadastro novo funcionario    ${lista_json}
    Click Element  xpath=//select[@name="sexo"]/option[3]
    Click Element   id=pj
    Click Element   class:cadastrar-form-btn
    Wait Until Element Contains    class:alert     SUCESSO! Usuário cadastrado com sucesso
 
 ###Editar funcionario
Login para editat funcionario "${username}" e "${pass}"
    Login With    ${username}    ${pass}

Editar funcionario cadastrado  
    Click Element      class:btn-warning
    Click Element   id=clt
    Click Element   class:cadastrar-form-btn
    Wait Until Element Contains    class:alert     SUCESSO! Informações atualizadas com sucesso

###Deletar funcionario
Login para deletar funcionario "${username}" e "${pass}"
    Login With    ${username}    ${pass}

Deletar funcionario cadastrado
    Click Element   id=delete-btn
    Wait Until Element Contains     class:alert      SUCESSO! Funcionário removido com sucesso




