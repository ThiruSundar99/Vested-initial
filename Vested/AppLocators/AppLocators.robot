***Variables***
#Open app
${porturl} =  http://localhost:4723/wd/hub
${platform} =  Android
${device} =  emulator-5554
${package} =  com.vested.investing.android.staging
${activity} =  com.vested.mobileclient.MainActivity
${automator} =  Uiautomator2

#start investing
${button1} =  Start Investing

# Sign in with gemail
${email_signin} =  xpath=//*[@resource-id='signInFormUsername']
${password} =  xpath=//*[@resource-id='signInFormPassword']
${enter_pin} =  xpath=//*[@text='Enter Pin']

#Credentials
${username} =  indrajit+9377@vestedfinance.co
${pwd} =  iTestUser1!
${submit} =  xpath=//*[@text='submit']
${pin_num} =  111111
${continue} =  xpath=//*[@text='Continue']
# ${verification_txt} =  terms