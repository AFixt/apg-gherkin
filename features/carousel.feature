Feature: Carousel Interaction and Accessibility

  As a user of the website
  I want carousels to be interactable and accessible
  So that I can view and control the carousel content easily

  Background:
    Given a carousel is implemented on a web page
    And the carousel conforms to the Carousel Pattern guidelines

  Scenario: Controlling Carousel Slide Rotation
    Given the carousel has rotation control
    When I activate the rotation control
    Then the carousel should stop or start rotating slides automatically
    And the label of the rotation control should change to indicate the current state

  Scenario: Navigating to Next and Previous Slides
    Given the carousel is in focus
    When I activate the next slide control
    Then the next slide in the sequence should be displayed
    When I activate the previous slide control
    Then the previous slide in the sequence should be displayed

  Scenario: Keyboard Interaction with Carousel
    Given the carousel has focus
    When I use 'Tab' or 'Shift + Tab'
    Then focus should move through the interactive elements of the carousel
    And automatic slide rotation should stop when any element in the carousel receives keyboard focus
    And it should not resume unless the user activates the rotation control

  Scenario: ARIA Roles, States, and Properties of Carousel Elements
    Given a carousel is present on the page
    Then the carousel container should have role 'region' or 'group' and 'aria-roledescription' set to 'carousel'
    And each slide should have role 'group' or 'tabpanel' with 'aria-roledescription' set to 'slide'
    And each slide should have an accessible name provided by 'aria-labelledby' or 'aria-label'
    And rotation control, next slide control, and previous slide control should implement the button pattern

  Scenario: Selecting a Specific Slide
    Given the carousel has slide picker controls
    When I activate a specific slide picker control
    Then the corresponding slide should be displayed
    And the picker control for the currently displayed slide should be disabled

  Scenario: Additional Carousel Types
    Given a carousel with tabbed or grouped elements
    Then the carousel should follow the specific ARIA roles, states, and properties for its type
    And tabbed carousel elements should follow the tabs pattern
    And grouped carousel elements should have picker controls with appropriate ARIA attributes

  Scenario: Automatic Rotation Control
    Given the carousel has automatic rotation
    When the mouse is hovering over the carousel
    Or keyboard focus enters the carousel
    Then the automatic rotation should stop
    And it should not restart unless the user explicitly requests it to do so
