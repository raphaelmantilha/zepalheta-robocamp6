***Settings***
Documentation   Representação da página de contratos de aluguéis

***Variables***
${CONTRACTS_FORM}   css:a[href$='/register']

***Keyword***
Create a New Contracts
    [Arguments]     ${customer_name}    ${equipo_name}

     Wait Until Element Is Visible       xpath://div[contains(text(), 'Escolha o locatário')]
    Click Element                       xpath://div[contains(text(), 'Escolha o locatário')]
    
    # Sleep                               1
    # ${code}=                            Get Source
    # Log                                 ${code}
    
    Click Element                       xpath://div[contains(text(), '${customer_name}')]   
    Click Element                       xpath://div[contains(text(), 'Escolha o item')]
    Click Element                       xpath://div[contains(text(), '${equipo_name}')]   

    Input Text                          id:delivery_price           10
    Input Text                          id:quantity                 1

    Click Element                       css:button[type=submit]
    Click Element                       xpath://button[text()='CADASTRAR']