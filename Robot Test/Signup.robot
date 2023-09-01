*** Settings ***
Library     SeleniumLibrary
Library     DatabaseLibrary
Library     String
Library     OperatingSystem


*** Variables ***
${BROWSER}              Chrome
${SIGNUP_URL}           http://127.0.0.1:8000/accounts/signup/
${LOGIN_URL}            http://127.0.0.1:8000/accounts/login/?register
${VALID_USERNAME}       TestUser123
${INVALID_USERNAME}     ThisUsernameIsVeryLongAndExceedsTheMaximumAllowedLength
${FIRST_NAME}           John
${LAST_NAME}            Doe
${EMAIL_PREFIX}         testuser
${EMAIL_DOMAIN}         @example.com
${INVALID_CH}           ?¡*[]


*** Test Cases ***
Valid Registration
    [Documentation]    Registro valido Cuidador
    Open Browser    ${SIGNUP_URL}    ${BROWSER}
    ${random_username}    Generate Random String    10    [LOWER] [NUMBERS]
    ${random_username_ok}    Set Variable    ${random_username.replace(" ","")}
    Input Text    id=id_username    ${random_username_ok}
    Input Text    id=id_first_name    ${FIRST_NAME}
    Input Text    id=id_last_name    ${LAST_NAME}
    Click Element    id=id_is_cuidador
    Input Text    id=id_email    ${EMAIL_PREFIX}${random_username_ok}${EMAIL_DOMAIN}
    Input Text    id=id_password1    Robotcontraseña11
    Input Text    id=id_password2    Robotcontraseña11
    Click Button    xpath=//input[@type='submit']
    Wait Until Page Contains    correctamente
    Location Should Be    ${LOGIN_URL}
    Close Browser

Invalid Registration username
    [Documentation]    Username con más de 150 caracteres
    Open Browser    ${SIGNUP_URL}    ${BROWSER}
    ${random_username}    Generate Random String    160    [LOWER] [NUMBERS]
    ${random_username_ok}    Set Variable    ${random_username.replace(" ","")}
    Input Text    id=id_username    ${random_username_ok}
    Input Text    id=id_first_name    ${FIRST_NAME}
    Input Text    id=id_last_name    ${LAST_NAME}
    Click Element    id=id_is_cuidador
    Input Text    id=id_email    ${EMAIL_PREFIX}${random_username_ok}${EMAIL_DOMAIN}
    Input Text    id=id_password1    Robotcontraseña11
    Input Text    id=id_password2    Robotcontraseña11
    Click Button    xpath=//input[@type='submit']
    Wait Until Page Contains    Asegúrese de que este valor tenga menos de 150 caracteres
    Sleep    3s
    Close Browser

Invalid Registration characters
    [Documentation]    Username incorrecto con caracteres no permitido
    Open Browser    ${SIGNUP_URL}    ${BROWSER}
    ${random_username}    Generate Random String    10    [LOWER] [NUMBERS]
    ${random_username_ok}    Set Variable    ${random_username.replace(" ","")}
    Input Text    id=id_username    ${random_username_ok}${INVALID_CH}
    Input Text    id=id_first_name    ${FIRST_NAME}
    Input Text    id=id_last_name    ${LAST_NAME}
    Click Element    id=id_is_cuidador
    Input Text    id=id_email    ${EMAIL_PREFIX}${random_username_ok}${EMAIL_DOMAIN}
    Input Text    id=id_password1    Robotcontraseña11
    Input Text    id=id_password2    Robotcontraseña11
    Click Button    xpath=//input[@type='submit']
    Wait Until Page Contains    Introduza un nombre de usuario válido.
    Close Browser

Invalid Registration common password
    [Documentation]    Contraseña común
    Open Browser    ${SIGNUP_URL}    ${BROWSER}
    ${random_username}    Generate Random String    10    [LOWER] [NUMBERS]
    ${random_username_ok}    Set Variable    ${random_username.replace(" ","")}
    Input Text    id=id_username    ${random_username_ok}
    Input Text    id=id_first_name    ${FIRST_NAME}
    Input Text    id=id_last_name    ${LAST_NAME}
    Click Element    id=id_is_cuidador
    Input Text    id=id_email    ${EMAIL_PREFIX}${random_username_ok}${EMAIL_DOMAIN}
    Input Text    id=id_password1    password123
    Input Text    id=id_password2    password123
    Click Button    xpath=//input[@type='submit']
    Wait Until Page Contains    Esta contraseña es demasiado común.
    Close Browser

Invalid Registration different password
    [Documentation]    Contraseñas no coinciden
    Open Browser    ${SIGNUP_URL}    ${BROWSER}
    ${random_username}    Generate Random String    10    [LOWER] [NUMBERS]
    ${random_username_ok}    Set Variable    ${random_username.replace(" ","")}
    Input Text    id=id_username    ${random_username_ok}
    Input Text    id=id_first_name    ${FIRST_NAME}
    Input Text    id=id_last_name    ${LAST_NAME}
    Click Element    id=id_is_cuidador
    Input Text    id=id_email    ${EMAIL_PREFIX}${random_username_ok}${EMAIL_DOMAIN}
    Input Text    id=id_password1    Robotcontraseña11
    Input Text    id=id_password2    Robocontraseña11
    Click Button    xpath=//input[@type='submit']
    Wait Until Page Contains    Los dos campos de contraseña no coinciden.
    Close Browser
