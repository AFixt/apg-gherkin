Feature: Tooltip Display and Accessibility

  As a user of the website
  I want tooltips to provide contextual information
  So that I can understand the elements better without direct interaction

  Background:
    Given a tooltip is implemented on a web page
    And the tooltip conforms to the ARIA: tooltip role guidelines

  Scenario: Displaying Tooltip on Focus or Hover
    Given an element has an associated tooltip
    When the element receives keyboard focus or pointer hover
    Then the tooltip should become visible automatically after a brief delay

  Scenario: Hiding Tooltip on Focus Loss or Pointer Exit
    Given a tooltip is currently visible
    When the focus is moved away from the element or the pointer is moved away
    Then the tooltip should automatically disappear
    And it should remain visible if the pointer moves over the tooltip itself

  Scenario: Closing Tooltip with Escape Key
    Given a tooltip is currently visible
    When the user presses the 'Escape' key
    Then the tooltip should disappear

  Scenario: Tooltip Accessibility Features
    Given a tooltip is associated with an element
    Then the tooltip should have role="tooltip"
    And the owning element should reference the tooltip with 'aria-describedby'
    And the tooltip should not contain any interactive content
    And the tooltip should not receive focus or be in the tabbing order

  Scenario: Tooltip Visibility and Positioning
    Given a tooltip is associated with an element
    When the tooltip is triggered to appear
    Then it should be positioned appropriately relative to the owning element
    And should be styled for visibility

  Scenario: Implementing Tooltip with JavaScript and CSS
    Given a tooltip is implemented using JavaScript and CSS
    Then JavaScript should handle the display and hiding of the tooltip
    And CSS should define the tooltip's visibility and positioning
    And the tooltip should be hidden by default unless triggered by focus or hover

  Scenario: Accessibility Concerns with Tooltip Information
    Given a tooltip contains important information
    Then consider whether this information should also be available as visible text
    And ensure the tooltip follows accessibility guidelines to remain persistent when needed
