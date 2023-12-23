Feature: Multi-Thumb Slider Interaction and Accessibility

  As a user of the website
  I want the multi-thumb slider to be interactable and accessible
  So that I can select multiple values within a given range

  Background:
    Given a multi-thumb slider is implemented on a web page
    And the multi-thumb slider conforms to the Multi-Thumb Slider Pattern guidelines

  Scenario: Adjusting Each Thumb Value with Keyboard
    Given the multi-thumb slider is focusable
    When I focus on a thumb and press 'Right Arrow' or 'Up Arrow'
    Then the focused thumb's value should increase by one step
    When I focus on a thumb and press 'Left Arrow' or 'Down Arrow'
    Then the focused thumb's value should decrease by one step
    When I focus on a thumb and press 'Home'
    Then the focused thumb should set to its minimum value
    When I focus on a thumb and press 'End'
    Then the focused thumb should set to its maximum value
    When I focus on a thumb and press 'Page Up' (Optional)
    Then the focused thumb's value should increase by a larger step than the arrow keys
    When I focus on a thumb and press 'Page Down' (Optional)
    Then the focused thumb's value should decrease by a larger step than the arrow keys

  Scenario: Maintaining Tab Order Regardless of Thumb Value
    Given the multi-thumb slider has multiple thumbs
    When the value of a thumb changes
    Then the tab order of the thumbs should remain constant
    And not be affected by their visual position within the slider

  Scenario: Accessibility Features of Each Slider Thumb
    Given multiple thumbs are present in the slider
    Then each thumb should have the role 'slider'
    And each thumb should have 'aria-valuenow' set to its current value
    And 'aria-valuemin' and 'aria-valuemax' set to the allowed value range
    And 'aria-valuetext' set if the value is not user-friendly
    And each thumb should have an accessible label provided by 'aria-labelledby' or 'aria-label'
    If a thumb's range is dependent on another thumb
    Then update 'aria-valuemin' or 'aria-valuemax' of the dependent thumb accordingly
    If the slider is vertically oriented
    Then it should have 'aria-orientation' set to vertical

  Scenario: User-Friendly Value Representation for Each Thumb
    Given the slider represents values that are not inherently user-friendly
    Then each thumb should use 'aria-valuetext' to provide a comprehensible representation of its value
