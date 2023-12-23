Feature: Menu Button Interaction and Accessibility

  As a user of the website
  I want the menu button to provide a dropdown of options
  So that I can select an option from a list

  Background:
    Given a menu button is implemented on a web page
    And it conforms to accessibility and interactive standards

  Scenario: Opening and Closing the Menu
    Given the menu button is focusable
    When I click on the menu button or press 'Enter' or 'Space' when focused
    Then the associated dropdown menu should appear
    And when I click outside the menu or press 'Escape' while it's open
    Then the dropdown menu should close

  Scenario: Navigating Menu Options with Keyboard
    Given the dropdown menu is open
    When I press 'Down Arrow'
    Then the focus should move down through the menu options
    When I press 'Up Arrow'
    Then the focus should move up through the menu options
    When I press 'Enter' on a focused menu option
    Then the focused option should be selected
    And the menu should close

  Scenario: Dismissing the Menu without Selection
    Given the dropdown menu is open
    When I press 'Escape'
    Then the menu should close
    And the focus should return to the menu button

  Scenario: Accessibility Features of the Menu Button
    Given a menu button is present on the page
    Then it should have appropriate WAI-ARIA roles, states, and properties
    And its state should reflect whether the menu is expanded or collapsed
    And the menu options should be accessible and navigable via keyboard

  Scenario: Mouse Interaction with Menu Options
    Given the dropdown menu is open
    When I hover over a menu option
    Then the option should be highlighted
    And when I click on a menu option
    Then the clicked option should be selected
    And the menu should close
