*** Settings ***
Documentation       This test scenario aims to execute the proposed flow in Exercise #2 Sauce demo #2.

Resource            ../../Resources/PageObject/KeywordDefinitionFiles/Common.robot
Resource            ../../Resources/PageObject/KeywordDefinitionFiles/LoginPage.robot
Resource            ../../Resources/PageObject/KeywordDefinitionFiles/InventoryPage.robot
Resource            ../../Resources/PageObject/KeywordDefinitionFiles/BurgerMenu.robot
Resource            ../../Resources/PageObject/KeywordDefinitionFiles/ShoppingCartPage.robot

Test Teardown       Close Browser


*** Test Cases ***
Automate using Robot Framework and Selenium Library the following scenario
    @{expected_product_list_name} =    Create List    Sauce Labs Onesie    Sauce Labs Bike Light    Sauce Labs Backpack
    @{expected_product_list_price} =    Create List    $7.99    $9.99    $29.99
    @{expected_product_list_quantity} =    Create List    1    1    1
    @{overview_expected_product_list_name} =    Create List    Sauce Labs Bike Light    Sauce Labs Backpack
    @{overview_expected_product_list_price} =    Create List    $9.99    $29.99
    @{overview_expected_product_list_quantity} =    Create List    1    1
    Login as a Standard User
    Go to Shopping Cart page
    Verify that shopping cart has "0" items
    Opening All Items Burger Menu option
    Add item "Sauce Labs Onesie" to the cart
    Select Sort Price High to Low Option
    Add item "Sauce Labs Bike Light" to the cart
    Select Sort Price Low to High Option
    Add item "Sauce Labs Backpack" to the cart
    Go to Shopping Cart page
    Verify that Shopping Cart has the correct product names    ${expected_product_list_name}
    Verify that Shopping Cart has the correct product prices    ${expected_product_list_price}
    Verify that Shopping Cart has the correct product quantities    ${expected_product_list_quantity}
    Remove item "Sauce Labs Onesie" from the cart
    Start Checkout process
    Fill out Checkout form    Debora    da Silva    1111-11
    Continue Checkout process
    Verify that Checkout Overview has the correct product names    ${overview_expected_product_list_name}
    Verify that Checkout Overview has the correct product prices    ${overview_expected_product_list_price}
    Verify that Checkout Overview has the correct product quantities    ${overview_expected_product_list_quantity}
    Finish Checkout
    Verify Thank You message    Thank you for your order!
    Go Back Home
    Logout
