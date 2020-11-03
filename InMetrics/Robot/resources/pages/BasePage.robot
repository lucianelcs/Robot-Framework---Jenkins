*** Settings ***
Documentation       Este arquivo implementa abertura e fechamento do navegador

***Variables***
${base_url}     http://www.inmrobo.tk

*** Keywords ***
### Hooks
Open Session
    Open Chrome headless
    Set Selenium Implicit Wait  10
    Set Window Size     1280        800

Close Session
    Close Browser

After Test
    Capture Page Screenshot

After Test WCLS
    Capture Page Screenshot
    Execute Javascript      localStorage.clear();

Login Session
    Open Session
    Login With      luciane01   123456
   
Open Chrome
    Open Browser    ${base_url}/accounts/login/     chrome   options=add_experimental_option('excludeSwitches', ['enable-logging'])

Open Chrome headless
    Open Browser    ${base_url}/accounts/login/     headlesschrome   options=add_experimental_option('excludeSwitches', ['enable-logging'])
