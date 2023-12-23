Feature: Treegrid Interaction and Accessibility

  As a user of the website
  I want the treegrid to be interactable and accessible
  So that I can navigate and interact with hierarchical data efficiently

  Background:
    Given a treegrid is implemented on a web page
    And the treegrid conforms to the WAI-ARIA Treegrid Pattern guidelines

  Scenario: Navigating and Interacting with the Treegrid
    Given the treegrid allows navigation and interaction
    When I press 'Enter'
    Then it should open or close child rows if focused on a collapsible cell
    When I press 'Tab'
    Then focus should move to the next focusable element within the row
    When I press 'Right Arrow'
    Then focus should move to the right cell or expand the row if applicable
    When I press 'Left Arrow'
    Then focus should move to the left cell or collapse the row if applicable
    When I press 'Down Arrow'
    Then focus should move one row down
    When I press 'Up Arrow'
    Then focus should move one row up
    When I press 'Page Down'
    Then focus should move down a set number of rows
    When I press 'Page Up'
    Then focus should move up a set number of rows
    When I press 'Home'
    Then focus should move to the first row or cell
    When I press 'End'
    Then focus should move to the last row or cell
    When I press 'Control + Home'
    Then focus should move to the first row or to the same column in the first row
    When I press 'Control + End'
    Then focus should move to the last row or to the same column in the last row

  Scenario: Selecting Items in the Treegrid
    Given the treegrid supports selection
    When I use selection keys like 'Control + Space' or 'Shift + Space'
    Then it should select rows, cells, or columns as per the treegrid's functionality

  Scenario: WAI-ARIA Roles, States, and Properties of the Treegrid
    Given a treegrid is present on the page
    Then the treegrid container should have role 'treegrid'
    And each row should have role 'row'
    And each cell should have appropriate roles ('columnheader', 'rowheader', 'gridcell')
    And parent rows should have 'aria-expanded' set as per their state
    And 'aria-selected', 'aria-multiselectable', 'aria-labelledby', 'aria-label', 'aria-describedby', 'aria-sort', 'aria-readonly', 'aria-colcount', 'aria-rowcount', 'aria-colindex', 'aria-rowindex', 'aria-rowspan', 'aria-colspan' should be used as per the treegrid's features
