*** Settings ***
Library         SeleniumLibrary
Variables       ../Locators/SauceDemoInventoryLocators.py
Variables       ../TestData/SauceDemoData.py


*** Keywords ***
Open burger menu
    Click Button    ${InventoryBurgerMenuButton}

Go to Shopping Cart page
    Click Element    ${InventoryShoppingCartDiv}

Open product sort select
    Click Element    ${InventoryProductSortSelect}
