***Settings***

Library     SeleniumLibrary

Library     libs/db.py

Resource    kws.robot
Resource    hooks.robot
Resource    services.robot

Resource    components/Sidebar.robot
Resource    components/Toaster.robot

Resource    pages/LoginPage.robot
Resource    pages/CustomersPage.robot
Resource    pages/ContractsPage.robot

***Variables***
${base_url}     http://zepalheta-web:3000
${admin_user}   admin@zepalheta.com.br
${admin_pass}   pwd123

# #Simples 
# ${nome}     Fernando Papito 

# #Lista
# @{carros}   Civic   Lancer  Accord  Chevette

# #Dicionário
# &{cliente}  nome=Bon Jovi   cpf=0000001406  email=bonjuvi@gmail.com     telefone=11999999999