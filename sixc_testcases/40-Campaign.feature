# see https://github.com/matmar10/cucumber-protractor-steps/blob/master/index.js
# for more steps and step configuration
#// http://cucumber-mink.js.org/steps/#click
Feature: Campaign
  Background:
    Given I click on "a[title='Campaigns']"
    Then I should see "Campaign"

  Scenario: I browse to list
    Then I should be on "/app/merchants/list"
    And I see "New campaign"

  Scenario: I create a New Campaign
    Given I click on "a[title='New Campaign']"
    Then I should see "Load Balancers"
    And I should see "New Load Balancers"
    And I see "Create a new campaign"
    And I see "We need a name for your new campaign. Please enter your Campaign Name"

  Scenario Outline: I fill in the campaign name
    Then I fill in "input[ng-model='']" with <campaignName>
    And I click on "Next"
    And I should be on "/#/app/campaign/edit/"
  Examples:
  | campaignName |
  | myCampaign   |

  Scenario: I fill in my new campaign information
    Given I should see "Campaign Id"
    And I should see "Basic Options"
    Then I fill in "input[ng-model=''] with <variable>
    Then I fill in "input[ng-model=''] with <variable>
    Then I fill in "input[ng-model=''] with <variable>
    Then I click "Quality Assurance"
    And I click "Must Agree to TOS"
    And I click "Shipping options"
    And I click "Other Options"
    And I click "Capture On Shipment"
    And I click "Retail Orders"
    And I click "Block Prepaid Cards"
    And I click "Disable External Payments"
    And I click "Chargeback Blacklist"

  Scenario: I change some values and update
    Given I click Update
    Then I see "Saved"
    And I see "updated"
    And I click "OK"
    And I don't see "updated"


  Scenario: I add an offer
    Given I click "Add Offer"
    And I should be on "/#/app/campaign/addOffer/"

  Scenario: I see the Add Offer page render
    Then I see "Add Offer"
    And I see "General Details"
    And I see "Base Product"
    And I see "Merchant Account"

    And I see "Billing Schedule"
    And I see "Billing Type"
    And I see "Base Price"
    And I see "Ship Price"
    And I see "is Shippable"
    And I see "Order Limits"
    And I see "Min price $"

   Scenario: I enter general details
     When I select "Offer" from "select.productType"
     Then the "select[name='productType']" current option contain "Offer"

   Scenario: I enter a base product
     When I select "my product" from "select



  Scenario: I create a new Load Balancer
    Given I click "New Load Balancer"
    And I wait 1 seconds
    Then I should see "Create Load Balancer"
    And the field "Algorithm" is selected to "Weighted %"
    And the field "Interval" is selected to "Daily"
    And I fill in "input[ng-model='newLB.name']" with <name>
    Then I click on "button[text='Create']"
    Then I should be on "/app/merchants/list"
    #Examples:
    #  | name |
    #  | Supreme Biotics |


  Scenario: I edit a load balancer

  Scenario: I delete a Load Balancer


  Scenario: Negative test: I enter in invalid data on create new load balancer
