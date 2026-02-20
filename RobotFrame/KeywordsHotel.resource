*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource   VariableHotel.resource

*** Keywords ***

Open Browser CU Hotel
    Open Browser    ${WEB_URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    3s


Input Firstname
    [Arguments]    ${name}
    Input Text    ${FNAME_LOC}    ${name}


Input Lastname
    [Arguments]    ${lname}
    Input Text    ${LNAME_LOC}    ${lname}


Input Email
    [Arguments]    ${mail}
    Input Text    ${EMAIL_LOC}    ${mail}


Input Telephone
    [Arguments]    ${tel}
    Input Text    ${TEL_LOC}    ${tel}


Input Notes
    [Arguments]    ${notes}
    Input Text    ${NOTES_LOC}    ${notes}


Input Amount People
    [Arguments]    ${amount}
    Select From List By Value    ${ADULTS_LOC}    ${amount}


Click "No" Pet
    Click Element    xpath=//label[.//input[@value='No']]


Click I accepted term
    Click Element    ${ACCEPT_TERMS_LOC}


Click Submit
    Wait Until Element Is Visible    ${SUBMIT_LOC}    20s
    Click Element    ${SUBMIT_LOC}


# =============================
# VALIDATION CHECK
# =============================

Check Firstname is
    [Arguments]    ${state}
    ${expected}=    Set Variable If    '${state}' == 'valid'    false    true
    Check Textbox Invalid State    ${FNAME_LOC}    ${expected}

Check Lastname is
    [Arguments]    ${state}
    ${expected}=    Set Variable If    '${state}' == 'valid'    false    true
    Check Textbox Invalid State    ${LNAME_LOC}    ${expected}

Check Email is
    [Arguments]    ${state}
    ${expected}=    Set Variable If    '${state}' == 'valid'    false    true
    Check Textbox Invalid State    ${EMAIL_LOC}    ${expected}

Check Telephone is
    [Arguments]    ${state}
    ${expected}=    Set Variable If    '${state}' == 'valid'    false    true
    Check Textbox Invalid State    ${TEL_LOC}    ${expected}

Check Number of Adults is
    [Arguments]    ${state}
    ${expected}=    Set Variable If    '${state}' == 'valid'    false    true
    ${actual}=    Get Element Attribute    ${ADULTS_LOC}    aria-invalid
    Should Be Equal    ${actual}    ${expected}

Check Accept Terms is
    [Arguments]    ${state}

    ${expected}=    Set Variable If    '${state}' == 'valid'    true    false

    ${checked}=    Get Element Attribute    ${ACCEPT_TERMS_LOC}    checked

    ${actual}=    Set Variable If    '${checked}' == 'None'    false    true

    Should Be Equal    ${actual}    ${expected}

    
Check Textbox Invalid State
    [Arguments]    ${locator}    ${expected}
    ${result}=    Get Element Attribute    ${locator}    aria-invalid
    Should Be Equal    ${result}    ${expected}    Validation mismatch