***Setting***
Documentation   Este arquivo implementa funções e elementos da pagina de Cadastro

*** Keywords ***
Cadastro novo usuario
    [Arguments]     ${usuario_json}

    Input Text      css:input[name=username]   ${usuario_json['username']}
    Input Text      css:input[name=pass]      ${usuario_json['pass']}
    Input Text      css:input[name=confirmpass]      ${usuario_json['confirmpass']}
    Click Element   class:login100-form-btn
