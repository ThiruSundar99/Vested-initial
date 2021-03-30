*** Settings ***

Library     JSONLibrary
Library     JsonValidator
Library     AppiumLibrary
Resource   ../../../AppLocators/Android/CommonAppLocators.robot

*** Keywords ***

Launch Vested Android App
    Run Keyword If    '${environmentToRunTest}'=='${e_realDevice}'  Open Kuvera App On Real Device
    ...     ELSE IF   '${environmentToRunTest}'=='${e_browserstackDevice}'  Open Kuvera App On Browserstack

Open Vested App On Browserstack
    Open Application  ${remote_URL}  app=bs://c9ea03eb5649b488f8c692af206f916e40904608  name=PreloginTests   build=RobotFramework    platformName=Android    os_version=9.0    device=Google Pixel 3  

Open Vested App On Real Device
    Open Application  ${server}  platformName=${platform}  platformVersion=${platform_version}  deviceName=${device}  automationName=${appium}  appActivity=${app_activity}  appPackage=${app_package}
   
Open Vested App On Emulator
    Open Application  http://localhost:4723/wd/hub  platformName=${platform}   deviceName=${emulator}   appPackage=${app_package}   appActivity=${app_activity}  automationName=Uiautomator2

Verify Element And Text On Android
    [Arguments]  ${element}  ${text}
    Run Keyword And Continue On Failure  Element Should Contain Text  ${element}  ${text}

Wait For Element Visibility On Android
    [Arguments]  ${element}
    Wait Until Element Is Visible  ${element}  timeout=30

Wait And Click Element On Android
    [Arguments]  ${element}
    Wait For Element Visibility On Android  ${element}
    Click Element  ${element}

Wait And Verify Element And Text On Android
    [Arguments]  ${element}  ${text}
    Wait For Element Visibility On Android  ${element}
    Verify Element And Text On Android  ${element}  ${text}    

Get Json Values
    [Arguments]  ${jsonPath}  ${jsonFilePath}
    ${jsonFile}  Load JSON From File  ${jsonFilePath}
    ${jsonValue}  Get Value From Json  ${jsonFile}  ${jsonPath}
    [Return]  ${jsonValue}

Verify Page Contains Element On Android
    [Arguments]  ${element}
    Wait For Element Visibility On Android  ${element}
    Run Keyword And Continue On Failure  Page Should Contain Element  ${element}

Scroll Down On Android
    [Arguments]  ${element}
    Scroll Down  ${element}

Get Json Values On Android
    [Arguments]  ${jsonPath}  ${jsonFilePath}
    ${jsonFile}  Load JSON From File  ${jsonFilePath}
    ${jsonValue}  Get Value From Json  ${jsonFile}  ${jsonPath}
    [Return]  ${jsonValue}

Verify Widgets And Title
    [Arguments]  ${label}  ${labelText}  ${title}  ${titleText}
    Wait And Verify Element And Text On Android  ${label}  ${labelText}
    Wait And Click Element On Android  ${label}
    Wait And Verify Element And Text On Android  ${title}  ${titleText}
   
Quit Vested Application
    Quit Application
