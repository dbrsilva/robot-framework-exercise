*** Settings ***
Library         SeleniumLibrary
Variables       ../Locators/InventoryLocators.py
Variables       ../TestData/SauceDemoData.py


*** Variables ***
${inventory_page_url}     https://www.saucedemo.com/inventory.html


*** Keywords ***
Go to Inventory Page
    Go To    ${inventory_page_url}
    Wait For Condition    return document.readyState == "complete"    timeout=5

Open product sort select
    Click Element    ${InventoryProductSortSelect}

Verify Inventory is Visible
    Wait For Condition    return document.readyState == "complete"
    Element Should Be Visible    ${InventoryContentDiv}    timeout=5
