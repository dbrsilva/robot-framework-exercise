*** Settings ***
Library         SeleniumLibrary
Variables       ../Locators/BurgerMenuLocators.py
Variables       ../Locators/InventoryLocators.py
Variables       ../Locators/LoginLocators.py


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

Logout
    Opening Burger Menu
    Wait Until Element Is Visible    ${BurgerMenuLogoutLink}    timeout=5
    Click Link    ${BurgerMenuLogoutLink}
    Verify that the user is logged out

Verify that the user is logged out
    Page Should Contain Element    ${LoginContainerDiv}

