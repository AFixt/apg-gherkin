Feature: Menu Button Interaction and Accessibility

  As a user of the website
  I want the menu button to provide a dropdown of options
  So that I can select an option from a list

  Background:
    Given a menu button is implemented on a web page
    And it conforms to accessibility and interactive standards

  Scenario: Opening and Closing the Menu
    Given the menu button is focusable
    When I press 'Enter' with focus on the button
    Then the menu should open and focus should be placed on the first menu item
    When I press 'Space' with focus on the button
    Then the menu should open and focus should be placed on the first menu item
    When I press 'Down Arrow' with focus on the button (Optional)
    Then the menu should open and focus should move to the first menu item
    When I press 'Up Arrow' with focus on the button (Optional)
    Then the menu should open and focus should move to the last menu item
    When I click on the menu button
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
    Then the element that opens the menu should have a role of 'button'
    And the element with role 'button' should have 'aria-haspopup' set to 'menu' or true
    And when the menu is displayed the element with role 'button' should have 'aria-expanded' set to true
    And when the menu is hidden the element with role 'button' should have 'aria-expanded' set to false
    And the element that contains the menu items should have a role of 'menu'
    Optionally, the element with role 'button' may have 'aria-controls' referring to the element with role 'menu'
    And the menu options should be accessible and navigable via keyboard

  Scenario: Mouse Interaction with Menu Options
    Given the dropdown menu is open
    When I hover over a menu option
    Then the option should be highlighted
    And when I click on a menu option
    Then the clicked option should be selected
    And the menu should close
