Feature: Switch Interaction and Accessibility

  As a user of the website
  I want the switch to be interactable and accessible
  So that I can easily toggle between two states: on and off

  Background:
    Given a switch is implemented on a web page
    And the switch conforms to the Switch Pattern guidelines

  Scenario: Toggling the State of the Switch with Keyboard
    Given the switch is focusable
    When I press 'Space'
    Then the state of the switch should toggle between on and off
    When I press 'Enter' (Optional)
    Then the state of the switch should toggle between on and off

  Scenario: Accessibility Features of the Switch
    Given the switch is present on the page
    Then it should have the role 'switch'
    And it should have an accessible label provided by its content, 'aria-labelledby', or 'aria-label'
    And when in the on state, it should have 'aria-checked' set to true
    And when in the off state, it should have 'aria-checked' set to false
    If the switch is an HTML input[type="checkbox"]
    Then it should use the HTML 'checked' attribute instead of 'aria-checked'

  Scenario: Grouping Multiple Switches
    Given multiple switches are presented as a logical group
    Then the group should have role 'group' and 'aria-labelledby' set to the label's ID
    Or the group should be contained in an HTML fieldset with the label in an HTML legend element

  Scenario: Providing Additional Descriptive Information
    Given additional descriptive information is relevant to a switch or group
    Then the switch or switch group should reference the description with 'aria-describedby'
