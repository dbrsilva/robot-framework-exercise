*** Settings ***
Documentation       Inventory validation using Robot Framework

Library             Collections
Resource            ../../Resources/PageObject/KeywordDefinitionFiles/Common.robot
Resource            ../../Resources/PageObject/KeywordDefinitionFiles/InventoryPage.robot

Test Setup          Login as a Standard User


*** Variables ***
@{product_sort_az_name_expected_result} =
...                                                     Sauce Labs Backpack
...                                                     Sauce Labs Bike Light
...                                                     Sauce Labs Bolt T-Shirt
...                                                     Sauce Labs Fleece Jacket
...                                                     Sauce Labs Onesie
...                                                     Test.allTheThings() T-Shirt (Red)

@{product_sort_high_to_low_price_expected_result} =
...                                                     $49.99
...                                                     $29.99
...                                                     $15.99
...                                                     $15.99
...                                                     $9.99
...                                                     $7.99

@{product_sort_low_to_high_price_expected_result} =
...                                                     $7.99
...                                                     $9.99
...                                                     $15.99
...                                                     $15.99
...                                                     $29.99
...                                                     $49.99


*** Test Cases ***
Sort products as ascending A to Z order
    Select Sort A to Z Option
    @{actual_product_names_list} =    Get Product Names List
    Lists Should Be Equal    ${product_sort_az_name_expected_result}    ${actual_product_names_list}

Sort products as ascending High to Low order
    Select Sort Price High to Low Option
    @{actual_product_prices_list} =    Get Product Prices List
    Lists Should Be Equal    ${product_sort_high_to_low_price_expected_result}    ${actual_product_prices_list}

Sort products as ascending Low to High order
    Select Sort Price Low to High Option
    ${actual_product_prices_list} =    Get Product Prices List
    Lists Should Be Equal    ${product_sort_low_to_high_price_expected_result}    ${actual_product_prices_list}
