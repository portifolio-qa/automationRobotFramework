*** Settings ***
Documentation    Teste de Login de usuário no Site https://courses.ultimateqa.com/users/sign_in
...  abre o navegador
...  e realiza login
Library  SeleniumLibrary
Library  OperatingSystem

### Inicio e Fim ###
Test Setup      open browser    ${url}  ${browser}
Test Teardown   close browser

*** Variables ***
${browser}      Chrome
${url}          https://courses.ultimateqa.com/users/sign_in

*** Test Cases ***
Login Usuário Site
    [Tags]    Login
    Dado acesso o site ultimateqa.com
    Quando preencho o campo Email com "teste2@teste.com.br" e Password com "#Testando123"
    E clico em Remember me
    Então clico no botão "Signin" e visualizo "All Courses"



*** Keywords ***
Setup chromedriver
    Set Environment Variable    webdriver.chrome.driver      C:\\Users\\QA\\PycharmProjects\\automationRobotFramework\\venv\\WebDriverManager\\chrome\\109.0.5414.74\\chromedriver_win32\\chromedriver.exe

Dado acesso o site ultimateqa.com
    wait until element is visible   xpath = //*[@id="user[email]"]   30000ms

Quando preencho o campo Email com "${teste2@teste.com.br}" e Password com "${#Testando123}"
    wait until element is enabled   id = user[email]
    input text                      id = user[email]     ${teste2@teste.com.br}
    wait until element is enabled   id = user[password]
    input text                      id = user[password]     ${#Testando123}

E clico em Remember me
    click button                id = user[remember_me]

Então clico no botão "${Signin}" e visualizo "All Courses"
  click button                xpath= //button[@type='submit']
  wait until element is visible   xpath = //*[@id="category-name"]
  element should contain          xpath = //*[@id="category-name"]    All Courses

Fechar o browser
    close browser

