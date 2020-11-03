***Setting***
Documentation   Este arquivo implementa funções e elementos da pagina de login

*** Keywords ***
Login With
    [Arguments]     ${username}     ${pass}

    Input Text      css:input[name=username]   ${username}
    Input Text      css:input[name=pass]      ${pass}
    Click Element   class:login100-form-btn



    
