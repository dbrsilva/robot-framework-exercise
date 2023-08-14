*** Settings ***
Library         SeleniumLibrary
Library         String
Resource        ./Common.robot
Variables       ../Locators/CheckoutCompleteLocators.py
Variables       ../Locators/InventoryLocators.py


*** Keywords ***
Go Back Home
    Wait Until Element Is Visible    ${CheckoutCompleteBackHomeButton}    timeout=5
    Click Element    ${CheckoutCompleteBackHomeButton}
    Wait Until Element Is Visible    ${InventoryContainerDiv}    timeout=5

Verify Thank You message
    [Arguments]    ${expected_thank_you_message}
    Wait Until Element Is Visible    ${CheckoutCompleteThankYouMessageDiv}    timeout=5
    Element Text Should Be    ${CheckoutCompleteThankYouMessageDiv}    ${expected_thank_you_message}
