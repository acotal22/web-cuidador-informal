*** Settings ***
Library     SeleniumLibrary
Library     DatabaseLibrary
Library     String
Library     OperatingSystem
Library     Collections
Library     BuiltIn


*** Variables ***
${BROWSER}          Chrome
${BASE_URL}         http://127.0.0.1:8000/
${TOPICOS_URL}      http://127.0.0.1:8000/content/
${PREGUNTAS_URL}    http://127.0.0.1:8000/content/preguntas/
${PACIENTE_URL}     http://127.0.0.1:8000/patient/info/paciente
${USERNAME}         testcuidador
${PASSWORD}         Robotcuidador11


*** Test Cases ***
Valid Navigation Topicos
    [Documentation]    Navegación por tópicos, consejos, etc
    Open Browser    ${TOPICOS_URL}    ${BROWSER}
    Login
    Click Element    xpath=//a[@href='/content/topicos/']
    Select From List by Label    name=filtro_topico    Alteraciones de la Memoria
    Wait Until Page Contains Element
    ...    xpath=//h5[contains(@class, 'card-title') and contains(text(), 'Alteraciones de la Memoria')]
    Select From List by Label    name=filtro_topico    Cambios Psicológicos y Sociales
    Wait Until Page Contains Element
    ...    xpath=//h5[contains(@class, 'card-title') and contains(text(), 'Cambios Psicológicos y Sociales')]
    Select From List by Label    name=filtro_topico    Todos
    Sleep    2s
    Click Element    xpath=//a[@href='/content/consejos/contr1/4/']
    Wait Until Page Contains Element
    ...    xpath=//h2[contains(@class, 'mb-4') and contains(text(), 'Alteraciones de la Memoria')]

    Close Browser

Valid Answer NPI
    [Documentation]    Responder un Test NPI-Q
    Open Browser    ${BASE_URL}patient/info/test-npi/    ${BROWSER}
    Login
    Wait Until Element Is Visible    //tbody
    FOR    ${i}    IN RANGE    1    13
        ${random_value1}    ${random_value2}    Generar Valores Aleatorios
        IF    ${random_value1} == 1
            Click Element    //input[@name="r${i}a" and @value="${random_value1}"]
            Click Element    //input[@name="r${i}b" and @id="id_r${i}b_${random_value2}"]
            Log    Valor aleatorio 1: ${random_value1}
            Log    Valor aleatorio 2: ${random_value2}
        ELSE
            Click Element    //input[@name="r${i}a" and @value="${random_value1}"]
        END
    END
    Click Button    xpath=//input[@type='submit']
    Wait Until Page Contains    Completaste un Test
    Close Browser

Valid Answer Zarit
    [Documentation]    Responder un Test Zarit
    Open Browser    ${BASE_URL}patient/info/test-zarit/    ${BROWSER}
    Login
    Wait Until Element Is Visible    //tbody
    FOR    ${i}    IN RANGE    1    23
        ${random_value1}    Evaluate    random.randint(1,5)
        Click Element    //input[@name="r${i}" and @value="${random_value1}"]
    END
    Click Button    xpath=//input[@type='submit']
    Wait Until Page Contains    Completaste un Test
    Close Browser

Valid Add Question
    [Documentation]    Agregar una pregunta
    Open Browser    ${PREGUNTAS_URL}    ${BROWSER}
    Login
    ${QUESTION}    Generate Random String    50    [LOWER]
    Click Element    xpath=//a[@data-target='#preguntaModal']
    Wait Until Element Is Visible    id=preguntaModal
    Sleep    1s
    Input Text    id=id_pregunta    ${QUESTION}
    Sleep    1s
    Click Button    xpath=//*[@id="preguntaModal"]/div/div/div[2]/form/div/button
    Wait Until Page Contains    Pregunta añadida correctamente
    Close Browser

Valid Add Evento
    [Documentation]    Agregar un evento
    Open Browser    ${PACIENTE_URL}    ${BROWSER}
    Login
    Click Element    xpath=//a[@data-target='#formularioModal']
    Wait Until Element Is Visible    id=formularioModal
    @{PREGUNTAS_NAME}    Create List
    ...    frecuencia_baño_afectada
    ...    f_baño
    ...    frecuencia_alimentacion_afectada
    ...    f_alimentacion
    ...    horas_sueño_afectadas
    ...    f_sueño
    ...    estado_animo_afectado
    ...    animo
    @{F_NAME}    Create List
    ...    f_baño
    ...    f_alimentacion
    ...    f_sueño
    ...    animo
    FOR    ${pregunta}    ${respuesta}    IN    @{PREGUNTAS_NAME}
        ${valor1}    Generar Valor Aleatorio    [1,0]
        Log    ${pregunta}
        Log    ${respuesta}
        IF    ${valor1} == 1
            ${valor2}    Generar Valor Aleatorio    [1,2,3,4,5,6,7,8,9,10]
            Click Element    //input[@name="${pregunta}" and @value="si"]
            Wait Until Element Is Visible    name=${respuesta}
            Input Text    name=${respuesta}    ${valor2}
        ELSE
            Click Element    //input[@name="${pregunta}" and @value="no"]
        END
    END
    ${fecha}    Generar Fecha Aleatoria
    Input Text    id=id_fecha    ${fecha}
    ${otro}    Generate Random String    20    [LETTERS]
    Input Text    id=id_comentario    ${otro}
    Click Button    xpath=//button[@type='submit']
    Wait Until Page Contains    Evento añadido correctamente
    Close Browser


*** Keywords ***
Login
    Input Text    id=id_username    ${USERNAME}
    Input Password    id=id_password    ${PASSWORD}
    Click Button    xpath=//button[@type='submit']

Generar Valor Aleatorio
    [Arguments]    ${lista}
    ${valor}    Evaluate    random.choice(${lista})
    RETURN    ${valor}

Generar Fecha Aleatoria
    ${dia}    Evaluate    random.randint(1, 28)
    ${mes}    Evaluate    random.randint(1,12)
    ${fecha}    Set Variable    "${dia}/${mes}/2023"
    RETURN    ${fecha}

Generar Valores Aleatorios
    ${lista1}    Create List    0    1    9
    ${valor1}    Generar Valor Aleatorio    ${lista1}
    IF    ${valor1} == 1
        ${valor2}    Generar Valor Aleatorio    [0, 1, 2, 3]
    ELSE
        ${valor2}    Set Variable    ${None}
    END
    RETURN    ${valor1}    ${valor2}
