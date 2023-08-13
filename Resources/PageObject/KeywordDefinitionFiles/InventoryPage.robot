*** Settings ***
Library         SeleniumLibrary
Library         Collections
Resource        ./Common.robot
Variables       ../Locators/InventoryLocators.py
Variables       ../TestData/SauceDemoData.py


*** Variables ***
${inventory_page_url}       https://www.saucedemo.com/inventory.html


*** Keywords ***
Go to Inventory Page
    Go To    ${inventory_page_url}
    Wait For Condition    return document.readyState == "complete"    timeout=5

Get Product Names List
    @{name_list}    Get Web Element String List    ${InventoryProductNamesList}
    RETURN    @{name_list}

Get Product Prices List
    @{price_list}    Get Web Element String List    ${InventoryProductPricesList}
    RETURN    ${price_list}

Open product sort select
    Click Element    ${InventoryProductSortSelect}

Select Sort A to Z Option
    Go to Inventory Page
    Wait Until Element Is Visible    ${InventoryProductSortSelect}    timeout=5
    Click Element    ${InventoryProductSortSelect}
    Wait Until Element Is Visible    ${InventoryProductSortAZOption}    timeout=5
    Click Element    ${InventoryProductSortAZOption}

Select Sort Price High to Low Option
    Go to Inventory Page
    Wait Until Element Is Visible    ${InventoryProductSortSelect}    timeout=5
    Click Element    ${InventoryProductSortSelect}
    Wait Until Element Is Visible    ${InventoryProductSortHighLowOption}    timeout=5
    Click Element    ${InventoryProductSortHighLowOption}

Select Sort Price Low to High Option
    Go to Inventory Page
    Wait Until Element Is Visible    ${InventoryProductSortSelect}    timeout=5
    Click Element    ${InventoryProductSortSelect}
    Wait Until Element Is Visible    ${InventoryProductSortLowHighOption}    timeout=5
    Click Element    ${InventoryProductSortLowHighOption}

Verify Inventory is Visible
    Wait For Condition    return document.readyState == "complete"
    Element Should Be Visible    ${InventoryContainerDiv}    timeout=5
