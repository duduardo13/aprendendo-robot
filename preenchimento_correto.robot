*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary    locale=pt_BR
Resource    setup_teardown.robot
Test Setup    Dado que eu acesse o Organo
Test Teardown    Fechar o navegador

*** Variables ***

${CAMPO_NOME}             id:form-nome
${CAMPO_CARGO}            id:form-cargo
${CAMPO_IMAGEM}           id:form-imagem
${CAMPO_TIME}             class:lista-suspensa
${BOTAO_CARD}             id:form-botao
${OPCAO_PROGRAMACAO}      //option[contains(.,'Programação')]
${OPCAO_FRONT}            //option[contains(.,'Front-End')]
${OPCAO_DADOS}            //option[contains(.,'Data Science')]
${OPCAO_DEVOPS}           //option[contains(.,'Devops')] 
${OPCAO_UX}               //option[contains(.,'UX e Design')]
${OPCAO_MOBILE}           //option[contains(.,'Mobile')]
${OPCAO_INOVACAO}         //option[contains(.,'Inovação e Gestão')]
${CARD_COLABORADOR}             class:colaborador

*** Test Cases ***
Verificar se ao preencher os campos do formulário corretamente os dados são inseridos na lista e se um novo card é criado no time esperado
    
    Dado que preencha os campos do formulário
    E clique no botão criar card
    Então identificar o card no time esperado

Verificar se é possível criar mais de um card se preenchermos corretamente
    
    Dado que preencha os campos do formulário
    E clique no botão criar card
    Então identificar 3 cards


*** Keywords ***

Dado que preencha os campos do formulário
    
    ${NOME}        FakerLibrary.FirstName
    Input Text    ${CAMPO_NOME}      ${NOME}

    ${Cargo}        FakerLibrary.Job
    Input Text    ${CAMPO_CARGO}     ${Cargo}

    ${Imagem}    FakerLibrary.Image Url
    Input Text    ${CAMPO_IMAGEM}    ${IMAGEM}
    Click Element    ${CAMPO_TIME}    
    Click Element    ${OPCAO_PROGRAMACAO}

E clique no botão criar card   
    Click Element    ${BOTAO_CARD}

Então identificar o card no time esperado
    Element Should Be Visible    ${CARD_COLABORADOR}    

Então identificar 3 cards
    FOR    ${i}    IN RANGE    1    3
        Dado que preencha os campos do formulário
        E clique no botão criar card
        
    END    
    Sleep    10s
    