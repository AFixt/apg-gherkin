Feature: Slider Interaction and Accessibility

  As a user of the website
  I want the slider to be interactable and accessible
  So that I can select a value within a given range efficiently

  Background:
    Given a slider is implemented on a web page
    And the slider conforms to the Slider Pattern guidelines

  Scenario: Adjusting Slider Value with Keyboard
    Given the slider is focusable
    When I press 'Right Arrow' or 'Up Arrow'
    Then the slider value should increase by one step
    When I press 'Left Arrow' or 'Down Arrow'
    Then the slider value should decrease by one step
    When I press 'Home'
    Then the slider should set to its minimum value
    When I press 'End'
    Then the slider should set to its maximum value
    When I press 'Page Up' (Optional)
    Then the slider value should increase by a larger step than the arrow keys
    When I press 'Page Down' (Optional)
    Then the slider value should decrease by a larger step than the arrow keys

  Scenario: Accessibility Features of the Slider
    Given a slider is present on the page
    Then it should have the role 'slider'
    And it should have 'aria-valuenow' set to the current value
    And 'aria-valuemin' set to the minimum allowed value
    And 'aria-valuemax' set to the maximum allowed value
    And 'aria-valuetext' set if the value is not user-friendly
    And it should have an accessible label provided by 'aria-labelledby' or 'aria-label'
    If the slider is vertically oriented
    Then it should have 'aria-orientation' set to vertical

  Scenario: User-Friendly Value Representation
    Given the slider represents values that are not inherently user-friendly
    Then the slider should use 'aria-valuetext' to provide a comprehensible representation of the value
