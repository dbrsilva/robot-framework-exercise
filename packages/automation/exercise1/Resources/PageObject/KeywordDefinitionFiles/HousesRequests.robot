*** Settings ***
Library         RequestsLibrary
Library         JSONLibrary
Library         Collections
Variables       ../TestData/ApiData.py


*** Keywords ***
Create a HTTP session
    Create Session    my_session    ${ApiRRequestURL}    verify=true

Get house name as String
    [Arguments]    ${response}
    @{name}=    Create List
    FOR    ${house}    IN    @{response.json()}
        ${house_tmp}=    Get From Dictionary    ${house}    name
        Append To List    ${name}    ${house_tmp}
    END
    RETURN    ${name}

Send a Get Request to Houses filtering by region
    [Arguments]    ${expected_region}
    ${response}=    GET On Session    my_session    /houses    params=region=${expected_region}
    RETURN    ${response}

Verify the house names are as expected
    [Arguments]    ${response}    ${expected_house_names}
    @{received_house_names}=    Get house name as String    ${response}
    Lists Should Be Equal    ${received_house_names}    ${expected_house_names}

Verify the response status code
    [Arguments]    ${response}    ${expected_status_code}
    Status Should Be    ${expected_status_code}    ${response}
