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
    And if a rotation control is present, it should be the first element in the Tab sequence inside the carousel
    And activating the rotation control, next slide control, or previous slide control should not move focus
    And automatic slide rotation should stop when any element in the carousel receives keyboard focus
    And it should not resume unless the user activates the rotation control

  Scenario: ARIA Roles, States, and Properties of Carousel Elements
    Given a carousel is present on the page
    Then the carousel container should have role 'region' or 'group' and 'aria-roledescription' set to 'carousel'
    And the carousel container should have an accessible name provided by 'aria-labelledby' or 'aria-label'
    And the accessible name of the carousel container should not contain the word 'carousel', since 'aria-roledescription' already supplies it
    And each slide should have role 'group' or 'tabpanel' with 'aria-roledescription' set to 'slide'
    And each slide should have an accessible name provided by 'aria-labelledby' or 'aria-label'
    And rotation control, next slide control, and previous slide control should implement the button pattern
    Optionally, an element wrapping the set of slide elements may have 'aria-atomic' set to false and 'aria-live' set to 'off' when the carousel is automatically rotating or 'polite' when it is not

  Scenario: Selecting a Specific Slide
    Given the carousel has slide picker controls
    When I activate a specific slide picker control
    Then the corresponding slide should be displayed
    And the picker control for the currently displayed slide should have 'aria-disabled' set to true

  Scenario: Tabbed Carousel
    Given a tabbed carousel is present on the page
    Then each slide container should have role 'tabpanel' instead of role 'group'
    And each slide container should not have the 'aria-roledescription' property
    And each slide picker control should be a 'tab' element that displays its associated slide when activated
    And the accessible name of each 'tab' should indicate which slide it will display by including the name or number of the slide, for example 'Slide 3'
    And the set of controls should be grouped in a 'tablist' element
    And the 'tablist' should have an accessible name provided by 'aria-label' that identifies the purpose of the tabs, for example 'Choose slide to display'
    And the 'tab' elements should implement the properties specified in the Tabs Pattern

  Scenario: Grouped Carousel
    Given a grouped carousel is present on the page
    Then the set of slide picker controls should be contained in an element with role 'group'
    And the group containing the picker controls should have an accessible label provided by 'aria-label' that identifies the purpose of the controls, for example 'Choose slide to display'
    And each picker control should be a 'button' element
    And the accessible name of each picker button should match the name of the slide it displays
    And the picker button for the currently displayed slide should have 'aria-disabled' set to true

  Scenario: Automatic Rotation Control
    Given the carousel has automatic rotation
    When the mouse is hovering over the carousel
    Or keyboard focus enters the carousel
    Then the automatic rotation should stop
    And it should not restart unless the user explicitly requests it to do so
