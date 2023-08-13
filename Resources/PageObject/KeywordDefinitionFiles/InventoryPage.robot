*** Settings ***
Library         SeleniumLibrary
Library         Collections
Variables       ../Locators/InventoryLocators.py
Variables       ../TestData/SauceDemoData.py


*** Variables ***
${inventory_page_url}       https://www.saucedemo.com/inventory.html


*** Keywords ***
Go to Inventory Page
    Go To    ${inventory_page_url}
    Wait For Condition    return document.readyState == "complete"    timeout=5

Get Product Names List
    ${product_names_list} =    Get WebElements    ${InventoryProductNamesList}
    @{actual_product_names_list} =    Create List
    FOR    ${item}    IN    @{product_names_list}
        Append To List    ${actual_product_names_list}    ${item.text}
    END
    RETURN    ${actual_product_names_list}

Get Product Prices List
    ${product_prices_list} =    Get WebElements    ${InventoryProductPricesList}
    @{actual_product_prices_list} =    Create List
    FOR    ${item}    IN    @{product_prices_list}
        Append To List    ${actual_product_prices_list}    ${item.text}
    END
    RETURN    ${actual_product_prices_list}

Open product sort select
    Click Element    ${InventoryProductSortSelect}

Verify Inventory is Visible
    Wait For Condition    return document.readyState == "complete"
    Element Should Be Visible    ${InventoryContentDiv}    timeout=5

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
