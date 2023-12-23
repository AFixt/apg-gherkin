Feature: Alert Widget

  As a user of a website or application
  I want to receive important and time-sensitive information
  So that I can be informed without interruption to my current task

  Scenario: Alert Role and Accessibility
    Given an alert is present on the page
    Then the alert should have a role of 'alert'
    And the alert should be automatically announced by most screen readers
    And it should not trigger a change in keyboard focus

  Scenario: Alert Appearance and Behavior
    Given an alert appears on the page
    Then it should attract the user's attention without interrupting their task
    And the alert should not disappear automatically
    And it should remain on the page until acknowledged or dismissed by the user

  Scenario: Alert Content and Importance
    Given an alert conveys a message
    Then the message should be brief and important
    And the alert should provide potentially time-sensitive information

  Scenario: Alert Design Considerations
    Then the alert should not be designed to disappear quickly
    And the frequency of alerts should not cause frequent interruptions
    And the design should consider usability for people with visual and cognitive disabilities

  Scenario: Alert on Page Load
    Given the page has completed loading
    When an alert is present
    Then it should be announced by screen readers
    But screen readers should not announce alerts present before the page load completes
