Feature: Modal Dialog Accessibility and Interaction

  As a user of the website
  I want modal dialogs to be accessible and interactable
  So that I can effectively use the website regardless of my input method or assistive technology

  Background:
    Given a modal dialog is implemented on a web page
    And the dialog conforms to ARIA Authoring Practices Guide

  Scenario: Opening a Modal Dialog
    When a modal dialog is triggered to open
    Then focus should move to an element inside the dialog
    And the content outside the modal dialog should become inert
    And the inert content should be visually obscured or dimmed

  Scenario: Navigating Inside the Modal Dialog
    Given the modal dialog is open
    When I press 'Tab'
    Then focus should move to the next tabbable element inside the dialog
    When I press 'Shift + Tab'
    Then focus should move to the previous tabbable element inside the dialog
    And if focus is on the last or first tabbable element, it should cycle to the beginning or end respectively

  Scenario: Closing the Modal Dialog with Escape Key
    Given the modal dialog is open
    When I press 'Escape'
    Then the dialog should close
    And focus should return to the element that invoked the dialog

  Scenario: ARIA Roles, States, and Properties of the Modal Dialog
    Given the modal dialog is implemented
    Then the dialog container should have a role of 'dialog'
    And the dialog should have 'aria-modal' set to true
    And the dialog should have 'aria-labelledby' or 'aria-label' set
    Optionally, 'aria-describedby' may be set depending on content complexity

  Scenario: Ensuring Return Focus After Dialog Closure
    Given the modal dialog is closed
    Then focus should return to the invoking element unless specific workflow conditions apply
    And if the invoking element no longer exists, focus should move to a logical workflow element

  Scenario: Inclusion of a Close Button in the Tab Sequence
    Given the modal dialog is open
    Then the tab sequence should include a visible element that closes the dialog

  Scenario: Handling Complex Content in Modal Dialogs
    Given the modal dialog contains complex semantic structures
    Then 'tabindex' should be set appropriately on static elements for initial focus
    And 'aria-describedby' should be omitted if it complicates the understanding of the content
