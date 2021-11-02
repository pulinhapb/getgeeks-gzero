*Settings*
Documentation    Login test suite do LOGIN

Resource    ${EXECDIR}/resources/Base.robot

Test Setup       Start Session
Test Teardown    Finish Session

*Test Cases*
User login
     [Tags]    novo
    ${user}    Factory User Login

    Go To Login Page
    Fill Credentials            ${user}
    Submit Credentials
    User Should Be Logged In    ${user}

Incorrect Pass
    [Tags]    inv_pass

    ${user}    Create Dictionary    email=paulinha.jampa@gmail.com    password=kkk123

    Go To Login Page
    Fill Credentials           ${user}
    Submit Credentials
    Modal Content Should Be    Usuário e/ou senha inválidos.

User not found
    [Tags]    user_404

    ${user}    Create Dictionary     email=paulinha.jampa@gmail.com    password=kkk123

    Go To Login Page
    Fill Credentials           ${user}
    Submit Credentials
    Modal Content Should Be    Usuário e/ou senha inválidos.

Incorret Email
    [Tags]    inv_email

    ${user}    Create Dictionary    email=paulinha.com.br    password=abc123

    Go To Login Page
    Fill Credentials        ${user}
    Submit Credentials
    Should Be Type Email

# Desafio 1 do módulo PRO
# Automatizar 3 novos casos de testes: Email obrigatório, Senha obrigatória, Campos obrigatórios
# Entrega: no Github

email obrigatório
    [Tags]    email_obg

    ${user}    Create Dictionary    email=${EMPTY}    password=kkk123

    Go To Login Page
    Fill Credentials      ${user}
    Submit Credentials
   Alerta Login email          E-mail obrigatório 

senha obrigatório
    [Tags]    senha_obg

    ${user}    Create Dictionary    email=paulinha.jampa@gmail.com    password=${EMPTY}

    Go To Login Page
    Fill Credentials      ${user}
    Submit Credentials
    Alerta Login senha    Senha obrigatória

Campos obrigatórios
    [Tags]    campos_obg

    ${user}    Create Dictionary    email=${EMPTY}    password=${EMPTY}

    Go To Login Page
    #Fill Credentials      ${user}
    Submit Credentials
    Alerta Login email    E-mail obrigatório 
    Alerta Login senha    Senha obrigatória
