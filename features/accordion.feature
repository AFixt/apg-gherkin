Feature: Accordion Interaction and Accessibility

  As a user of the website
  I want accordions to be interactable and accessible
  So that I can efficiently navigate and access content within each section

  Background:
    Given an accordion is implemented on a web page
    And the accordion conforms to the Accordion Pattern guidelines

  Scenario: Expanding and Collapsing Accordion Panels
    Given the accordion is in its default state
    When I activate an accordion header for a collapsed panel
    Then the associated panel should expand
    And if only one panel is allowed to be expanded at a time, other panels should collapse
    When I activate an accordion header for an expanded panel
    Then the panel should collapse if the implementation supports collapsing

  Scenario: Keyboard Navigation within the Accordion
    Given the accordion is in focus
    When I press 'Tab'
    Then focus should move to the next focusable element in the accordion
    When I press 'Shift + Tab'
    Then focus should move to the previous focusable element in the accordion
    When I press 'Down Arrow' and focus is on an accordion header
    Then focus should move to the next accordion header
    When I press 'Up Arrow' and focus is on an accordion header
    Then focus should move to the previous accordion header
    When I press 'Home' and focus is on an accordion header
    Then focus should move to the first accordion header
    When I press 'End' and focus is on an accordion header
    Then focus should move to the last accordion header

  Scenario: ARIA Roles, States, and Properties of Accordion Elements
    Given an accordion is present on the page
    Then each accordion header should have a role of 'button' and be wrapped in a 'heading' element
    And the 'heading' element should have an appropriate 'aria-level'
    And if an accordion panel is visible, its header button should have 'aria-expanded' set to true
    And each header button should control visibility of its associated panel and have 'aria-controls' set to the panel's ID
    And if a visible panel cannot be collapsed, its header button should have 'aria-disabled' set to true
    Optionally, each accordion panel container may have a role of 'region' and be labelled by the accordion header

  Scenario: Handling Accordions with Multiple Expandable Panels
    Given an accordion allows multiple panels to be expanded simultaneously
    Then the use of 'region' role should be avoided if it leads to landmark region proliferation
    And the 'region' role should be used judiciously, especially when panels contain headings or nested accordions
