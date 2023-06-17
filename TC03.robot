*** Settings ***
Library   SeleniumLibrary
Library    String
Library    BuiltIn
Test Teardown   Close Browser

*** Variables ***
${Xpath}    =   //div//div[contains(text(), '{rolesid}')]/parent::div/parent::div//div[contains(text(), '{rolesname}')]


*** Keywords ***
Verify the product and platform roles
    [Arguments]    ${role}    ${id}
    FOR    ${roleval}    ${idval}    IN ZIP    ${role}    ${id}
        ${T_P_O}     Convert To Uppercase    ${idval}
        ${result1} =    Get Substring    ${T_P_O}    1
        ${prod_plat_tpo} =    Format String   ${Xpath}    rolesid=${result1}     rolesname=${roleval}
        Log    ${prod_plat_tpo}
    END

*** Test Cases ***
validation
   [Tags]  sanity

   @{role}    Create List    Platform Group Leader    Platform Group Engineer    Experience Design Leader
   @{id}    Create List    itest001    itest002    itest003
   Verify the product and platform roles    ${role}    ${id}


    