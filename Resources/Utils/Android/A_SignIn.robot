*** Settings ***

Library     AppiumLibrary
Resource   ../../../AppLocators/Android/CommonAppLocators.robot
Resource   ../../../AppLocators/Android/SignInLocators.robot
Resource   ../../../AppLocators/Android/LandingPageLocators.robot

*** Keywords ***

User is in Sign In page
    Wait And Click Element On Android  ${vf_A_startInvestingBtn}

Clicked on 'Sign up' link besides 'Need an account?' text
    Wait And Click Element On Android  ${vf_A_signUpLink}

Clicked on 'Sign in' link besides 'Already have an account?' text
    Wait And Click Element On Android  ${vf_A_signInLink}

'Sign in' button with Email & password fields are displayed
    Wait For Element Visibility On Android  ${vf_A_userName}
    Element Should Be Visible  ${vf_A_userName}  loglevel=INFO
    Element Should Be Visible  ${vf_A_password}  loglevel=INFO
    Wait For Element Visibility On Android  ${vf_A_submitBtn}
    Element Should Be Visible  ${vf_A_submitBtn}  loglevel=INFO

Sigin To Mobile Application
    # Signin
    Log To Console  Signin
    Wait For Element Visibility On Android  ${vf_A_userName}
    Input Text  ${vf_A_userName}  ${e_userName} 
    Input Text  ${vf_A_password}  ${e_password}
    Wait And Click Element On Android  ${vf_A_submitBtn} 
    Sleep  2s
    Wait For Element Visibility On Android  ${vf_A_pin}
    Input Text  ${vf_A_pin}  ${e_pin}
    Wait And Click Element On Android  ${vf_A_continueBtn}
    Sleep  5s

User enters incorrect email and password
    Wait For Element Visibility On Android  ${vf_A_userName}
    Input Text  ${vf_A_userName}  ${e_incorrectUserName} 
    Input Text  ${vf_A_password}  ${e_incorrectPassword}
    Log To Console  Entered incorrect email and password

User enters only email id in Email field
    Wait For Element Visibility On Android  ${vf_A_userName}
    Input Text  ${vf_A_userName}  ${e_incorrectUserName}
    Log To Console  Entered only email

Clicked on 'Sign in' button
    Wait And Click Element On Android  ${vf_A_submitBtn}
    Log To Console  Clicked SignIn Button
    Log Source  loglevel=INFO

"The username or password you entered is invalid" Error message is displayed
    Wait Until Page Contains  ${e_invalidLoginErrorTxt}  timeout=10s
    Page Should Contain Text  ${e_invalidLoginErrorTxt}  loglevel=INFO
    Log To Console  Verified error msg text

"Please fill out this field" message is displayed
    #Wait Until Page Contains  ${e_emptyFieldErrorTxt}  timeout=10s
    Click Element  ${vf_A_submitBtn}
    Page Should Contain Text  ${e_emptyFieldErrorTxt}  loglevel=INFO
    #Element Should Be Visible  ${e_emptyFieldErrorMsg}  loglevel=INFO
    Log To Console  Verified error msg text