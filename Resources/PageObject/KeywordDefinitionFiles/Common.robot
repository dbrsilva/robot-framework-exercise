*** Settings ***
Library     SeleniumLibrary
Resource    ./LoginPage.robot


*** Variables ***
${url}                  https://www.saucedemo.com/
${browser_name}       Chrome


*** Keywords ***
Opening Browser
    Open Browser    ${url}    ${browser_name}
    Wait For Condition    return document.readyState == "complete"

Login as a Standard User
    Opening Browser
    Input Standard Username
    Input Standard Password
    Click Login
 
