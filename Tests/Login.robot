*** Settings ***
Documentation       Login validation using Robot Framework

Resource            ../Resources/PageObject/KeywordDefinitionFiles/LoginPage.robot
Resource            ../Resources/PageObject/KeywordDefinitionFiles/InventoryPage.robot
Resource            ../Resources/PageObject/KeywordDefinitionFiles/Common.robot


*** Variables ***
${site_url}     https://www.saucedemo.com/
${browser}      Chrome


*** Test Cases ***
Log in as a Standard User
    Opening Browser    ${site_url}    ${browser}
    Input Standard Username
    Input Standard Password
    Click Login
    Verify Inventory is Visible
    Close Browser
