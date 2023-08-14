*** Settings ***
Library         SeleniumLibrary
Library         String
Resource        ./Common.robot
Variables       ../Locators/ShoppingCartLocators.py
Variables       ../Locators/CheckoutOverviewLocators.py


*** Keywords ***
Finish Checkout
    Wait Until Element Is Visible    ${OverviewFinishButton}    timeout=5
    Click Button    ${OverviewFinishButton}

Get Checkout Overview Product Names List
    @{product_names_list} =    Get Web Element String List    ${OverviewItemNamesList}
    RETURN    ${product_names_list}

Get Checkout Overview Product Price List
    @{product_prices_list} =    Get Web Element String List    ${OverviewItemPricesList}
    RETURN    ${product_prices_list}

Get Checkout Overview Product Quantity List
    @{product_quantity_list} =    Get Web Element String List    ${OverviewItemQuantityList}
    RETURN    ${product_quantity_list}

Verify that Checkout Overview has the correct product names
    [Arguments]    ${expected_product_names_list}
    @{actual_product_names_list} =    Get Checkout Overview Product Names List
    Lists Should Be Equal    ${expected_product_names_list}    ${actual_product_names_list}

Verify that Checkout Overview has the correct product prices
    [Arguments]    ${expected_product_prices_list}
    @{actual_product_prices_list} =    Get Checkout Overview Product Price List
    Lists Should Be Equal    ${expected_product_prices_list}    ${actual_product_prices_list}

Verify that Checkout Overview has the correct product quantities
    [Arguments]    ${expected_product_quantities_list}
    @{actual_product_quantities_list} =    Get Checkout Overview Product Quantity List
    Lists Should Be Equal    ${expected_product_quantities_list}    ${actual_product_quantities_list}
