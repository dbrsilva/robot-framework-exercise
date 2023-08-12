*** Settings ***
Documentation       Burger Menu validation using Robot Framework

Resource            ../../Resources/PageObject/KeywordDefinitionFiles/Common.robot
Resource            ../../Resources/PageObject/KeywordDefinitionFiles/BurgerMenu.robot

Test Setup          Login as a Standard User


*** Test Cases ***
Open All Items menu option
    Opening All Items Burger Menu option
