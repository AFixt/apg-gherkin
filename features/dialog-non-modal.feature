# NOTE: This is an AFixt extension, not an APG pattern. The APG pattern index
# publishes only Dialog (Modal); the normative statements about non-modal dialogs
# appear in the About section of that pattern's page. Scenarios here are derived
# from those statements and from the Dialog (Modal) pattern where it applies.
Feature: Non-Modal Dialog Interaction and Accessibility

  As a user of a website
  I want non-modal dialogs to be accessible and usable
  So that I can interact with dialog content while still accessing the rest of the page

  Background:
    Given a non-modal dialog is implemented on a web page
    And the dialog conforms to the Dialog (Modal) Pattern guidelines except where they are specific to modality

  Scenario: Opening the Non-Modal Dialog
    Given a trigger element for the dialog is present
    When I activate the trigger element
    Then the non-modal dialog should open
    And focus should move to an element inside the dialog
    And focus should be placed on the first focusable element or the element most relevant to the task

  Scenario: Non-Modal Dialog Does Not Block Page Interaction
    Given the non-modal dialog is open
    Then the user should still be able to interact with content outside the dialog
    And content outside the dialog should not be marked as inert
    And the rest of the page should remain operable

  Scenario: Keyboard Interaction - Tab Within Dialog
    Given the non-modal dialog is open
    When I press 'Tab'
    Then focus should move to the next focusable element in the dialog
    And if the last focusable element in the dialog is reached, focus should move to the first focusable element in the dialog
    When I press 'Shift + Tab'
    Then focus should move to the previous focusable element in the dialog
    And if the first focusable element in the dialog is reached, focus should move to the last focusable element in the dialog

  Scenario: Moving Focus Out of the Non-Modal Dialog Without Closing It
    Given the non-modal dialog is open
    Then the dialog should provide a means of moving keyboard focus outside the dialog without closing it
    And that means should be something other than 'Tab' or 'Shift + Tab', since the dialog contains its own tab sequence
    And the dialog should remain open when focus moves outside it

  Scenario: Closing the Non-Modal Dialog with Escape
    Given the non-modal dialog is open
    When I press 'Escape'
    Then the dialog should close
    And focus should return to the element that invoked the dialog

  Scenario: Closing the Non-Modal Dialog via Close Button
    Given the non-modal dialog is open and contains a close button
    When I activate the close button
    Then the dialog should close
    And focus should return to the element that invoked the dialog

  Scenario: Focus Return When Trigger Is Removed
    Given the non-modal dialog is open
    And the element that triggered the dialog is no longer in the DOM
    When the dialog is closed
    Then focus should move to a logical position in the page

  Scenario: WAI-ARIA Roles, States, and Properties
    Given a non-modal dialog is present on the page
    Then it should have a role of 'dialog'
    And it should not have 'aria-modal' set to true
    And it should have an accessible name via 'aria-labelledby' referring to the dialog title or 'aria-label'
    Optionally the dialog may have 'aria-describedby' referring to elements describing the dialog purpose

  Scenario: Multiple Non-Modal Dialogs
    Given multiple non-modal dialogs can be open simultaneously
    Then each dialog should have a unique accessible name
    And focus management should allow the user to move between dialogs and the main page
