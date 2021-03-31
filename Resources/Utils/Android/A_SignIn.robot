*** Settings ***
from PIL import Image
import  pytesseract
import  re

Library     AppiumLibrary
Resource   ../../../AppLocators/Android/CommonAppLocators.robot
Resource   ../../../AppLocators/Android/SignInLocators.robot
Resource   ../../../AppLocators/Android/LandingPageLocators.robot

*** Keywords ***

User is navigated to Sign In page
    #write conditional code to handle Easy sign in page, if that page appears
    Sleep  5s
    Wait And Click Element On Android  ${vf_A_startInvestingBtn}
    Sleep  5s
    Wait Until Page Contains  Sign in with your email and password
    Log to Console  User is in Sign-in Page!

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

Sign-in with valid Credentials
    # Signin
    Log To Console  Signin
    Sleep  2s
    Wait For Element Visibility On Android  ${vf_A_userName}
    Input Text  ${vf_A_userName}  ${e_username} 
    Input Text  ${vf_A_password}  ${e_pwd}
    Wait And Click Element On Android  ${vf_A_submitBtn} 
    Sleep  2s
    Wait For Element Visibility On Android  ${vf_A_pin}
    Input Text  ${vf_A_pin}  ${e_pin}
    Wait And Click Element On Android  ${vf_A_continueBtn}
    Sleep  5s

Sign-in with invalid Credentials
    # Signin
    Log To Console  Signin
    Wait For Element Visibility On Android  ${vf_A_userName}
    Input Text  ${vf_A_userName}  ${e_incorrectUserName} 
    Input Text  ${vf_A_password}  ${e_incorrectPwd}
    Wait And Click Element On Android  ${vf_A_submitBtn} 
    Log To Console  Entered incorrect email and password

User enters only email id in Email field
    Wait For Element Visibility On Android  ${vf_A_userName}
    Input Text  ${vf_A_userName}  ${e_incorrectUserName}
    Log To Console  Entered only email

Clicked on 'Sign in' button
    Wait And Click Element On Android  ${vf_A_submitBtn}
    Log To Console  Clicked SignIn Button
    Log Source  loglevel=INFO

User is logged-in and directed to Dashboard page
    Wait Until Page Contains  ${e_dashboardTitle}  timeout=10s
    Page Should Contain Text  ${e_dashboardTitle}  loglevel=INFO
    Log To Console  User is directed to Dashboard page

"The username or password you entered is invalid" Error message is displayed
    Wait Until Page Contains  ${e_invalidLoginErrorTxt}  timeout=10s
    Page Should Contain Text  ${e_invalidLoginErrorTxt}  loglevel=INFO
    Log To Console  Verified error msg text

def ocr_core(filename, searchtext):
    #This function will handle the core OCR processing of images.
    
    text = pytesseract.image_to_string(Image.open(filename))  
    # We'll use Pillow's Image class to open the image and pytesseract to detect the string in the image text.
    print(text)
    msg = re.findall(searchtext, text)
    return msg

"Please fill out this field" message is displayed
    #Sleep  2s
    Click Element  ${vf_A_submitBtn}
    Capture Page Screenshot  filename=fieldError-Screenshot.png
    ocr_core("fieldError-Screenshot.png", "Please fill out this field")
    Log To Console  Verified error msg text

