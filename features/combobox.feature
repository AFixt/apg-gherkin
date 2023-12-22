Feature: Combobox Interaction and Accessibility

  As a user of the website
  I want the combobox to be interactable and accessible
  So that I can choose a value efficiently from a collection

  Background:
    Given a combobox is implemented on a web page
    And the combobox conforms to the Combobox Pattern guidelines

  Scenario: Interacting with the Combobox and Its Popup
    Given the combobox is in the page tab sequence
    When I interact with the combobox
    Then I should be able to select a value from the popup

  Scenario: Keyboard Interaction Within the Combobox
    Given focus is in the combobox
    When I press 'Down Arrow'
    Then the popup should open, and focus should move into it
    When I press 'Up Arrow' (optional)
    Then focus should move to the last element in the popup
    When I press 'Escape'
    Then the popup should be dismissed
    When I press 'Enter'
    Then the value from the popup should be selected
    When I type printable characters
    Then the characters should be typed in the combobox if it's editable

  Scenario: Autocomplete Behavior of the Combobox
    Given the combobox has autocomplete functionality
    When I type in the combobox
    Then it should display suggestions based on the input

  Scenario: Popup Interaction and Keyboard Navigation
    Given the popup is open
    When I navigate within the popup
    Then the focus and selection should follow the keyboard commands

  Scenario: WAI-ARIA Roles, States, and Properties
    Given a combobox is present on the page
    Then it should have the role 'combobox'
    And the popup should have appropriate roles like 'listbox', 'tree', 'grid', or 'dialog'
    And 'aria-haspopup', 'aria-expanded', 'aria-controls', 'aria-activedescendant', 'aria-selected', 'aria-labelledby', 'aria-label', and 'aria-autocomplete' should be used as per the combobox behavior

  Scenario: Selecting Values from the Combobox Popup
    Given the popup is open
    When I select a value
    Then the value should be reflected in the combobox
    And the popup should close

  Scenario: Handling Different Popup Types
    Given the combobox uses different types of popups
    Then the interaction pattern should follow the specific type (listbox, grid, tree, or dialog)

  Scenario: Handling Inline Autocomplete
    Given the combobox supports inline autocomplete
    When I type in the combobox
    Then it should display an inline completion string after the typed input
