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
    Go to Inventory Page
    Add item "Sauce Labs Backpack" to the cart
    Go to Shopping Cart page
    Verify that shopping cart has "1" items

Verify that Shopping Cart has 2 items
    Go to Inventory Page
    Add item "Sauce Labs Backpack" to the cart
    Add item "Test.allTheThings() T-Shirt (Red)" to the cart
    Go to Shopping Cart page
    Verify that shopping cart has "2" items
