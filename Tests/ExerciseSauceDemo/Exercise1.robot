*** Settings ***
Documentation       This test scenario aims to execute the proposed flow in Exercise #2 Sauce demo #1.

Resource            ../../Resources/PageObject/KeywordDefinitionFiles/Common.robot
Resource            ../../Resources/PageObject/KeywordDefinitionFiles/LoginPage.robot
Resource            ../../Resources/PageObject/KeywordDefinitionFiles/InventoryPage.robot

Test Teardown       Close Browser


*** Test Cases ***
Negative test scenario - Username and Password not informed
    Opening Browser
    Click Login
    Verify the displayed error message    Epic sadface: Username is required
    Verify that Username field displays an error style
    Verify that Password field displays an error style

Negative test scenario - Username and Password doesn't exist
    Opening Browser
    Input Form Username    abcdef
    Input Form Password    54321
    Click Login
    Verify the displayed error message    Epic sadface: Username and password do not match any user in this service
    Verify that Username field displays an error style
    Verify that Password field displays an error style

Negative test scenario - Incorrect Password
    Opening Browser
    Input Form Username    standard_user
    Input Form Password    54321
    Click Login
    Verify the displayed error message    Epic sadface: Username and password do not match any user in this service
    Verify that Username field displays an error style
    Verify that Password field displays an error style

Negative test scenario - Username case sensitive
    Opening Browser
    Input Form Username    STANDARD_USER
    Input Form Password    secret_sauce
    Click Login
    Verify the displayed error message    Epic sadface: Username and password do not match any user in this service
    Verify that Username field displays an error style
    Verify that Password field displays an error style

Negative test scenario - Password case sensitive
    Opening Browser
    Input Form Username    standard_user
    Input Form Password    SECRET_SAUCE
    Click Login
    Verify the displayed error message    Epic sadface: Username and password do not match any user in this service
    Verify that Username field displays an error style
    Verify that Password field displays an error style

Negative test scenario - Locked out user
    Opening Browser
    Input Form Username    locked_out_user
    Input Form Password    secret_sauce
    Click Login
    Verify the displayed error message    Epic sadface: Sorry, this user has been locked out.
    Verify that Username field displays an error style
    Verify that Password field displays an error style

Positive test scenario - Standard User Login Successfully
    Opening Browser
    Input Form Username    standard_user
    Input Form Password    secret_sauce
    Click Login
    Verify Inventory is Visible

Positive test scenario - Problem User Login Successfully
    Opening Browser
    Input Form Username    problem_user
    Input Form Password    secret_sauce
    Click Login
    Verify Inventory is Visible

Positive test scenario - Performance Glitch User Login Successfully
    Opening Browser
    Input Form Username    performance_glitch_user
    Input Form Password    secret_sauce
    Click Login
    Verify Inventory is Visible
