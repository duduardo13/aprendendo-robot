*** Settings ***
Resource    ../main.robot

*** Variables ***
${CAMPO_NOME}             id:form-nome
${CAMPO_CARGO}            id:form-cargo
${CAMPO_IMAGEM}           id:form-imagem
${CAMPO_TIME}             class:lista-suspensa
${BOTAO_CARD}             id:form-botao
@{selecionar_times}
...      //option[contains(.,'Programação')]
...      //option[contains(.,'Front-End')]
...      //option[contains(.,'Data Science')]
...      //option[contains(.,'Devops')] 
...      //option[contains(.,'UX e Design')]
...      //option[contains(.,'Mobile')]
...      //option[contains(.,'Inovação e Gestão')]
${CARD_COLABORADOR}             class:colaborador

*** Keywords ***

Dado que preencha os campos do formulário
    
    ${NOME}        FakerLibrary.FirstName
    Input Text    ${CAMPO_NOME}      ${NOME}

    ${Cargo}        FakerLibrary.Job
    Input Text    ${CAMPO_CARGO}     ${Cargo}

    ${Imagem}    FakerLibrary.Image Url    width=100    height=100
    Input Text    ${CAMPO_IMAGEM}    ${IMAGEM}
    Click Element    ${CAMPO_TIME}    
    Click Element    ${selecionar_times}[0]

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

Então criar e indentificar um card em cada time disponível
    
    FOR    ${indice}    ${times}    IN ENUMERATE    @{selecionar_times}
        Dado que preencha os campos do formulário
        Click Element            ${times}
    END
Dado que eu clique no botão criar card

    Click Element    ${BOTAO_CARD}

Então sistema deve apresentar mensagem de campo obrigatório

    Element Should Be Visible    id:form-nome-erro
    Element Should Be Visible    id:form-cargo-erro
    Element Should Be Visible    id:form-times-erro
