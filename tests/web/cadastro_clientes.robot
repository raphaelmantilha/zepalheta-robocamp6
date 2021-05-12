***Settings***
Documentation   Cadastro de Clientes

Resource        ../../resources/base.robot

Suite Setup      Login Session
Suite Teardown   Finish Session

***Test Cases***
Novo cliente
    [Tags]  smoke
    Dado que acesso o formulário de cadastro de Clientes
    E que eu tenho o seguinte cliente:
    ...     Bon Jovi    00000001406     Rua dos Bugs, 1000      11999999999
    Quando faço a inclusão desse cliente
    Então devo ver a notificação:   Cliente cadastrado com sucesso!  
    E esse cliente deve ser exibido na lista

Cliente duplicado
    [Tags]  dup
    Dado que acesso o formulário de cadastro de Clientes
    E que eu tenho o seguinte cliente:
    ...     Adrian Smith    00000001407     Rua dos Bugs, 2000      11999999991
    Mas este CPF já existe no sistema
    Quando faço a inclusão desse cliente
    Então devo ver a notificação de erro:   Este CPF já existe no sistema!
                                            
Campos Obrigatórios
    [Tags]  temp
    Dado que acesso o formulário de cadastro de Clientes
    E que eu tenho o seguinte cliente:
    ...     ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}
    Quando faço a inclusão desse cliente
    Então devo ver mensagens informando que os campos do cadastro de clientes são obrigatórios  

Nome é obrigatório
    [Template]  Validação de Campos
    ${EMPTY}            00000010646     Avenida Paulista, 1000  11999999999     Nome é obrigatório

CPF é obrigatório       
    [Template]  Validação de Campos
    Raphael Mantilha    ${EMPTY}        Avenida Paulista, 1000  11999999999     CPF é obrigatório

Endereço é obrigatório  
    [Template]  Validação de Campos
    Raphael Mantilha    ${EMPTY}        ${EMPTY}                11999999999     Endereço é obrigatório

Telefone é obrigatório  
    [Template]  Validação de Campos
    Raphael Mantilha    ${EMPTY}        Avenida Paulista, 1000  ${EMPTY}        Telefone é obrigatório

Telefone incorreto
    [Template]  Validação de Campos
    Raphael Mantilha    00000010646     Avenida Paulista, 1000  1199999999      Telefone inválido  

***Keywords***
Validação de Campos
    [Arguments]     ${nome}     ${CPF}      ${endereco}      ${telefone}     ${saida}      

    Dado que acesso o formulário de cadastro de Clientes
    E que eu tenho o seguinte cliente:
    ...     ${nome}     ${CPF}      ${endereco}      ${telefone} 
    Quando faço a inclusão desse cliente
    Então devo ver o texto   ${saida}