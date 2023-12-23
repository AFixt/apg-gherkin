Feature: Button Interaction and Accessibility

  As a user of a website with button widgets
  I want to be able to activate buttons using keyboard and understand their state
  So that I can interact with the site effectively

  Scenario: Activating a Button
    Given a button is present on the page
    When I focus on the button
    And press 'Enter' or 'Space'
    Then the button should be activated

  Scenario: Activating a Button and Managing Focus After Activation
    Given a button is present on the page
    When I activate the button
    Then focus should be set according to the type of action the button performs
    Examples:
      | Button Action       | Focus After Activation                          |
      | Opens a dialog      | Inside the dialog                               |
      | Closes a dialog     | Button that opened the dialog or a new context  |
      | Does not dismiss    | Remains on the button                           |
      | Indicates context   | Starting point for the new action               |

  Scenario: Using a Toggle Button
    Given a toggle button is present on the page
    When I press the toggle button
    Then the button's aria-pressed state should reflect its current state
    And the label on the toggle button does not change
    Examples:
      | Button Label | Aria-Pressed State |
      | Mute         | true               |
      | Mute         | false              |

  Scenario: Using a Menu Button
    Given a menu button is present on the page
    When I focus on the menu button
    Then it should have the property aria-haspopup set to either 'menu' or 'true'

  Scenario: Button Accessibility
    Given a button is present on the page
    Then it should have a role of 'button'
    And it should have an accessible label
    And if disabled, it should have aria-disabled set to 'true'
    And if it has a detailed description, it should use aria-describedby

  Scenario: Activating a Button with Shortcut Key
    Given a button with a shortcut key is present
    When I use the shortcut key
    Then the button should be activated
    And the focus should remain in the context from which the shortcut key was activated
