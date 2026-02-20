*** Variables ***

${WEB_URL}    https://panaryco.wixsite.com/myhotel?utm_source=chatgpt.com
${BROWSER}    chrome

# --- Test Data ---
${NAME}        John
${LNAME}       Smith
${EMAIL}       john@mail.com
${TELPHONE}    0878769861
${NOTES_TXT}   Quiet room please

# --- Locators ---
${FNAME_LOC}   id=input_comp-lt33fcq41
${LNAME_LOC}   id=input_comp-lt33fcs1
${EMAIL_LOC}   id=input_comp-lt33fcsf1
${TEL_LOC}     id=input_comp-lt33fcsi1
${NOTES_LOC}   id=input_comp-lt33fct3

${ADULTS_LOC}  id=collection_comp-lt33fcsl1
${ACCEPT_TERMS_LOC}  xpath=//*[@class='cCdhN7']
${SUBMIT_LOC}  xpath=//*[text()='Submit']