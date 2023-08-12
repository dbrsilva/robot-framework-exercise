*** Settings ***
Library     SeleniumLibrary


*** Keywords ***
Opening Browser
    [Arguments]    ${site_url}    ${browser}
    Open Browser    ${site_url}    ${browser}
    Wait For Condition    return document.readyState == "complete"
