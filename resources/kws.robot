***Keywords***
## Login
Acesso a página Login
    Go To       ${base_url}

Submeto minhas credenciais
    [Arguments]     ${email}        ${password}

    Login With      ${email}        ${password}

Devo ver a área logada
    Wait Until Page Contains    Aluguéis    5
    
Devo ver um toaster com a mensagem
    [Arguments]     ${expected_message}

    Wait Until Element Contains     ${TOASTER_ERROR}   ${expected_message}

##Customers
Dado que acesso o formulário de cadastro de Clientes
    Wait Until Element is Visible   ${NAV_CUSTOMERS}    5
    Click Element                   ${NAV_CUSTOMERS}
    Wait Until Element is Visible   ${CUSTOMERS_FORM}     5
    Click Element                   ${CUSTOMERS_FORM}

Quando faço a inclusão desse cliente:
    [Arguments]     ${name}     ${cpf}      ${address}      ${phone_number}

    Remove Customer By Cpf  ${cpf}
    Register New Customer   ${name}     ${cpf}      ${address}      ${phone_number}

Então devo ver a notificação:
    [Arguments]     ${expected_notice}

    Wait Until Element Contains     ${TOASTER_SUCCESS}    ${expected_notice}      5

Então devo ver mensagens informando que os campos do cadastro de clientes são obrigatórios
    Wait Until Page Contains    Nome é obrigatório      5
    Wait Until Page Contains    CPF é obrigatório       5
    Wait Until Page Contains    Endereço é obrigatório  5
    Wait Until Page Contains    Telefone é obrigatório  5

Então devo ver o texto 
    [Arguments]     ${expected_text}

     Wait Until Page Contains    ${expected_text}       5