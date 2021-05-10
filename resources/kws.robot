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

    Wait Until Element Contains     ${TOASTER_ERROR_P}   ${expected_message}

##Customers
Dado que acesso o formulário de cadastro de Clientes
    Wait Until Element is Visible   ${NAV_CUSTOMERS}    5
    Click Element                   ${NAV_CUSTOMERS}
    Wait Until Element is Visible   ${CUSTOMERS_FORM}     5
    Click Element                   ${CUSTOMERS_FORM}

E que eu tenho o seguinte cliente:
    [Arguments]     ${name}     ${cpf}      ${address}      ${phone_number}

    Remove Customer By Cpf  ${cpf}

    # Para que as variáveis fiquem disponíveis no escopo do teste
    Set Test Variable   ${name}
    Set Test Variable   ${cpf}
    Set Test Variable   ${address}
    Set Test Variable   ${phone_number}

Mas este CPF já existe no sistema
    Insert Customer     ${name}     ${cpf}      ${address}      ${phone_number}

Quando faço a inclusão desse cliente
    Register New Customer   ${name}     ${cpf}      ${address}      ${phone_number}

Então devo ver a notificação:
    [Arguments]     ${expected_notice}

    Wait Until Element Contains         ${TOASTER_SUCCESS}    ${expected_notice}      5
    Wait Until Element Is Not Visible   ${TOASTER_SUCCESS}      20    

Então devo ver a notificação de erro:
    [Arguments]     ${expected_notice}

    Wait Until Element Contains     ${TOASTER_ERROR}    ${expected_notice}      5
    Wait Until Element Is Not Visible   ${TOASTER_ERROR}        20
    # Sleep                           30
    # Click Element                   ${TOASTER_ERROR}

Então devo ver mensagens informando que os campos do cadastro de clientes são obrigatórios
    Wait Until Element Contains     ${LABEL_NAME}       Nome é obrigatório          5
    Wait Until Element Contains     ${LABEL_CPF}        CPF é obrigatório           5
    Wait Until Element Contains     ${LABEL_ADDRESS}    Endereço é obrigatório      5
    Wait Until Element Contains     ${LABEL_PHONE}      Telefone é obrigatório      5

Então devo ver o texto 
    [Arguments]     ${expected_text}

     Wait Until Page Contains    ${expected_text}       5