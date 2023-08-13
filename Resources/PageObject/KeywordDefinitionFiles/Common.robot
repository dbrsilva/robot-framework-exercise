*** Settings ***
Library     SeleniumLibrary
Library     Collections
Resource    ./LoginPage.robot


*** Variables ***
${url}              https://www.saucedemo.com/
${browser_name}     Chrome


*** Keywords ***
Opening Browser
    Open Browser    ${url}    ${browser_name}
    Wait For Condition    return document.readyState == "complete"

Login as a Standard User
    Opening Browser
    Input Standard Username
    Input Standard Password
    Click Login

Get Web Element String List
    [Arguments]    ${web_element_selector}
    Wait Until Element Is Visible    ${web_element_selector}    timeout=5
    ${web_element_list} =    Get WebElements    ${web_element_selector}
    @{string_element_list} =    Create List
    FOR    ${item}    IN    @{web_element_list}
        Append To List    ${string_element_list}    ${item.text}
    END
    RETURN    ${string_element_list}
