*** Settings ***
Library   SeleniumLibrary
Test Teardown   Close Browser


*** Test Cases ***
Positive
  [Tags]  sanity
  Open Browser    https://www.saucedemo.com/    chrome    --incognito
  Maximize Browser Window
  Input Text    //input[@id="user-name"]    jack
  Sleep    3


