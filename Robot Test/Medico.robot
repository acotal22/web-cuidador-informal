*** Settings ***
Library     SeleniumLibrary
Library     DatabaseLibrary
Library     String
Library     OperatingSystem
Library     Collections
Library     BuiltIn


*** Variables ***
${BROWSER}          Chrome
${INICIO_URL}       http://127.0.0.1:8000/content/
${USERNAME}         testdoctor
${PASSWORD}         Robotdoctor11


*** Test Cases ***
Valid Add/Delete Cuidador
    [Documentation]    Agregar el cuidador de prueba y luego eliminar
    Open Browser    ${INICIO_URL}    ${BROWSER}
    Login
    Wait Until Page Contains    Bienvenido
    Click Element    xpath=//a[@href='/content/agregar_cuidador/']
    Click Button    id=btn-agregar
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'modal fade show')]
    ${modal_element}    Get WebElement    xpath=//div[contains(@class, 'modal fade show')]
    ${modal_id}    Get Element Attribute    ${modal_element}    id
    ${modal_number}    Get Substring    ${modal_id}    -1
    Sleep    1s
    Click Element    xpath=//*[@id="${modal_id}"]/div/div/div[3]/button[2]
    Wait Until Page Contains    Cuidador agregado correctamente
    Click Element    xpath=//button[@data-target='#confirmModal${modal_number}']
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'modal fade show')]
    Click Button    xpath=//button[@type='submit']
    Wait Until Page Contains    Cuidador eliminado correctamente
    Close Browser

Valid Add Answer
    [Documentation]    Agregar una respuesta a una pregunta
    Open Browser    ${INICIO_URL}    ${BROWSER}
    Login
    Wait Until Page Contains    Bienvenido
    Click Element    xpath=//*[@id="tablaCuidadoresMedico"]/tbody/tr/td[5]/a
    Wait Until Element Is Visible    xpath=//a[@class='stretched-link' and @href='/content/preguntas/']
    Go To    ${INICIO_URL}preguntas/
    Select From List by Label    name=estado_respuesta    No respondida
    Wait Until Page Contains Element    xpath=//*[@id="titulo-medico"]
    Click Element    xpath=//a[contains(@data-target,'#responderModal-')]
    ${ANSWER}    Generate Random String    100    [LOWER]
    Wait Until Element Is Visible
    ...    xpath=//div[contains(@class, 'modal fade show') and contains(@id,'responderModal-')]
    Sleep    1s
    ${modal_element}    Get WebElement    xpath=//div[contains(@class, 'modal fade show')]
    ${modal_id}    Get Element Attribute    ${modal_element}    id

    Input Text    xpath=//*[@id="${modal_id}"]/div/div/div[2]/form/p/textarea    ${ANSWER}
    Click Element    xpath=//*[@id="${modal_id}"]/div/div/div[2]/form/div/button
    Wait Until Page Contains    Pregunta respondida correctamente
    Close Browser


*** Keywords ***
Login
    Input Text    id=id_username    ${USERNAME}
    Input Password    id=id_password    ${PASSWORD}
    Click Button    xpath=//button[@type='submit']
