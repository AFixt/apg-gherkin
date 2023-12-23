Feature: Disclosure Widget Interaction and Accessibility

  As a user of the website
  I want the disclosure widget to show or hide content effectively
  So that I can access additional information as needed

  Background:
    Given a disclosure widget is implemented on a web page
    And the disclosure widget conforms to the Disclosure (Show/Hide) Pattern guidelines

  Scenario: Toggling the Visibility of Content with Keyboard
    Given the disclosure control is focusable
    When I press 'Enter'
    Then the visibility of the disclosure content should toggle
    When I press 'Space'
    Then the visibility of the disclosure content should toggle

  Scenario: Accessibility Features of the Disclosure Control
    Given the disclosure widget is present on the page
    Then the control element should have the role 'button'
    And it should indicate the visibility state with 'aria-expanded' set to true or false
    Optionally, it should reference the content element with 'aria-controls'

  Scenario: Visual Indicators for Content Visibility
    Given the disclosure widget has a visual indicator
    When the content is hidden
    Then the indicator should suggest that activating the control will show more content
    When the content is visible
    Then the indicator should suggest that activating the control will hide the content
