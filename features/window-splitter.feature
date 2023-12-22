Feature: Window Splitter Interaction and Accessibility

  As a user of the website
  I want the window splitter to be interactable and accessible
  So that I can adjust the size of window panes according to my preference

  Background:
    Given a window splitter is implemented on a web page
    And the window splitter conforms to the Window Splitter Pattern guidelines

  Scenario: Adjusting Window Panes Using a Vertical Splitter
    Given the window splitter is vertical
    When I press 'Left Arrow'
    Then the splitter should move to the left, adjusting the pane sizes accordingly
    When I press 'Right Arrow'
    Then the splitter should move to the right, adjusting the pane sizes accordingly

  Scenario: Adjusting Window Panes Using a Horizontal Splitter
    Given the window splitter is horizontal
    When I press 'Up Arrow'
    Then the splitter should move up, adjusting the pane sizes accordingly
    When I press 'Down Arrow'
    Then the splitter should move down, adjusting the pane sizes accordingly

  Scenario: Collapsing and Restoring the Primary Pane
    Given the window splitter is focusable
    When I press 'Enter'
    Then the primary pane should collapse if it is not already collapsed
    And the splitter should restore to its previous position if the pane is collapsed

  Scenario: Moving Splitter to Minimum and Maximum Positions
    Given the window splitter is focusable
    When I press 'Home' (optional)
    Then the splitter should move to the position that gives the primary pane its smallest allowed size
    When I press 'End' (optional)
    Then the splitter should move to the position that gives the primary pane its largest allowed size

  Scenario: Cycling Through Window Panes
    Given the window splitter is part of multiple window panes
    When I press 'F6' (optional)
    Then the focus should cycle through the window panes

  Scenario: WAI-ARIA Roles, States, and Properties of the Window Splitter
    Given a window splitter is present on the page
    Then the splitter should have role 'separator'
    And the splitter should have 'aria-valuenow', 'aria-valuemin', and 'aria-valuemax' properties set to represent its position
    And if the primary pane has a visible label, it should be referenced by 'aria-labelledby' on the separator
    Otherwise, the separator should have a label provided by 'aria-label'
    And the separator should have 'aria-controls' referring to the primary pane
