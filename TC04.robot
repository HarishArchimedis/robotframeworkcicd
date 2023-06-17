*** Settings ***
Library     SeleniumLibrary
Suite Teardown  Close Browser

*** Variables ***
${user}     standard_user
${pass}    secret_sauce
${BROWSER}    chrome


*** Keywords ***
ABBBBB
    [Arguments]     ${username}     ${password}
    Open Browser    https://www.saucedemo.com/      ${BROWSER}
    Maximize Browser Window
    Input Text    //input[@id="user-name"]    ${username}
    Press Keys      //input[@id="user-name"]    CTRL+A+C
    Log    ${username}
    Sleep    2
    ${bvalue}   Get Text    //input[@id="user-name"]
    Log    ${bvalue}
    Press Keys      //input[@id="password"]     CTRL+V
    ${avalue}   Get Value    //input[@id="password"]
    Log    ${avalue}
 


    Sleep   5
*** Test Cases ***
ABBBBB
    [Tags]    sanity
    ABBBBB    ${user}  ${pass}
