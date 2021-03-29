***Settings***
Library  AppiumLibrary
Resource  ../AppLocators/AppLocators.robot

***Keywords***
Looking for Text
    [Arguments]  ${text}
    Wait Until Page Contains  ${text}  timeout=30s

When user launches App
    Open Application  ${porturl}  platformName=${platform}  deviceName=${device}  appPackage=${package}  appActivity=${activity}  automationName=${automator}
    Looking for Text  ${button1}
    Log Source  loglevel=INFO

Click on Start Investing
    Click Text  Start Investing  exact_match=True
    Sleep  5s
    Wait Until Page Contains  Sign in with your email and password
    Log to Console  Sign-in Page Verified!
    Sleep  5s
    # Go Back
    # Sleep  3s
    # Log Source

# Click on Terms
#     Click Text  ${verification_txt}  exact_match=True
#     Sleep  10s
#     Wait Until Page Contains  Terms of Service
#     Log to Console  Terms Verified!
#     Sleep  2s
#     Go Back

# # Click Policy
# #      Click Text  policy  exact_match=True
# #     Sleep  5s
# #     Page Should Contain Text  Terms of Service
# #     Log to Console  Terms Verified!
# #     Sleep  2s
# #     Go Back

Sign-in with Credentials
    Wait Until Element Is Visible  ${email_signin}
    Input Text  ${email_signin}  ${username}
    Input Text  ${password}  ${pwd}
    Click Element  ${submit}
    Sleep  5s
    Input Text  ${enter_pin}  ${pin_num}
    Sleep  2s
    Click Element  ${continue}
    Sleep  5s
    Log to Console  Sign in successful
