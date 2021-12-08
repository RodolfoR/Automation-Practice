*** Settings ***
Resource        ../Resources/resource-login.robot
Test Setup      Abrir Navegador
Test Teardown   Fechar Navegador

*** Variable ***

${MENSAGEM_SUCESSO}         Welcome to your account. Here you can manage all of your personal information and orders.

*** Test Cases ***
Caso de Teste 01 - Realizar Login com Sucesso
    Acessar a pagina home do site
    Clicar no menu Sign In
    Informar o e-mail "automacao@email.com" e a senha "Auto123123"
    Clicar no botao Sign In
    Conferir mensagem de retorno "${MENSAGEM_SUCESSO}"

Caso de Teste 02 - Realizar Login com Falha
    Acessar a pagina home do site
    Clicar no menu Sign In
    Informar o e-mail "automacao@email.com" e a senha "Auto123"
    Clicar no botao Sign In
    Conferir mensagem de erro

Caso de Teste 03 - Realizar Logout
    Acessar a pagina home do site
    Clicar no menu Sign In
    Informar o e-mail "automacao@email.com" e a senha "Auto123123"
    Clicar no botao Sign In
    Clicar no botao Sign Out
