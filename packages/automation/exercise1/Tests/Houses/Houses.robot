*** Settings ***
Documentation       Game of Thrones houses validation using Robot Framework

Resource            ../../Resources/PageObject/KeywordDefinitionFiles/HousesRequests.robot


*** Test Cases ***
My first test case
    @{expected_house_names} =    Create List    House Allyrion of Godsgrace
    ...    House Blackmont of Blackmont
    ...    House Briar
    ...    House Brook
    ...    House Brownhill
    ...    House Dalt of Lemonwood
    ...    House Dayne of High Hermitage
    ...    House Dayne of Starfall
    ...    House Drinkwater
    ...    House Dryland
    Create a HTTP session
    ${response} =    Send a Get Request to Houses filtering by region    Dorne
    Verify the response status code    ${response}    200
    Verify the house names are as expected    ${response}    ${expected_house_names}
