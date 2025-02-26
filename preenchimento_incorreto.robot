*** Settings ***
Library    SeleniumLibrary
Library    XML
Resource    setup_teardown.robot
Test Setup    Dado que eu acesse o Organo
Test Teardown    Fechar o navegador

*** Variables ***
${CAMPO_CARD}    id:form-botao

*** Test Cases ***
Verficar se quando um campo obrigatório não for preenchido corretamente o sistema exiba campo obrigatório
    Dado que eu clique no botão criar card
    Então sistema deve apresentar mensagem de campo obrigatório 

*** Keywords ***

Dado que eu clique no botão criar card

    Click Element    ${CAMPO_CARD}

Então sistema deve apresentar mensagem de campo obrigatório

    Element Should Be Visible    id:form-nome-erro
    Element Should Be Visible    id:form-cargo-erro
    Element Should Be Visible    id:form-times-erro
