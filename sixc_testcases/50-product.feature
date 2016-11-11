@product
Feature: Products Page

  Background: I login
    Given I browse "http://localhost:9000"
    Given I am on the homepage
    Then I should see "Sign in"
    Given I fill in "input[name='account_email']" with "testuser@esn.com"
    Then I fill in "input[name='account_password'" with "123456"
    And I press "Login"

  Scenario: I browse to Products
    Given I wait 5 seconds
    Given I click on "a[title='Products']"
    Then I should see "Merchants"
    Then I press "button[name='new product']"
    Then I should see "New Merchant MID"
    And I should see "General Details"
    And the "button[name='CreateMID']" field should be disabled
