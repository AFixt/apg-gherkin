Feature: Checkbox Interaction and Accessibility

  As a user of the website
  I want checkboxes to be interactable and accessible
  So that I can make selections effectively

  Background:
    Given a checkbox is implemented on a web page
    And the checkbox conforms to the WAI-ARIA Checkbox Pattern guidelines

  Scenario: Interacting with a Dual-State Checkbox
    Given the checkbox is dual-state
    When I focus on the checkbox and press the Space key
    Then the state of the checkbox should toggle between checked and not checked

  Scenario: Interacting with a Tri-State Checkbox
    Given the checkbox is tri-state
    When I focus on the checkbox and press the Space key
    Then the state of the checkbox should cycle through checked, partially checked, and not checked

  Scenario: Displaying Checkbox States
    Given a group of checkboxes is controlled by a tri-state checkbox
    When all checkboxes in the group are checked
    Then the tri-state checkbox should display as checked
    When some checkboxes in the group are checked
    Then the tri-state checkbox should display as partially checked
    When none of the checkboxes in the group are checked
    Then the tri-state checkbox should display as not checked

  Scenario: Changing Checkbox States in a Group
    Given a group of checkboxes is controlled by a tri-state checkbox
    When I check the tri-state checkbox
    Then all checkboxes in the group should become checked
    When I uncheck the tri-state checkbox
    Then all checkboxes in the group should become unchecked
    When the tri-state checkbox is partially checked
    And I activate the tri-state checkbox
    Then the checkboxes in the group should return to the last partially checked state

  Scenario: WAI-ARIA Roles, States, and Properties of the Checkbox
    Given a checkbox is present on the page
    Then it should have the role 'checkbox'
    And it should have an accessible label provided by visible text, 'aria-labelledby', or 'aria-label'
    And its state should be represented by 'aria-checked' set to true, false, or mixed
    If the checkbox is part of a logical group
    Then the group should have role 'group' and 'aria-labelledby' set to the label's ID
    If there is descriptive text for the checkbox or group
    Then 'aria-describedby' should be set to the ID of the element containing the description
