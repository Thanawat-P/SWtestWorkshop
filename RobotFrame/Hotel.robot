*** Settings ***
Library    SeleniumLibrary
Resource   VariableHotel.resource
Resource   KeywordsHotel.resource

Test Teardown    Close All Browsers


*** Test Cases ***

Valid Booking Form Submission
    Open Browser CU Hotel

    Input Firstname    ${NAME}
    Input Lastname     ${LNAME}
    Input Email        ${EMAIL}
    Input Telephone    ${TELPHONE}
    Input Notes        ${NOTES_TXT}

    Input Amount People    2
    Click "No" Pet

    Click I accepted term
    Click Submit


Empty Form Validation
    Open Browser CU Hotel

    Click Submit

    Check Firstname is          invalid
    Check Lastname is           invalid
    Check Email is              invalid
    Check Telephone is          invalid
    Check Number of Adults is   invalid
    Check Accept Terms is       invalid