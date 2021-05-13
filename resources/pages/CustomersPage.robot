***Settings***
Documentation   Representação da página clientes com seus elementos e ações

***Variables***
${CUSTOMERS_FORM}   css:a[href$='/register']
${LABEL_NAME}       css:label[for=name]                  
${LABEL_CPF}        css:label[for=cpf]         
${LABEL_ADDRESS}    css:label[for=address]     
${LABEL_PHONE}      css:label[for=phone_number]
${CUSTOMERS_LIST}   css:table

***Keywords***
Register New Customer
    [Arguments]     ${name}     ${cpf}      ${address}      ${phone_number}

    Reload Page
    #Wait Until Element is Visible   id:name 

    Input Text      id:name             ${name} 
    Input Text      id:cpf              ${cpf}
    Input Text      id:address          ${address}
    Input Text      id:phone_number     ${phone_number}

    Click Element   xpath://button[text()='CADASTRAR']

Got To Customer Details
    [Arguments]     ${cpf_formatado}

    ${element}=     Set Variable    xpath://td[text()='${cpf_formatado}']     

    Reload Page
    #Wait Until Element is Visible   ${element}      5
    
    Click Element                   ${element}      

Click Remove Customer 
    ${element}=     Set Variable    xpath://button[text()='APAGAR']

    Reload Page
    #Wait Until Element is Visible   ${element}      5

    Click Element                   ${element}      
