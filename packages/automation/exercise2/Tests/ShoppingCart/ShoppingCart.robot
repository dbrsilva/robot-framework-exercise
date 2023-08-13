*** Settings ***
Documentation       Shopping Cart Validation using Robot Framework

Resource            ../../Resources/PageObject/KeywordDefinitionFiles/Common.robot
Resource            ../../Resources/PageObject/KeywordDefinitionFiles/InventoryPage.robot
Resource            ../../Resources/PageObject/KeywordDefinitionFiles/ShoppingCartPage.robot

Test Setup          Login as a Standard User


*** Test Cases ***
Verify that Shopping Cart is empty
    Go to Shopping Cart page
    Verify that shopping cart has "0" items

Verify that Shopping Cart has 1 item
    @{expected_product_list_name} =    Create List    Sauce Labs Backpack
    @{expected_product_list_price} =    Create List    $29.99
    @{expected_product_list_quantity} =    Create List    1
    Go to Inventory Page
    Add item "Sauce Labs Backpack" to the cart
    Go to Shopping Cart page
    Verify that shopping cart has "1" items
    Start Checkout process
    Fill out Checkout form    Debora    Silva    1111
    Continue Checkout process
    Verify that Checkout Overview has the correct product names    ${expected_product_list_name}
    Verify that Checkout Overview has the correct product prices    ${expected_product_list_price}
    Verify that Checkout Overview has the correct product quantities    ${expected_product_list_quantity}

Buy 2 items
    @{expected_product_list_name} =    Create List    Sauce Labs Backpack    Test.allTheThings() T-Shirt (Red)
    @{expected_product_list_price} =    Create List    $29.99    $15.99
    @{expected_product_list_quantity} =    Create List    1    1
    Go to Inventory Page
    Add item "Sauce Labs Backpack" to the cart
    Add item "Test.allTheThings() T-Shirt (Red)" to the cart
    Go to Shopping Cart page
    Verify that shopping cart has "2" items
    Verify that Shopping Cart has the correct product names    ${expected_product_list_name}
    Verify that Shopping Cart has the correct product prices    ${expected_product_list_price}
    Verify that Shopping Cart has the correct product quantities    ${expected_product_list_quantity}
    Start Checkout process
    Fill out Checkout form    Debora    Silva    1111
    Continue Checkout process
    Verify that Checkout Overview has the correct product names    ${expected_product_list_name}
    Verify that Checkout Overview has the correct product prices    ${expected_product_list_price}
    Verify that Checkout Overview has the correct product quantities    ${expected_product_list_quantity}
    Finish Checkout
    Verify Thank You message    Thank you for your order!
    Go Back Home
