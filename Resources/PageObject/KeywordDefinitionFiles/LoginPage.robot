*** Settings ***
Library         SeleniumLibrary
Variables       ../Locators/LoginLocators.py
Variables       ../TestData/SauceDemoData.py


*** Keywords ***
Input Standard Username
    Input Text    ${LoginUsernameInput}    ${StandardUsername}

Input Standard Password
    Input Password    ${LoginPasswordInput}    ${StandardPassword}

Click Login
    Click Button    ${LoginSubmitButton}
