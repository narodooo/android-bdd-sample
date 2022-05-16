*** Settings ***
Documentation       HappyFresh Assignment
Resource            ../Resources/keywords.robot

*** Variables ***
${validEmail}       narodo.test@gmail.com
${validPassword}    Happyfresh123
${invalidEmail}     narodo.test@test.com
${invalidPassword}  Happyhappy123
${address}          Thailand

*** Test Cases ***
Scenario: Successful Login
    [Tags]  Login
    Given User open application
    When User navigate to login page
    Then User should be directed to login page
    When User input email address   ${validEmail}
    And User input password         ${validPassword}
    And User click login button
    Then User should be directed to my account page

#---------------------------------------------------------------------------------------------------------------------------------------------------------------------

#Scenario: Unsucessful Login - Invalid Email
#    [Tags]  Login - Negative
#    Given User open application
#    When User navigate to login page
#    Then User should be directed to login page
#    When User input email address   ${invalidEmail}
#    And User input password         ${validPassword}
#    And User click login button
#    Then Error message should be displayed
#
##---------------------------------------------------------------------------------------------------------------------------------------------------------------------
#
#Scenario: Unsucessful Login - Invalid Password
#    [Tags]  Login - Negative
#    Given User open application
#    When User navigate to login page
#    Then User should be directed to login page
#    When User input email address   ${validEmail}
#    And User input password         ${invalidPassword}
#    And User click login button
#    Then Error message should be displayed

#---------------------------------------------------------------------------------------------------------------------------------------------------------------------

Scenario: View Product List
    [Tags]  Product List
    Given User open application
    And User already logged in  ${validEmail}   ${validPassword}
    When User navigate to home page
    Then User should be directed to home page
    When User add valid address which in coverage area
    And User select "Fruit" from "HappyFresh Top Picks" section
    Then User should be directed to selected market page
    When User select "Snacks" category
    Then Product list should be visible to user

#---------------------------------------------------------------------------------------------------------------------------------------------------------------------

Scenario: View Product Details
    [Tags]  Product Details
    Given User open application
    And User already logged in  ${validEmail}   ${validPassword}
    When User navigate to home page
    Then User should be directed to home page
    When User add valid address which in coverage area
    And User select "Fruit" from "HappyFresh Top Picks" section
    Then User should be directed to selected market page
    When User select "Snacks" category
    Then Product list should be visible to user
    When User click first product from the list
    Then Product details/description should be visible to user

#---------------------------------------------------------------------------------------------------------------------------------------------------------------------

Scenario: Add to cart
    [Tags]  Adding to Cart
    Given User open application
    And User already logged in  ${validEmail}   ${validPassword}
    When User navigate to home page
    Then User should be directed to home page
    When User add valid address which in coverage area
    And User select "Fruit" from "HappyFresh Top Picks" section
    Then User should be directed to selected market page
    When User select "Snacks" category
    And User adds first 2 item of "Snacks" category to cart
    And User navigate to cart page
    Then Added item should be visible in cart page