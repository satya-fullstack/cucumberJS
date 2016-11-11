# see https://github.com/matmar10/cucumber-protractor-steps/blob/master/index.js
# for more steps and step configuration

Feature: Campaign Page
  Background: 
    Given I browse "http://localhost:9000"
    And I wait 2 seconds
    
  Scenario: Valid Login
    Given I am on the homepage
    Then I should see "Sign in"
  Scenario: I fill in my info

    Given I fill in "input[name='account_email']" with "david.elbel@fullstackwebdevelopment.com"
    Then I fill in "input[name='account_password'" with "password"
  Scenario: I press Login
    And I press "Login"
    Then I wait 1 seconds
  Scenario: I am logged on
    Then I should see "Merchants"
