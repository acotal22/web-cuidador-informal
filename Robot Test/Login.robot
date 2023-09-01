*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${BROWSER}              Chrome
${LOGIN_URL}            http://127.0.0.1:8000/accounts/login/
${USERNAME}             testcuidador
${PASSWORD}             Robotcuidador11
${INVALID_USERNAME}     invaliduser
${INVALID_PASSWORD}     invalidpassword


*** Test Cases ***
Valid Login
    [Documentation]    Test para la validación de un acceso correcto con las credenciales
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Input Text    id=id_username    ${USERNAME}
    Input Password    id=id_password    ${PASSWORD}
    Click Element    xpath:/html/body/div/main/div/div/div/div/form/div/div[2]/p/button
    Wait Until Page Contains    ${USERNAME}
    Close Browser

Invalid Username Test
    [Documentation]    Test con username incorrecto
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Input Text    id=id_username    ${INVALID_USERNAME}
    Input Password    id=id_password    ${PASSWORD}
    Click Element    xpath:/html/body/div/main/div/div/div/div/form/div/div[2]/p/button
    Wait Until Page Contains    Usuario o contraseña incorrectos
    Sleep    3s
    Close Browser

Invalid Password Test
    [Documentation]    Contraseña incorrecta
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Input Text    id=id_username    ${USERNAME}
    Input Password    id=id_password    ${INVALID_PASSWORD}
    Click Element    xpath:/html/body/div/main/div/div/div/div/form/div/div[2]/p/button
    Wait Until Page Contains    Usuario o contraseña incorrectos
    Close Browser

Empty Username Test
    [Documentation]    Campo de username vacio
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Input Password    id=id_password    ${PASSWORD}
    Click Element    xpath:/html/body/div/main/div/div/div/div/form/div/div[2]/p/button
    ${tooltip}    Get Element Attribute    id=id_username    required
    Should Contain    ${tooltip}    true
    Close Browser

Empty Password Test
    [Documentation]    Campo de contraseña vacio
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Input Text    id=id_username    ${USERNAME}
    Click Element    xpath:/html/body/div/main/div/div/div/div/form/div/div[2]/p/button
    ${tooltip}    Get Element Attribute    id=id_password    required
    Should Contain    ${tooltip}    true
    Close Browser
