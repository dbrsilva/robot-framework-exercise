*** Settings ***
Library         SeleniumLibrary
Library         String
Variables       ../Locators/ShoppingCartLocators.py
Variables       ../Locators/InventoryLocators.py


*** Variables ***
${shopping_cart_page_url}       https://www.saucedemo.com/cart.html


*** Keywords ***
Open Shopping Cart page
    Wait Until Element Is Visible    ${ShoppingCartLink}    timeout=5
    Click Link    ${ShoppingCartLink}

Go to Shopping Cart page
    Log    ${shopping_cart_page_url}
    Go To    ${shopping_cart_page_url}

Add item "${item_name}" to the cart
    ${item_id_tmp} =    Evaluate    '${item_name}'.replace(' ','-').lower()
    ${item_id} =    Set Variable    id=add-to-cart-${item_id_tmp}
    Wait Until Element Is Visible    ${item_id}    timeout=5
    Click Button    ${item_id}

Verify that shopping cart has "${items_count}" items
    Wait Until Element Is Visible    ${ShoppingCartContentsContainerDiv}    timeout=5
    Page Should Contain Element    ${ShoppingCartContentItemsList}    limit=${items_count}
