Feature: Tabs Interface Interaction and Accessibility

  As a user of the website
  I want the tabs interface to be interactable and accessible
  So that I can easily navigate and view the content of each tab

  Background:
    Given a tabs interface is implemented on a web page
    And the tabs interface conforms to the Tabs Pattern guidelines

  Scenario: Activating a Tab and Displaying Its Panel
    Given the tabs interface is present on the page
    When I activate a tab element
    Then its associated tabpanel should be displayed
    And the activated tab should be styled to indicate that it is active
    And previously displayed tabpanel should be hidden

  Scenario: Keyboard Navigation within the Tab List
    Given the tab list is in focus
    When I press 'Left Arrow'
    Then focus should move to the previous tab
    And if focus is on the first tab, it should move to the last tab
    When I press 'Right Arrow'
    Then focus should move to the next tab
    And if focus is on the last tab, it should move to the first tab
    When I press 'Space' or 'Enter'
    Then the focused tab should be activated
    When I press 'Home'
    Then focus should move to the first tab
    When I press 'End'
    Then focus should move to the last tab

  Scenario: Optional Vertical Orientation of the Tab List
    Given the tab list has a vertical orientation
    When I press 'Down Arrow'
    Then focus should perform as Right Arrow does in horizontal orientation
    When I press 'Up Arrow'
    Then focus should perform as Left Arrow does in horizontal orientation

  Scenario: Handling Focus when Moving into the Tab List
    Given the tab list is about to receive focus
    When focus moves into the tab list
    Then it should place focus on the active tab element
    And when moving focus out of the tablist, it should go to the tabpanel

  Scenario: WAI-ARIA Roles, States, and Properties of Tabs
    Given a tabs interface is present on the page
    Then the container for the set of tabs should have role 'tablist'
    And each tab should have role 'tab' and property 'aria-controls' referring to its associated tabpanel
    And each tabpanel should have role 'tabpanel' and property 'aria-labelledby' referring to its associated tab
    And the active tab should have state 'aria-selected' set to true
    And if the tablist has a visible label, it should be referenced by 'aria-labelledby' or have 'aria-label'

  Scenario: Additional Keyboard Interactions for Tabs
    Given the tab list is in focus
    When I press 'Shift + F10' on a tab with an associated popup menu
    Then the menu should open
    When I press 'Delete' on a tab where deletion is allowed
    Then the current tab and its associated tab panel should be deleted
