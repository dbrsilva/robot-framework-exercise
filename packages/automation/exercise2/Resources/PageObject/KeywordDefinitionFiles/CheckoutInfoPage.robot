*** Settings ***
Library         SeleniumLibrary
Library         String
Resource        ./Common.robot
Variables       ../Locators/CheckoutInfoLocators.py


*** Keywords ***
Continue Checkout process
    Wait Until Element Is Visible    ${CheckoutContinueButton}    timeout=5
    Click Button    ${CheckoutContinueButton}
    Wait Until Element Is Visible    ${CheckoutSummaryContainerDiv}    timeout=5

Fill out Checkout form
    [Arguments]    ${first_name}    ${last_name}    ${postal_code}
    Wait Until Element Is Visible    ${CheckoutInfoContainerDiv}    timeout=5
    Input Text    ${CheckoutFirstNameInput}    ${first_name}
    Input Text    ${CheckoutLastNameInput}    ${last_name}
    Input Text    ${CheckoutPostalCodeInput}    ${postal_code}
