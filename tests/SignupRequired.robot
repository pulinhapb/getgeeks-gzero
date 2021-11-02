*Settings*
Documentation           Signup Test Suite

Resource        ${EXECDIR}/resources/Base.robot

Suite Setup      Signup Submit Without Form 
Test Teardown    Finish Session

*Test Cases*
Name is Required
    Alert Span Should Be    Cadê o seu nome?

Lastname is Required
    Alert Span Should Be    Cadê o seu sobrenome?


Email is Required
    Alert Span Should Be    O email é importante também!


Paswword is Required
    Alert Span Should Be    agora só falta a senha!


*Keywords*
Signup Without Fill Form
    Start Session
    Go To Signup Form
    Submit Signup Form