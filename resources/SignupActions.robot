*Settings*
Documentation           Ações do sistema

*Keywords*
Go To Login Page
     Go To       ${BASE_URL}
     wait for elements state        css.login-form      visible         5


Go To Signup Form
    Go To       ${BASE_URL}/signup

    Wait For Elements State     css=.signup-form    visible     5

Fill Signup Form
    [Arguments]         ${user}

    Fill Text       id=name         ${user}[name]
    Fill Text       id=lastname     ${user}[lastname]
    Fill Text       id=email        ${user}[email]
    Fill Text       id=password     ${user}[password]

Submit Signup Form
    Click           css=.submit-button >> text=Cadastrar

User Should Be Registered

    ${expect_message}       Set Variable      css=p >> text=Agora você faz parte da Getgeeks. Tenha uma ótima experiência.    
    
    Wait For Elements State      ${expect_message}       visible     5

Modal Content Should Be
    [Arguments]         ${expected_text}

    ${title}        Set Variable        css=.swal2-title
    ${content}      Set Variable        css=.swal2-html-container

    Wait For Elements State     ${title}         visible     5
    Get Text                    ${title}         equal       Oops...

    Wait For Elements State     ${content}       visible     5
    Get Text                    ${content}       equal       ${expected_text}

Alert Span Should Be
    [Arguments]     ${expected_notice}

    Wait For Elements State     css=span[class=error] >> text=${expected_notice}
    ...                         visible     5

Alert Spans Should Be 
    [Arguments]      ${expected_alerts}  
    

    @{go_alerts}        Create List 

    ${spans}            Get Elements        xpath=//span[@class="error"]                                                             ##usou # pq GET elements pq ela já devolve a lista, ou seja, esse xpath tem 4 elemtnso na página.
    #  log to console      meus spans é :        ${spans}  

    FOR     ${s}        IN    @{spans} 

      ${texto}                      GET TEXT             ${s}                                                                        ###pega o texto de CADA elemento 
      Append To List                ${go_alerts}         ${texto}

    END

    Lists Should Be Equal       ${expected_alerts}          ${go_alerts} 




