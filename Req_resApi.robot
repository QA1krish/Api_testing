*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${Base_Url}    https://reqres.in/


*** Test Cases ***
Get On Session
    Create Session    MyAPI    ${Base_Url} 
    ${response}=    Get Request    MyAPI   /api/users/2  
   # Log To Console        ${response.status_code}
   # Log To Console        ${response.headers}
    #Log To Console        ${response.content}
    ${Statuscode}=    Convert To String    ${response.status_code}
    Should Be Equal    ${Statuscode}    200

    ${contentTypeValue} =  Get From Dictionary   ${response.headers}    Content-Type
    Should Be Equal     ${contentTypeValue}    application/json; charset=utf-8
    




    