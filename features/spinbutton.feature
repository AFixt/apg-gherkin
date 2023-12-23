Feature: Spinbutton Interaction and Accessibility

  As a user of the website
  I want the spinbutton to be interactable and accessible
  So that I can select a value from a defined range efficiently

  Background:
    Given a spinbutton is implemented on a web page
    And the spinbutton conforms to the Spinbutton Pattern guidelines

  Scenario: Increasing and Decreasing Value with Keyboard
    Given the spinbutton is focusable
    When I press 'Up Arrow'
    Then the spinbutton value should increase
    When I press 'Down Arrow'
    Then the spinbutton value should decrease
    When I press 'Page Up' (Optional)
    Then the spinbutton value should increase by a larger step
    When I press 'Page Down' (Optional)
    Then the spinbutton value should decrease by a larger step
    When I press 'Home'
    Then the spinbutton value should set to its minimum if it has a known minimum
    When I press 'End'
    Then the spinbutton value should set to its maximum if it has a known maximum

  Scenario: Directly Editing the Spinbutton Value
    Given the spinbutton allows direct text editing
    When I type valid characters
    Then the spinbutton value should change accordingly
    And only allowed characters should be accepted

  Scenario: Accessibility Features of the Spinbutton
    Given a spinbutton is present on the page
    Then it should have the role 'spinbutton'
    And it should have 'aria-valuenow' set to the current value
    And 'aria-valuemin' should be set if it has a known minimum
    And 'aria-valuemax' should be set if it has a known maximum
    And 'aria-valuetext' should be set if the value is not user-friendly
    And it should have an accessible label provided by 'aria-labelledby' or 'aria-label'
    And 'aria-invalid' should be set to true if the value is outside the allowed range

  Scenario: Handling Invalid Input
    Given the spinbutton has a defined value range
    When I input a value outside of this range
    Then the spinbutton should indicate this is an invalid value
    And prevent the input of invalid values where practical
