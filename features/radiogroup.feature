Feature: Radio Group Interaction and Accessibility

  As a user of the website
  I want radio groups to be interactable and accessible
  So that I can select one option from a set of choices

  Background:
    Given a radio group is implemented on a web page
    And the radio group conforms to the WAI-ARIA Radio Group Pattern guidelines

  Scenario: Keyboard Interaction with a Standard Radio Group
    Given a standard radio group is present on the page
    When I press 'Tab' or 'Shift + Tab'
    Then focus should move into and out of the radio group
    And if a radio button is checked, focus is set on the checked button
    And if none are checked, focus is set on the first radio button
    When I press 'Space'
    Then the focused radio button should be checked
    When I press 'Right Arrow' or 'Down Arrow'
    Then focus moves to the next radio button, checking it and unchecking the previous one
    When I press 'Left Arrow' or 'Up Arrow'
    Then focus moves to the previous radio button, checking it and unchecking the previous one

  Scenario: Keyboard Interaction with Radio Group in a Toolbar
    Given a radio group is in a toolbar
    When I navigate through the toolbar using 'Right Arrow' or 'Left Arrow'
    Then focus should move between radio buttons without changing the checked state
    When I press 'Space' or 'Enter' (optional)
    Then the focused radio button should be checked
    When I press 'Down Arrow' (optional)
    Then focus moves to the next radio button in the radio group
    When I press 'Up Arrow' (optional)
    Then focus moves to the previous radio button in the radio group

  Scenario: WAI-ARIA Roles, States, and Properties of Radio Group
    Given a radio group is present on the page
    Then the radio group should have role 'radiogroup'
    And each radio button should have role 'radio'
    And each radio button should have 'aria-checked' set to true or false
    And each radio button should be labeled by its content, 'aria-labelledby', or 'aria-label'
    And the radiogroup should be labeled by 'aria-labelledby' or 'aria-label'
    If additional information is provided for the radio group or buttons
    Then 'aria-describedby' should reference the elements providing that information
