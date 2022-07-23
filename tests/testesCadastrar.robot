**Settings**
Resource    ../resources/Cadastrar.robot
# Library to use "Generate Random String" method
Library  String 

Test Setup  Open Session
Test Teardown   Close Session

**Test Cases**
Cadastrar pessoa válida
    
    ${Name} =   Generate Random String  6
    ${Email} =   Catenate    ${Name}   @test.com
    Click CadastrarUsuário
    Input Name Query  ${Name}
    Input Email Query    ${Email}
    Click Identificação Query  Mulher
    Click Estado Query    Alagoas
    Click BotaoCadastrar

    # Solução do ASSERT para identificar um toast message
    Wait Until Page Contains    Cadastro realizado com sucesso


Cadastrar pessoa duplicada
    [Tags]      duplicado
    ${NomeF} =  Generate Random String  6

    ${Name}     Set Variable    ${NomeF}
    ${Email} =   Catenate    ${NomeF}   @test.com
    Click CadastrarUsuário
    Input Name Query  ${NomeF}
    Input Email Query    ${Email}
    Click Identificação Query  Mulher
    Click Estado Query    Alagoas
    Click BotaoCadastrar

    Sleep   5

    # Click BotaoVoltar

    # Click CadastrarUsuário
    Input Name Query  ${NomeF}
    Input Email Query    ${Email}
    # Click Identificação Query  Mulher
    # Click Estado Query    Alagoas
    Click BotaoCadastrar

    # Solução do ASSERT para identificar um toast message
    Wait Until Page Contains    Email já cadastrado



Cadastrar com Nome Vazio
        [Tags]      nomeVazio
    ${NomeF} =  Generate Random String  6

    ${Name}     Set Variable    ${NomeF}
    ${Email} =   Catenate    ${NomeF}   @test.com
    Click CadastrarUsuário
    Input Name Query  ${EMPTY}
    Input Email Query    ${Email}
    Click Identificação Query  Mulher
    Click Estado Query    Alagoas
    Click BotaoCadastrar

    Wait Until Page Contains    Insira o nome completo

Cadastrar com Email Vazio

    ${NomeF} =  Generate Random String  6

    ${Name}     Set Variable    ${NomeF}
    ${Email} =   Catenate    ${NomeF}   @test.com
    Click CadastrarUsuário
    Input Name Query  ${NomeF}
    Input Email Query    ${EMPTY}
    Click Identificação Query  Mulher
    Click Estado Query    Alagoas
    Click BotaoCadastrar

    Wait Until Page Contains    Insira um email válido
