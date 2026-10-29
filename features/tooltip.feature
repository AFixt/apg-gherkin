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

  # The APG states dismissal conditionally on how the tooltip was invoked, rather
  # than as a single rule: a focus-invoked tooltip is dismissed on blur, while a
  # hover-invoked one persists as long as the cursor is over the trigger or the
  # tooltip. The two scenarios below are those alternatives, not a sequence.
  Scenario: Dismissing a Focus-Invoked Tooltip
    Given a tooltip was invoked by its trigger element receiving keyboard focus
    When the trigger element no longer has focus
    Then the tooltip should be dismissed

  Scenario: Dismissing a Hover-Invoked Tooltip
    Given a tooltip was invoked by a pointing cursor moving over its trigger element
    Then the tooltip should remain open while the cursor is over the trigger element
    And it should remain open while the cursor is over the tooltip itself
    And it should be dismissed once the cursor is over neither

  Scenario: Closing Tooltip with Escape Key
    Given a tooltip is currently visible
    When the user presses the 'Escape' key
    Then the tooltip should disappear

  Scenario: Tooltip Accessibility Features
    Given a tooltip is associated with an element
    Then the tooltip should have role="tooltip"
    And the owning element should reference the tooltip with 'aria-describedby'
    And the tooltip should not receive focus or be in the tabbing order
    And focus should stay on the triggering element while the tooltip is displayed

  # Inferred, not stated: the APG offers the non-modal dialog as an available
  # alternative ("a hover that contains focusable elements can be made using a
  # non-modal dialog") rather than prohibiting tooltips outright. The prohibition
  # below follows from the pattern's own focus rules — a tooltip never receives
  # focus and focus stays on the trigger, so focusable content inside one is
  # unreachable. Becomes a direct assertion if the consensus pattern states it.
  Scenario: Choosing Between a Tooltip and a Non-Modal Dialog
    Given a popup needs to contain focusable content
    Then the tooltip pattern should not be used for it
    And the non-modal dialog pattern should be used instead
