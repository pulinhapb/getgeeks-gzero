*Settings*
Documentation           Authentication actions

*Variables*
${INPUT_EMAIL}          id=email
${INPUT_PASS}           id=password

*Keywords*
Go To Login Page
    Go To       ${BASE_URL}

    Wait For Elements State     css=.login-form     visible     5

Fill Credentials
    [Arguments]         ${user}
    Clear Text          ${INPUT_EMAIL}        
    Fill Text           ${INPUT_EMAIL}        ${user}[email]
    Fill Text           ${INPUT_PASS}         ${user}[password]


Fill Credentials email
    [Arguments]         ${user}

    Fill Text           ${INPUT_EMAIL}        ${user}[email]
 

Fill Credentials senha
    [Arguments]         ${user}

    Fill Text           ${INPUT_EMAIL}        ${user}[password]

Submit Credentials
    Click               css=.submit-button >> text=Entrar

User Should Be Logged In
    [Arguments]         ${user}

    ${element}              Set Variable        css=a[href="/profile"]
    ${expected_fullname}    Set Variable        ${user}[name] ${user}[lastname]

    Wait For Elements State     ${element}      visible     5
    Get Text                    ${element}      equal       ${expected_fullname}

Should Be Type Email
    Get Property           ${INPUT_EMAIL}        type        equal       email


Alerta Login email
    [Arguments]     ${expected_notice}

    Wait For Elements State     xpath=//span[contains(text(),'E-mail obrigatório')]>> text=E-mail obrigatório
    ...                         visible     5
    Get text        xpath=//span[contains(text(),'E-mail obrigatório')]   equal     E-mail obrigatório 

Alerta Login senha

     [Arguments]     ${expected_notice}

    Wait For Elements State     xpath=//span[contains(text(),'Senha obrigatória')]>> text=Senha obrigatória
    ...                         visible     5
    Get text        xpath=//span[contains(text(),'Senha obrigatória')]   equal    Senha obrigatória


