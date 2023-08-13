*** Settings ***
Library         SeleniumLibrary
Variables       ../Locators/LoginLocators.py
Variables       ../TestData/SauceDemoData.py


*** Keywords ***
Input Standard Username
    Input Form Username    ${StandardUsername}

Input Form Username
    [Arguments]   ${username}
    Input Text    ${LoginUsernameInput}    ${username}

Input Standard Password
    Input Form Password    ${StandardPassword}

Input Form Password
    [Arguments]   ${password}
    Input Password    ${LoginPasswordInput}    ${password}

Click Login
    Click Button    ${LoginSubmitButton}

Verify the displayed error message
    [Arguments]    ${error_message_text}
    Wait Until Element Is Visible    ${LoginErrorMessageH3}
    Element Text Should Be    ${LoginErrorMessageH3}    ${error_message_text}

Verify that Password field displays an error style
    Element Should Be Visible    ${LoginPasswordErrorInput}

Verify that Username field displays an error style
    Element Should Be Visible    ${LoginUsernameErrorInput}

