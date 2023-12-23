Feature: Link Interaction and Accessibility

  As a user of the website
  I want links to be interactable and accessible
  So that I can navigate to different resources easily

  Background:
    Given a link is implemented on a web page
    And the link conforms to the Link Pattern guidelines

  Scenario: Executing the Link and Navigating to the Target Resource
    Given the link is focusable
    When I press 'Enter' on the link
    Then the link should execute and navigate to the link target

  Scenario: Opening a Context Menu for the Link (Optional)
    Given the link is focusable
    When I press 'Shift + F10' on the link
    Then a context menu for the link should open

  Scenario: Accessibility Features of the Link
    Given a link is present on the page
    Then the element containing the link text or graphic should have the role 'link'
