*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${base_Url}     https://reqres.in/



*** Test Cases ***
PLay_postReq
    Create Session    Postsession    ${base_Url}
   ${Person}=     Create Dictionary     name=Shanmukan     job=Mango Stone thrower 
   ${Header}=    Create Dictionary     Content-Type=application/json
   ${response}=    Post Request    Postsession     /api/users   data=${Person}  headers=${Header}
        Log To Console    ${response.status_code}
        Log To Console    ${response.content}
        
        #VALIDATIONS
        ${post_body}=    Convert To String    ${response.content}
        ${status code}=  Convert To String    ${response.status_code}
        Should Contain    ${post_body}    createdAt
        Should Be Equal    ${status code}        201

    