***Setting***
Documentation   Este arquivo implementa funções e elementos da pagina de Cadastro de funcioari

*** Keywords ***
Cadastro novo funcionario
    [Arguments]     ${funcionario_pj_json}

    Input Text      id=inputNome    ${funcionario_pj_json['inputNome']}
    Input Text      id=inputCargo   ${funcionario_pj_json['inputCargo']}
    Input Text      id=cpf      ${funcionario_pj_json['cpf']}
    Input Text      id=dinheiro      ${funcionario_pj_json['dinheiro']}
    Input Text      id=inputAdmissao      ${funcionario_pj_json['inputAdmissao']}
    Click Element      id=pj
    Click Element      id=clt


    Click Element   class:cadastrar-form-btn
