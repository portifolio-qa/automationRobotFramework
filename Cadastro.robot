*** Settings ***
Documentation    Teste de Cadastro de usuário no Site https://courses.ultimateqa.com/users/sign_up
...  abre o navegador
...  e realiza cadastro
Library  SeleniumLibrary
Library  OperatingSystem

### Inicio e Fim ###
Test Setup      open browser    ${url}  ${browser}
Test Teardown   close browser

*** Variables ***
${browser}      Chrome
${url}          https://courses.ultimateqa.com/users/sign_up

*** Test Cases ***
Cadastro Usuário Site
    [Tags]    cadastro
    Dado acesso o site ultimateqa.com
    Quando preencho o campo FirstName como "Teste" e LastName como "Qa"
    E preencho o campo Email como "teste2@teste.com.br"
    E preencho o campo Password como "#Testando123"
    E clico em I have read
    Então clico no botão "Signup" e visualizo "All Courses"



*** Keywords ***
Setup chromedriver
    Set Environment Variable    webdriver.chrome.driver      C:\\Users\\QA\\PycharmProjects\\automationRobotFramework\\venv\\WebDriverManager\\chrome\\109.0.5414.74\\chromedriver_win32\\chromedriver.exe

Dado acesso o site ultimateqa.com
    wait until element is visible   xpath = //*[@id="user[first_name]"]   30000ms

Quando preencho o campo FirstName como "${Teste}" e LastName como "${Qa}"
    wait until element is enabled   id = user[first_name]
    input text                      id = user[first_name]     ${Teste}
    wait until element is enabled   id = user[last_name]
    input text                      id = user[last_name]      ${Qa}

E preencho o campo Email como "${teste@teste.com.br}"
    wait until element is enabled   id = user[email]
    input text                      id = user[email]     ${teste@teste.com.br}

E preencho o campo Password como "${#Testando123}"
    wait until element is enabled   id = user[password]
    input text                      id = user[password]     ${#Testando123}

E clico em I have read
    click button                id = user[terms]

Então clico no botão "${Signup}" e visualizo "All Courses"
  click button                xpath= //button[@type='submit']
  wait until element is visible   xpath = //*[@id="category-name"]
  element should contain          xpath = //*[@id="category-name"]    All Courses

Fechar o browser
    close browser

