*** Settings ***
Library         SeleniumLibrary
Library         String
Resource        ./Common.robot
Variables       ../Locators/ShoppingCartLocators.py
Variables       ../Locators/InventoryLocators.py


*** Variables ***
${shopping_cart_page_url}       https://www.saucedemo.com/cart.html


*** Keywords ***
Add item "${item_name}" to the cart
    ${item_id_tmp} =    Evaluate    '${item_name}'.replace(' ','-').lower()
    ${item_id} =    Set Variable    id=add-to-cart-${item_id_tmp}
    Wait Until Element Is Visible    ${item_id}    timeout=5
    Click Button    ${item_id}

Start Checkout process
    Wait Until Element Is Visible    ${CheckoutButton}    timeout=5
    Click Button    ${CheckoutButton}
    Wait Until Element Is Visible    ${CheckoutInfoContainerDiv}    timeout=5

Continue Checkout process
    Wait Until Element Is Visible    ${CheckoutContinueButton}    timeout=5
    Click Button    ${CheckoutContinueButton}
    Wait Until Element Is Visible    ${CheckoutSummaryContainerDiv}    timeout=5

Fill out Checkout form
    [Arguments]    ${first_name}    ${last_name}    ${postal_code}
    Input Text    ${CheckoutFirstNameInput}    ${first_name}
    Input Text    ${CheckoutLastNameInput}    ${last_name}
    Input Text    ${CheckoutPostalCodeInput}    ${postal_code}

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

Go Back Home
    Wait Until Element Is Visible    ${CheckoutCompleteBackHomeButton}    timeout=5
    Click Element    ${CheckoutCompleteBackHomeButton}
    Wait Until Element Is Visible    ${InventoryContainerDiv}    timeout=5

Open Shopping Cart page
    Wait Until Element Is Visible    ${ShoppingCartLink}    timeout=5
    Click Link    ${ShoppingCartLink}

Verify Thank You message
    [Arguments]    ${expected_thank_you_message}
    Wait Until Element Is Visible    ${CheckoutCompleteThankYouMessageDiv}    timeout=5
    Element Text Should Be    ${CheckoutCompleteThankYouMessageDiv}    ${expected_thank_you_message}

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

Remove item "${item_name}" from the cart
    ${item_id_tmp} =    Evaluate    '${item_name}'.replace(' ','-').lower()
    ${item_id} =    Set Variable    id=remove-${item_id_tmp}
    Wait Until Element Is Visible    ${item_id}    timeout=5
    Click Button    ${item_id}
