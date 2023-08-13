*** Settings ***
Library         SeleniumLibrary
Variables       ../Locators/BurgerMenuLocators.py
Variables       ../Locators/InventoryLocators.py


*** Keywords ***
Opening Burger Menu
    Wait Until Element Is Visible    ${BurgerMenuButton}    timeout=5
    Click Element    ${BurgerMenuButton}
    Wait Until Element Is Visible    ${BurgerMenuWrapDiv}    timeout=5

Opening All Items Burger Menu option
    Opening Burger Menu
    Wait Until Element Is Visible    ${BurgerMenuAllItemsLink}    timeout=5
    Click Element    ${BurgerMenuAllItemsLink}
    Wait Until Element Is Visible    ${InventoryContainerDiv}    timeout=5
