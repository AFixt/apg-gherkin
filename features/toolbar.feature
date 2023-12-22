Feature: Toolbar Interaction and Accessibility

  As a user of the website
  I want toolbars to be interactable and accessible
  So that I can efficiently use the grouped controls within the toolbar

  Background:
    Given a toolbar is implemented on a web page
    And the toolbar conforms to the Toolbar Pattern guidelines

  Scenario: Keyboard Navigation into and out of the Toolbar
    Given the toolbar is present on the page
    When I press 'Tab' or 'Shift + Tab'
    Then focus should move into and out of the toolbar
    And when focus moves into the toolbar for the first time, it should be set on the first non-disabled control
    And if the toolbar has previously contained focus, it should optionally return to the control that last had focus

  Scenario: Navigating Between Controls in a Horizontal Toolbar
    Given the toolbar is horizontal
    When I press 'Left Arrow'
    Then focus should move to the previous control
    And focus movement may optionally wrap from the first to the last element
    When I press 'Right Arrow'
    Then focus should move to the next control
    And focus movement may optionally wrap from the last to the first element
    When I press 'Home' (optional)
    Then focus should move to the first element
    When I press 'End' (optional)
    Then focus should move to the last element

  Scenario: Navigating Between Controls in a Vertical Toolbar
    Given the toolbar is vertical
    When I press 'Up Arrow'
    Then focus should move to the previous control
    And focus movement may optionally wrap from the first to the last element
    When I press 'Down Arrow'
    Then focus should move to the next control
    And focus movement may optionally wrap from the last to the first element

  Scenario: Handling Disabled Controls in the Toolbar
    Given the toolbar contains disabled controls
    Then disabled controls may be focusable for discoverability by screen reader users

  Scenario: Quick Access to the Toolbar
    Given the application requires quick access to the toolbar
    Then a documented shortcut key should be provided
    And it should move focus from the relevant context to its corresponding toolbar

  Scenario: WAI-ARIA Roles, States, and Properties of the Toolbar
    Given a toolbar is present on the page
    Then the toolbar container should have role 'toolbar'
    And if the toolbar has a visible label, it should be referenced by 'aria-labelledby' on the toolbar element
    Otherwise, the toolbar should have a label provided by 'aria-label'
    And if the controls are arranged vertically, the toolbar should have 'aria-orientation' set to 'vertical'
