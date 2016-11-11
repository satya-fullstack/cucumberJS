Feature: I can use cucumber.mink to check the content of my website

  Background:
    Given I browse "https://www.google.co.in"

  Scenario: Check Homepage content
    Given I am on the homepage
    Then I take a screenshot
