#to run: $      ./node_modules/.bin/protractor --cucumberOpts.tags @merchant ./protractor-conf.js

@merchant
Feature: Merchants Page
  Background: I login
    Given I browse "http://localhost:9000"
    Given I am on the homepage
    Then I should see "Sign in"
    Given I fill in "input[name='account_email']" with "ubuntuuser@esn.com"
    Then I fill in "input[name='account_password'" with "123456"
    And I press "Login"

  Scenario: I browse to Merchants
    Given I wait 5 seconds
    Given I click on "a[title='Merchants']"
    Then I should see "Merchants"
    Then I press "button[name='newmerchant']"
    Then I should see "New Merchant MID"
    And I should see "General Details"
    And the "button[name='CreateMID']" field should be disabled

  Scenario: I create a new Merchant
    Given I am on "#/app/merchants/new"
    Given I wait 2 seconds
    When I fill in "input[name='midTitle']" with "bioticanma03882"
    Then I wait 2 seconds
    Then I select "Nmi" from "select[ng-model='merchantCreateVm.model.generalDetails.gatewayId']"
    Then I wait 2 seconds
    Then I fill in "input[name='username']" with "nmiUsername"
    Then I fill in "input[name='password']" with "nmiPassword"
    Then I fill in "input[name='processorId']" with "nma03882"
    Then I fill in "input[name='MerchantID']" with "delete"
    Then I fill in "input[name='SiteID']" with "delete"
    Then the "button[name='CreateMID']" field should be enabled
    Then I fill in "input[name='phoneNumber']" with "80-092-44916"
    Then I fill in "input[ng-model='merchantCreateVm.model.customerService.chargeBackNumber']" with "8005551212"
    Then I fill in "input[name='email']" with "clients@xcaliber-solutions.com"
    Then I fill in "input[name='url']" with "https://www.tryprecisionforskolin.com/"
    Then I wait 2 seconds
    Then I check "input[name='isEnabled']"
    Then I check "input[name='isPrepaidCardBlocked']"
    Then I uncheck "input[name='isDebitCardBlocked']"
    Then I uncheck "input[name='isECheck']"
    Then I check "input[name='isMasterCard']"
    Then I check "input[name='isVisa']"
    Then I check "input[name='isAmericanExpress']"
    Then I check "input[name='isDiscover']"
    Then I fill in "input[name='monthlyCap']" with "50000"
    Then I fill in "input[name='discountRate']" with "4"
    Then I fill in "input[name='transactionFee']" with "1"
    Then I fill in "input[name='reserveRate']" with "15"
    Then I fill in "input[name='chargeBackRatio']" with "0"
    Then I fill in "input[ng-model='merchantCreateVm.model.merchantDetails.descriptor']" with "8009244916Health"
    Then I fill in "input[ng-model='merchantCreateVm.model.merchantDetails.midNumber']" with "MID01"
    Then I fill in "input[ng-model='merchantCreateVm.model.merchantDetails.Processor']" with "Pro001"
    Then I wait 2 seconds
    And I press "Create MID"

  Scenario: I am on the Merchant list
    Given I am on "#/app/merchants/list"
    Then I wait 2 seconds
    And I should see "bioticanma03882"
    Then I wait 2 seconds