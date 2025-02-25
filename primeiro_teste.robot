*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***

Abrir navegador e depois acessar o site do organo
    Open Browser    url=http://localhost:3000/    browser=Chrome


Preencher os campos do formulário
    Input Text    id:form-nome      isadora
    Input Text    id:form-cargo     Design
    Input Text    id:form-imagem    https://picsum.photos/200/300
    Click Element    class:lista-suspensa    
    Click Element    //option[contains(.,'UX e Design')]
    Sleep    10s
    Click Element    id:form-botao
    Element Should Be Visible    class:colaborador    
    Sleep    10s