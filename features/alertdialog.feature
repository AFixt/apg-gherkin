Feature: Alert Dialog

  As a user of a website or application
  I want to be clearly informed of important messages and required actions
  So that I can understand the message and take necessary actions

  Background: 
    Given an alert dialog is present on the page

  Scenario: Alert Dialog Role and Properties
    Then the alert dialog should have a role of 'alertdialog'
    And it should contain elements including the alert message and dialog buttons

  Scenario: Labeling the Alert Dialog
    Given the alert dialog has a visible label
    Then it should have 'aria-labelledby' attribute referring to the dialog title element
    But if the alert dialog does not have a visible label
    Then it should have 'aria-label' attribute providing an accessible name

  Scenario: Describing the Alert Dialog Content
    Then the element with role 'alertdialog' should have 'aria-describedby' set
    And 'aria-describedby' should refer to the element containing the alert message

  Scenario: Keyboard Interaction with Alert Dialog
    Given the alert dialog is open
    Then it should follow the keyboard interaction pattern of a modal dialog
    And allow users to interact with it using keyboard controls

  Scenario: Interrupting User Workflow
    When the alert dialog opens
    Then it should interrupt the user's workflow
    And communicate an important message requiring a response

  Scenario: Special Treatment for Alert Dialogs
    Then assistive technologies and browsers may give special treatment to the alert dialog
    Such as playing a system alert sound
