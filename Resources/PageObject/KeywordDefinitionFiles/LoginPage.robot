*** Settings ***
Library         SeleniumLibrary
Variables       ../Locators/LoginLocators.py
Variables       ../TestData/SauceDemoData.py


*** Keywords ***
Input Standard Username
    Input Text    ${LoginUsernameInputInput}    ${StandardUsername}

Input Standard Password
    Input Password    ${LoginPasswordInputInput}    ${StandardPassword}

Click Login
    Click Button    ${LoginSubmitButton}
