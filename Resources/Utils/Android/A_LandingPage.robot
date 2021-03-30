*** Settings ***

Library     AppiumLibrary
Resource   ../../../AppLocators/Android/CommonAppLocators.robot
Resource   ../../../AppLocators/Android/LandingPageLocators.robot


*** Keywords ***

Landing page is loaded completely
    Wait Until Page Contains  ${e_startInvestingTxt}  timeout=20s
    Log Source  loglevel=INFO

Vested icon is displayed at the top
    Element Should Be Visible  ${vf_A_vestedIcon}  loglevel=INFO

Text about vested is displayed below the logo
    Page Should Contain Text  ${e_welcomeTxt}  loglevel=INFO
    Page Should Contain Text  ${e_aboutVestedTxt}  loglevel=INFO

Verify 3 points on Security, Compliance and Recommendations with icons are displayed
    Wait Until Page Contains  ${e_securityHeading}   timeout=40s
    Page Should Contain Text  ${e_securityTxt}  loglevel=INFO
    Page Should Contain Text  ${e_complianceTxt}  loglevel=INFO
    Page Should Contain Text  ${e_recommendationsTxt}  loglevel=INFO
    log to Console  Verified Text part
    Element Should Be Visible  ${vf_A_securityIcon}  loglevel=INFO
    Element Should Be Visible  ${vf_A_complianceIcon}  loglevel=INFO
    Element Should Be Visible  ${vf_A_recommendationsIcon}  loglevel=INFO 
    log to Console  Verified all Icons
    
Verify Heading for each point is displayed
    Page Should Contain Text  ${e_securityHeading}  loglevel=INFO
    Page Should Contain Text  ${e_complianceHeading}  loglevel=INFO
    Page Should Contain Text  ${e_recommendationsTxt}  loglevel=INFO
    log to Console  Verified all Headings
    Log Source  loglevel=INFO

Verify Landing Page On Mobile
    Log To Console  Landing Page 
    Wait For Element Visibility On Android  ${vf_A_screenHeader}
    Verify Element And Text On Android  ${vf_A_screenHeader}  ${e_screenHeader}
    Wait And Click Element On Android  ${vf_A_startInvestingBtn}
    
    
Verify Buy Sell Stock On Mobile
    # Buy
    Log To Console  BUY 
    Sleep  5s
    Swipe By Percent  70  70  20  20  5000
    Sleep  1s
    Swipe By Percent  70  70  20  20  5000

    Wait For Element Visibility On Android  ${vf_A_stockTwo}
    Click Element  ${vf_A_stockTwo}
    Sleep  1s
    Wait And Click Element On Android  ${vf_A_buyBtn}
    Sleep  1s
    Wait For Element Visibility On Android  ${vf_A_shareInputTxt}
    Input Text  ${vf_A_shareInputTxt}  ${e_shareInputTxt}
    Sleep  1s
    Wait And Click Element On Android  ${vf_A_previewOrderBtn}
    Wait And Click Element On Android  ${vf_A_placeBuyOrderBtn}
    Sleep  10s
    Wait And Click Element On Android  ${vf_A_noBtn}
    Sleep  1s
    Wait And Click Element On Android  ${vf_A_cancelBtn}
    Capture Page Screenshot
    
    # Sell
    Log To Console  SELL
    Sleep  5s
    Swipe By Percent  70  70  20  20  5000
    Sleep  1s
    Swipe By Percent  70  70  20  20  5000
    Wait For Element Visibility On Android  ${vf_A_stockOne}
    Click Element  ${vf_A_stockOne}
    Sleep  1s
    Wait And Click Element On Android  ${vf_A_sellBtn}
    Sleep  1s
    Wait For Element Visibility On Android  ${vf_A_shareInputTxt}
    Input Text  ${vf_A_shareInputTxt}  ${e_shareInputTxt}
    Sleep  1s
    Wait And Click Element On Android  ${vf_A_previewOrderBtn}
    Sleep  1s
    Wait And Click Element On Android  ${vf_A_placeSellOrderBtn}
    Capture Page Screenshot
    Reset Application

Logout Of Application
    Wait For Element Visibility On Android  ${vf_A_profile}
    Mouse Over  ${vf_A_profile}
    Click Element  ${vf_A_logout}
    Sleep  5s
    Verify Element And Text On Android  ${vf_A_screenHeader}  ${e_screenHeader}
    Sleep  5s