*Settings*
Documentation           Signup Test Suite

Library         Collections


*Test Cases*
Trabalhando com listas
    @{avengers}         Create List         Paula       Henry       Thaís       Pedro

    #adicionando mais item na lista , usa :
    Append To List      ${avengers}         Verônica
    Append To List      ${avengers}         Neiva


    FOR     ${a}        IN      ${avengers}
        Log to console          ${a}
    END

Comparar DUAS LISTAS
    @{LISTA001}         Create List         Paula       Henry       Thaís       Pedro


    FOR     ${a}        IN      ${LISTA001}
        Log to console          ${a}
    END


     @{LISTA002}         Create List          Paula       Henry       Thaís       Lucas

     #comparar duas listas , faz :
     Lists should Be Equal           ${LISTA001}         ${LISTA002}