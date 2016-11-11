#to run: $      ./node_modules/.bin/protractor --cucumberOpts.tags @signup ./protractor-conf.js

@signup
Feature: Sign up
  Background:
    Given I browse "http://localhost:9000"

  Scenario: I go to the sign up page
    Given I am on the homepage
    When I should see "sign up"
    Then I click on "a[ui-sref='signup']"
    Then I am on "#/signup"
    Then the "input[name='next'][type='button']" field should be disabled

  Scenario: I fill in my info
    Given I should see "Create your account"
    Given I should see "Create your SixCRM account"
    #Given I should see "div.sign-up-form>input:nth-child(9)[name='next']" should be disabled
    When I fill in the following:
      | input[ng-model='signUpVm.model.personal.companyName']  | My company name   |
      | input[ng-model='signUpVm.model.personal.email']        | myemail@email.com |
      | input[ng-model='signUpVm.model.personal.confEmail']    | myemail@email.com |
      | input[ng-model='signUpVm.model.personal.password']     | myPassword        |
      | input[ng-model='signUpVm.model.personal.confPassword'] | myPassword        |
    Then the "input[name='next'][type='button']" field should be enabled
    Then I press "input[name='next'][type='button']" #Next button
    Then I wait 10 seconds
    And I am on "#/signup"
    And I should see "Contact Information"

  Scenario: I click "Previous" to go back
    Given I press "input[name='previous'][type='button']" #Previous button
    Then I should see "Create your account"
    And I should see "Create your SixCRM account"

  Scenario: I enter in invalid information #1, email #2 not matching
    Given I should see "Create your account"
    When I fill in the following:
      | input[ng-model='signUpVm.model.personal.email']     | myemail@email.com            |
      | input[ng-model='signUpVm.model.personal.confEmail'] | myemailNOTMATCHING@email.com |
    #Then the "input[name='next'][type='button']" field should be disabled
    Then I should see "Your email does not match"

  Scenario: I fix the email and the Your Email does not match error goes away
    Given I should see "Create your account"
    Given I should see "Create your SixCRM account"
    When I fill in the following:
      | input[ng-model='signUpVm.model.personal.email']     | myemail@email.com |
      | input[ng-model='signUpVm.model.personal.confEmail'] | myemail@email.com |
    Then I should not see text matching "Your email does not match"

  Scenario: I enter in two different passwords and get an error message
    Given I should see "Create your account"
    Given I should see "Create your SixCRM account"
  #And the "input[name='next'][type='button']" field should be disabled
  #Given I should see "input[name='next'][type='button']" should be disabled
    When I fill in the following:
      | input[ng-model='signUpVm.model.personal.password']     | myPassword                       |
      | input[ng-model='signUpVm.model.personal.confPassword'] | myTOTALLYDIFFERENTPASSWDPassword |
    Then I should see "Your password does not match"
    #And the "input[name='next'][type='button']" should be disabled

  Scenario: I enter in correct information and click Next
    When I fill in the following:
      | input[ng-model='signUpVm.model.personal.companyName']  | My company name   |
      | input[ng-model='signUpVm.model.personal.email']        | myemail@email.com |
      | input[ng-model='signUpVm.model.personal.confEmail']    | myemail@email.com |
      | input[ng-model='signUpVm.model.personal.password']     | myPassword        |
      | input[ng-model='signUpVm.model.personal.confPassword'] | myPassword        |
    And I should not see text matching "Your password does not match"
    #And the "div.sign-up-form>input:nth-child(9)[name='next']" should be enabled
    Then I press "input[name='next'][type='button']" #Next button
    And I wait 10 seconds
    And I am on "#/signup"
    And I should see "Contact information"
    #And the "div.sign-up-form>input:nth-child(12)" should be enabled # The previous button should be enabled
    #And the "div.sign-up-form>input:nth-child(13)" should be disabled # The Next button should be disabled because there is no info

  Scenario: I enter in valid contact information and Next is enabled after I do so
    When I fill in the following:
      | input[ng-model='signUpVm.model.contact.firstName']     | First Name |
      | input[ng-model='signUpVm.model.contact.lastName']      | Last Name  |
      | input[ng-model='signUpVm.model.contact.phone']         | Portland   |
      | input[ng-model='signUpVm.model.contact.addressFirst']  | Address 1  |
      | input[ng-model='signUpVm.model.contact.addressSecond'] | Address 2  |
      | input[ng-model='signUpVm.model.contact.city']          | Portland   |
      | input[ng-model='signUpVm.model.contact.zipCode']       | 90210      |
      #TODO state and country fill
    #Then the "div.sign-up-form>input:nth-child(13)" should be enabled #Next should be enabled now
    Then I press "input[name='next'][type='button']" #Next button

  #TODO, invalid contact info, testing Next enable/disabled

  Scenario: I enter in valid billing information
    Given I should see "Billing Information"
    #And I should see "Enter your payment method"
    #And the "input[name='next'][type='button']" is disabled
   # When I fill "input[ng-model='']" with ""
    #And I fill  "input[ng-model='']" with ""
    #Then I select "10" in "select.cardMonth"
    #Then I select "2017" in "select.cardYear"
    #Then I select "Visa" in "select.cardType"
    #And I fill  "input[ng-model='']" with "90210"
    #Then the "input[name='next'][type='button']" is enabled
    And I press "input[name='next'][type='button']" #Next button
    #And I should see "Read and agree to the Terms and Conditions"
    #And the "input[name='next'][type='button']" should be disabled #The submit button is disabled

  #todo, invalid billing information, bad card number, bad experiation date, invalid date, missing field tests, negative and positive tests

  Scenario: I accept and submit
    Given I should see "Accept and continue"
    #Given the "div.sign-up-form>input:nth-child(7)" should be disabled #The submit button is disabled
    #Then I check "#checkbox-accept"
    #And the "div.sign-up-form>input:nth-child(7)" should be enabled #The submit button is enabled
    #Then I click "input.ct-active" #Accept button
    #And I see "Check your email for your registration link"