***Settings***
Documentation       Representação do menu lateral de navegação na área logada

***Variables***
${NAV_CUSTOMERS}    css:a[href='/customers']

***Keywords***
Go To Customers
    Wait Until Element is Visible   ${NAV_CUSTOMERS}    5
    Click Element                   ${NAV_CUSTOMERS}
