Feature: Listbox Interaction and Accessibility

  As a user of a website with a listbox
  I want to be able to interact with the listbox and select options
  So that I can make choices from a list of options

  Background:
    Given a listbox is implemented on a web page
    And it conforms to the Listbox Pattern guidelines

  Scenario: Navigating and Selecting in a Single-Select Listbox
    Given a single-select listbox is present
    When the listbox receives focus
    Then focus should be set on the first option if none are selected
    And focus should be set on the selected option if one is selected
    When I press 'Down Arrow'
    Then focus moves to the next option
    When I press 'Up Arrow'
    Then focus moves to the previous option
    When I press 'Home'
    Then focus moves to the first option
    When I press 'End'
    Then focus moves to the last option

  Scenario: Navigating and Selecting in a Multi-Select Listbox
    Given a multi-select listbox is present
    When the listbox receives focus
    Then focus should be set on the first option if none are selected
    And focus should be set on the first selected option if one or more are selected
    When I press 'Space'
    Then the selection state of the focused option changes

  Scenario: Type-Ahead Feature in Listboxes
    Given a listbox is present with more than seven options
    When I type a character
    Then focus moves to the next item starting with that character

  Scenario: Accessibility Features of Listbox
    Given a listbox is present on the page
    Then it should have the role 'listbox'
    And each option should have the role 'option'
    And selectable but not selected options should have 'aria-selected' set to false
    And selected options should have 'aria-selected' set to true

  Scenario: Listbox Orientation and Dynamic Loading
    Given a listbox is present on the page
    When options are arranged horizontally
    Then the listbox should have 'aria-orientation' set to horizontal
    And when dynamic loading is used
    Then 'aria-setsize' and 'aria-posinset' attributes should be set appropriately
