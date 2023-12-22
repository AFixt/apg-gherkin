Feature: Meter Display and Accessibility

  As a user of the website
  I want meters to display numeric values accurately
  So that I can understand the represented information effectively

  Background:
    Given a meter is implemented on a web page
    And the meter conforms to the WAI-ARIA Meter Pattern guidelines

  Scenario: Displaying Current Value of the Meter
    Given the meter represents a numeric value within a defined range
    Then the meter should have aria-valuenow set to a decimal value representing the current value
    And the current value should be between aria-valuemin and aria-valuemax

  Scenario: Setting Minimum and Maximum Values of the Meter
    Given the meter has a defined range
    Then aria-valuemin should be set to the minimum decimal value of the range
    And aria-valuemax should be set to the maximum decimal value of the range

  Scenario: Conveying the Meter Value in User-Friendly Terms
    Given the meter value needs user-friendly interpretation
    Then aria-valuetext should be set to a string that makes the meter value understandable
    Examples could include "50% (6 hours) remaining" for a battery meter

  Scenario: Providing an Accessible Label for the Meter
    Given the meter has a visible label
    Then it should be referenced by aria-labelledby on the element with role meter
    Otherwise, the element with role meter should have a label provided by aria-label
