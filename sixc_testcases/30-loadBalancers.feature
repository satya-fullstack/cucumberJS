# see https://github.com/matmar10/cucumber-protractor-steps/blob/master/index.js
# for more steps and step configuration
#// http://cucumber-mink.js.org/steps/#click
Feature: Load Balancers Page
  Background:
    Given I click on "a[title='Merchants']"

    Scenario: I should see merchants page
    Then I should see "Merchants"

    Scenario: I browse to Load Balancers
      Given I click on "a[title='Load Balancers']"
      Then I should see "Load Balancers"
      And I should see "New Load Balancers"

    Scenario Outline: I create a new Load Balancer
      Given I click "New Load Balancer"
      And I wait 1 seconds
      Then I should see "Create Load Balancer"
      And the field "Algorithm" is selected to "Weighted %"
      And the field "Interval" is selected to "Daily"
      And I fill in "input[ng-model='newLB.name']" with <name>
      Then I click on "button[text='Create']"
      Then I should be on "/app/merchants/list"
    Examples:
      | name |
      | Supreme Biotics |


  Scenario: I edit a load balancer

  Scenario: I delete a Load Balancer


  Scenario: Negative test: I enter in invalid data on create new load balancer
