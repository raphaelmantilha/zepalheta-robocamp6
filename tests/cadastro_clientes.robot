***Settings***
Documentation   Cadastro de Clientes

Resource        ../resources/base.robot

Suite Setup      Login Session
Suite Teardown   Finish Session

***Test Cases***
Novo cliente
    Dado que acesso o formulário de cadastro de Clientes
    Quando faço a inclusão desse cliente: 
    ...     Bon Jovi    00000001406     Rua dos Bugs, 1000      11999999999
    Então devo ver a notificação:   Cliente cadastrado com sucesso!  

Campos Obrigatórios
    [tags]  temp
    Dado que acesso o formulário de cadastro de Clientes
    Quando faço a inclusão desse cliente: 
    ...     ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}
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

***Keywords***
Validação de Campos
    [Arguments]     ${nome}     ${CPF}      ${endereco}      ${telefone}     ${saida}      

    Dado que acesso o formulário de cadastro de Clientes
    Quando faço a inclusão desse cliente: 
    ...     ${nome}     ${CPF}      ${endereco}      ${telefone} 
    Então devo ver o texto   ${saida}