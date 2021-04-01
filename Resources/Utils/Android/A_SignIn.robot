*** Settings ***

Library     AppiumLibrary

*** Keywords ***

User Navigates To Signin Screen
    Click on Start Investing button
    Verify Signin Screen

Verify Signin Screen
    Click On Element If Visibile  ${vf_A_signInAsDiffUser}
    Wait For Page Conatin Element  ${e_signinTitle}  timeout=20s
    Log to Console  Signin screen Verified!

User Clicks On Signup Link
    Swipe By Percent  70  70  20  20  5000
    Wait And Click Element On Android  ${vf_A_signUpLink}

User Clicks On Signin Link 
    Swipe By Percent  70  70  20  20  5000
    Wait And Click Element On Android  ${vf_A_signInLink}
    
Enter Email
    [Arguments]  ${email}
    Verify Element Visibility  ${vf_A_userName}
    Input Text  ${vf_A_userName}  ${email} 
    Log To Console  Email entered - ${email} 

Enter Password
    [Arguments]  ${password}
    Verify Element Visibility  ${vf_A_password}
    Input Text  ${vf_A_password}  ${password}
    Log To Console  Password entered - ${password}

Click On Signin Button
    Verify Element Visibility  ${vf_A_submitBtn}
    Wait And Click Element On Android  ${vf_A_submitBtn}
    Log To Console  Clicked Signin Button

Enter Pin
    [Arguments]  ${pin}
    Sleep  5s
    Wait And Click Element On Android  ${vf_A_pin} 
    Input Text  ${vf_A_pin}  ${pin}
    Log To Console  Pin entered - ${pin}

Click On Continue Button
    Sleep  2s
    Wait And Click Element On Android  ${vf_A_continueBtn}

Signin With Valid Credentials - Funded Account
    Enter Email  ${e_validEmail}
    Enter Password  ${e_validPassword}
    Click On Signin Button
    Enter Pin  ${e_validPin}
    Click On Continue Button
    Verify Dashboard Screen

Signin With Invalid Credentials
    Enter Email  ${e_invalidUserName} 
    Enter Password  ${e_invalidPwd}
    Click On Signin Button
    Log To Console  Entered invalid email and password
    Verify Error Message Displayed  ${e_invalidLoginErrorTxt}

User Enters Only Email
    Wait For Element Visibility On Android  ${vf_A_userName}
    Input Text  ${vf_A_userName}  ${e_invalidUserName}
    Log To Console  Entered only email

User Enters Only Password
    Wait For Element Visibility On Android  ${vf_A_userName}
    Input Text  ${vf_A_userName}  ${e_invalidUserName}
    Log To Console  Entered only password

Verify Dashboard Screen
    Verify Page Contains Element On Android  ${vf_A_home}
    Log To Console  User is directed to Dashboard screen

Please fill out this field message is displayed
    #Sleep  2s
    Click Element  ${vf_A_submitBtn}
    Capture Page Screenshot  filename=fieldError-Screenshot.png
    ocr_core("fieldError-Screenshot.png", "Please fill out this field")
    Log To Console  Verified error msg text