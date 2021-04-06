*** Variables ***

#  Test data or expected values
${e_validEmail} =  indrajit+9377@vestedfinance.co
${e_validPassword} =  iTestUser1!
${e_validPin} =  111111
${e_invalidUserName} =  abcd@gmail.com
${e_invalidPwd} =  Abcd@123
${e_invalidLoginErrorTxt} =  The username or password you entered is invalid
${e_emptyFieldErrorTxt} =  Please fill out this field
${e_dashboardTitle} =  Dashboard | Vested Finance
${e_emptyFieldErrorMsg} =  xpath=//android.widget.Toast[1]
${e_signInAsDiffUser} =  Sign in as a different user?
${e_signinTitle} =  Sign in with your email and password
# Apple credentials
${e_apple_userid} =  abcd@dot.com
${e_apple_pwd} =  Moolya@123
# Facebook  Credentials
${e_Fb_username} =  username@example.com
${e_Fb_password} =  passwordsimply

#Singin
${vf_A_signInBtn} =  xpath=//*[@name='signInSubmitButton']
${vf_A_signUpLink} =  xpath=//*[@text='Sign up']
${vf_A_signInLink} =  xpath=//*[@text='Sign in']
${vf_A_signinFrame} =  xpath=//body/div[1]/div/div[2]
#${vf_A_userName} =  id=signInFormUsername
${vf_A_userName} =  xpath=//*[@class='android.widget.EditText'] 
${vf_A_password} =  xpath=//*[@class='android.widget.EditText'][2]
${vf_A_submitBtn} =  xpath=//*[@text='submit']
${vf_A_pin} =  xpath=//*[@class='android.widget.EditText']
${vf_A_continueBtn} =  xpath=//*[@text='Continue']
${vf_A_stockOne} =  xpath=//*[@text='Tesla, Inc.']
${vf_A_stockTwo} =  xpath=//*[@text='Apple, Inc.']
${vf_A_buyBtn} =  xpath=//*[@text='Buy']
${vf_A_shareInputTxt} =  xpath=//*[@class='android.widget.EditText']
${vf_A_previewOrderBtn} =  xpath=//*[@text='Preview Order']
${vf_A_placeBuyOrderBtn} =  xpath=//*[@text='Place Buy Order']
${vf_A_sellBtn} =  xpath=//*[@text='Sell']
${vf_A_placeSellOrderBtn} =  xpath=//*[@text='Place Sell Order']
${vf_A_logout} =  xpath=//*[text='Log Out']
${vf_A_profile} =  xpath=//span[contains(text(),'Profile')]
${vf_A_noBtn} =  xpath=//*[@text='NO']
${vf_A_cancelBtn} =  xpath=//*[@text='CANCEL']
${vf_A_signInAsDiffUser} =  xpath=//*[@text='Sign in as a different user?']

# Apple Signin Locators
${vf_A_apple_acc} =  xpath=//*[@text='Continue with Apple']
${vf_A_apple_enter} =  xpath=//*[@resource-id='sign-in']
${vf_A_apple_password} =  xpath=//*[@class='android.widget.EditText'] 

# testios@moolya.com - actual username
# ${vf_A_apple_username_id} =  xpath=//*[@id='account_name_text_field']

#Facebook Signin
${vf_A_Fb_button} =  xpath=//*[@name='facebookSignUpButton']
${vf_A_Fb_login} =  xpath=//*[@id='m_login_email']
${vf_A_Fb_pwd} =  xpath=//*[@id='m_login_password']
${vf_A_Fb_signinbutton} =  xpath=//*[@name='login']