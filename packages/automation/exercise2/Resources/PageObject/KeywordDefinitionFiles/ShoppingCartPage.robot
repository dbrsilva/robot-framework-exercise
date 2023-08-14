*** Settings ***
Library         SeleniumLibrary
Library         String
Resource        ./Common.robot
Variables       ../Locators/ShoppingCartLocators.py
Variables       ../Locators/InventoryLocators.py
Variables       ../Locators/InventoryLocators.py


*** Variables ***
${shopping_cart_page_url}       https://www.saucedemo.com/cart.html


*** Keywords ***
Get Shopping Cart Product Names List
    @{product_names_list} =    Get Web Element String List    ${ShoppingCartProductNamesList}
    RETURN    ${product_names_list}

Get Shopping Cart Product Prices List
    @{product_prices_list} =    Get Web Element String List    ${ShoppingCartProductPriceList}
    RETURN    ${product_prices_list}

Get Shopping Cart Product Quantities List
    @{product_quantity_list} =    Get Web Element String List    ${ShoppingCartProductQuantityList}
    RETURN    ${product_quantity_list}

Go to Shopping Cart page
    Go To    ${shopping_cart_page_url}

Open Shopping Cart page
    Wait Until Element Is Visible    ${ShoppingCartLink}    timeout=5
    Click Link    ${ShoppingCartLink}

Remove item "${item_name}" from the cart
    ${item_id_tmp} =    Evaluate    '${item_name}'.replace(' ','-').lower()
    ${item_id} =    Set Variable    id=remove-${item_id_tmp}
    Wait Until Element Is Visible    ${item_id}    timeout=5
    Click Button    ${item_id}

Start Checkout process
    Wait Until Element Is Visible    ${CheckoutButton}    timeout=5
    Click Button    ${CheckoutButton}

Verify that Shopping Cart has the correct product names
    [Arguments]    ${expected_product_names_list}
    @{actual_product_names_list} =    Get Shopping Cart Product Names List
    Lists Should Be Equal    ${expected_product_names_list}    ${actual_product_names_list}

Verify that Shopping Cart has the correct product prices
    [Arguments]    ${expected_product_prices_list}
    @{actual_product_prices_list} =    Get Shopping Cart Product Prices List
    Lists Should Be Equal    ${expected_product_prices_list}    ${actual_product_prices_list}

Verify that Shopping Cart has the correct product quantities
    [Arguments]    ${expected_product_quantities_list}
    @{actual_product_quantities_list} =    Get Shopping Cart Product Quantities List
    Lists Should Be Equal    ${expected_product_quantities_list}    ${actual_product_quantities_list}

Verify that shopping cart has "${items_count}" items
    Wait Until Element Is Visible    ${ShoppingCartContentsContainerDiv}    timeout=5
    Page Should Contain Element    ${ShoppingCartContentItemsList}    limit=${items_count}
