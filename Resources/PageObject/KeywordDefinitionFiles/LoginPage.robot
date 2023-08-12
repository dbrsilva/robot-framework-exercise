*** Settings ***
Library         SeleniumLibrary
Variables       ../Locators/SauceDemoLoginLocators.py
Variables       ../TestData/SauceDemoData.py


*** Keywords ***
Input Standard Username
    Input Text    ${LoginUsernameInputText}    ${StandardUsername}

Input Standard Password
    Input Password    ${LoginPasswordInputText}    ${StandardPassword}

Click Login
    Click Button    ${LoginSubmitButton}
