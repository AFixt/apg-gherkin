# NOTE: The APG Tooltip page is explicitly labelled work-in-progress and has not
# reached task force consensus, so this pattern is expected to churn. Scenarios
# here are limited to what that page currently states; anything not sourced from
# it has been removed rather than inferred.
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
    And the tooltip should not receive focus or be in the tabbing order

  Scenario: Choosing Between a Tooltip and a Non-Modal Dialog
    Given a popup needs to contain focusable content
    Then the tooltip pattern should not be used for it
    And the non-modal dialog pattern should be used instead
