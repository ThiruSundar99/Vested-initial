***Settings***
Library  AppiumLibrary
Resource  ../Resources/LandingPage.robot

# Test Setup  When user launches App
# Test Teardown  Close Application

***Test Cases***
Open_App
    When user launches App
    Click on Start Investing
    # Click on Terms
    Sign-in with Credentials