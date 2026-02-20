*** Settings ***
Library    SeleniumLibrary
Test Teardown    Close All Browsers

*** Variables ***
${URL}        https://form.jotform.com/212934779973474
${BROWSER}    chrome

*** Test Cases ***
Verify Registration Form With All Input Field
    [Tags]    All Field

    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    Wait Until Element Contains    id=header_1    Student Registration Form

    # First Name
    Input Text    id=input_48    Thanawat
    ${firstname}=    Get Value    id=input_48
    Should Be Equal    ${firstname}    Thanawat

    # Last Name
    Input Text    id=input_49    Puttipipattanasakul
    ${lastname}=    Get Value    id=input_49
    Should Be Equal    ${lastname}    Puttipipattanasakul

    # Gender
    Select From List By Value    id=input_3    Male
    ${gender}=    Get Value    id=input_3
    Should Be Equal    ${gender}    Male

    # Student ID
    Input Text    id=input_14    6733096621
    ${student_id}=    Get Value    id=input_14
    Should Be Equal    ${student_id}    6733096621

    # Mobile Phone
    Input Text    id=input_27_full    0931842671
    ${mobile}=    Get Value    id=input_27_full
    Should Contain    ${mobile}    (093) 184-2671

    # Email
    Input Text    id=input_6    6733096621@chula.ac.th
    ${email}=    Get Value    id=input_6
    Should Be Equal    ${email}    6733096621@chula.ac.th

    # Study Time
    Click Element    id=label_input_51_0

    # Submit
    Click Button    id=form-pagebreak-next_76

    # Verify Success
    Wait Until Element Contains    id=text_84    Your registration has been completed

Verify Required When First Name Empty
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    # Leave First Name empty
    Input Text    id=input_49    Puttipipattanasakul
    Input Text    id=input_14    6733096666
    Select From List By Value    id=input_3    Male
    Input Text    id=input_27_full    0931842671
    Input Text    id=input_6    student@chula.ac.th

    Click Button    id=form-pagebreak-next_76

    Page Should Contain    This field is required.

    Close Browser

Verify Required When Last Name Empty
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    Input Text    id=input_48    Thanawat
    #missing Lastname
    Select From List By Value    id=input_3    Male
    Input Text    id=input_14    6733096666
    Input Text    id=input_27_full    0931842671
    Input Text    id=input_6    student@chula.ac.th

    Click Button    id=form-pagebreak-next_76

    Page Should Contain    This field is required.

    Close Browser

Verify Required When ID Empty
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    Input Text    id=input_48    Thanawat
    Input Text    id=input_49    Puttipipattanasakul
    Input Text    id=input_14    6733096666
    Select From List By Value    id=input_3    Male
    #miss phone
    Input Text    id=input_6    student@chula.ac.th

    Click Button    id=form-pagebreak-next_76

    Page Should Contain    This field is required.

    Close Browser

Verify Required When Phone Empty
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    Input Text    id=input_48    Thanawat
    Input Text    id=input_49    Puttipipattanasakul
    Input Text    id=input_27_full    0931842671
    Select From List By Value    id=input_3    Male
    #miss ID
    Input Text    id=input_6    student@chula.ac.th

    Click Button    id=form-pagebreak-next_76

    Page Should Contain    This field is required.

    Close Browser


Verify Required When Email Empty
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    Input Text    id=input_48    Thanawat
    Input Text    id=input_49    Puttipipattanasakul
    Input Text    id=input_27_full    0931842671
    Input Text    id=input_14    6733096666
    Select From List By Value    id=input_3    Male
    #miss email

    Click Button    id=form-pagebreak-next_76

    Page Should Contain    This field is required.

    Close Browser
    
Verify Required When Gender Empty
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    Input Text    id=input_48    Thanawat
    Input Text    id=input_49    Puttipipattanasakul
    Input Text    id=input_27_full    0931842671
    Input Text    id=input_14    6733096666
    #miss gender
    Input Text    id=input_6    student@chula.ac.th

    Click Button    id=form-pagebreak-next_76

    Page Should Contain    This field is required.

    Close Browser
