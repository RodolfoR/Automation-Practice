*** Settings ***
Library         SeleniumLibrary

*** Variable ***

${URL}          http://automationpractice.com/index.php
${BROWSER}      Chrome

*** Keywords ***
Abrir Navegador
    Open Browser    about:blank    ${BROWSER}

Fechar Navegador
    Capture Page Screenshot      resultado.png
    Close Browser

Acessar a pagina home do site
    Go To                   ${URL}
    Title Should Be         My Store
    Log                     ${URL}

Clicar no menu Sign In
    Click Element       class:login
    

Informar o e-mail "${EMAIL}" e a senha "${SENHA}"
    Input Text      id:email        ${EMAIL}
    Input Text      id:passwd       ${SENHA}
    Log             Dados de Acesso: E-mail: ${EMAIL} - senha: ${SENHA}

Clicar no botao Sign In
    Click Element       id:SubmitLogin
    #Sleep               10

Conferir mensagem de retorno "${MENSAGEM_SUCESSO}"
    Wait Until Element Is Visible       class:info-account
    Element Text Should Be              class:info-account      ${MENSAGEM_SUCESSO}

Conferir mensagem de erro
    Wait Until Element Is Visible       class:alert-danger
    Element Text Should Be              xpath=//*[@class='alert alert-danger']//p[contains(text(), 'There is 1 error')]
    ...                                 There is 1 error

Clicar no botao Sign Out
    Wait Until Element Is Visible       class:header_user_info
    Click Element                       class:header_user_info

