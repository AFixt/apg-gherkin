Feature: Treegrid Interaction and Accessibility

  As a user of the website
  I want the treegrid to be interactable and accessible
  So that I can navigate and interact with hierarchical data efficiently

  Background:
    Given a treegrid is implemented on a web page
    And the treegrid conforms to the WAI-ARIA Treegrid Pattern guidelines

  Scenario: Focus Model on Entering the Treegrid
    Given focus is moving into the treegrid
    Then focus should land on either the first cell or the first row
    And whether focus goes to a cell or to a row depends on author preference and on whether row focus is supported

  Scenario: Row Focus
    Given the treegrid supports row focus and focus is on a row
    When I press 'Right Arrow' on a collapsed row
    Then the row should expand
    When I press 'Right Arrow' on an expanded row or on a row that does not have child rows
    Then focus should move to the first cell in the row
    When I press 'Left Arrow' on an expanded row
    Then the row should collapse
    When I press 'Left Arrow' on a collapsed row or on a row that does not have child rows
    Then focus should not move
    When I press 'Down Arrow'
    Then focus should move one row down
    And if focus is on the last row, focus should not move
    When I press 'Up Arrow'
    Then focus should move one row up
    And if focus is on the first row, focus should not move

  Scenario: Cell Focus
    Given focus is on a cell within a row
    When I press 'Right Arrow'
    Then focus should move one cell to the right
    And if focus is on the right-most cell in a row, focus should not move
    When I press 'Left Arrow' on the first cell in a row and row focus is supported
    Then focus should move to the row
    When I press 'Left Arrow' on the first cell in a row and row focus is not supported
    Then focus should not move
    When I press 'Left Arrow' on any other cell
    Then focus should move one cell to the left
    When I press 'Down Arrow'
    Then focus should move one cell down
    And if focus is on the bottom cell in the column, focus should not move
    When I press 'Up Arrow'
    Then focus should move one cell up
    And if focus is on the top cell in the column, focus should not move

  Scenario: Navigating and Interacting with the Treegrid
    Given the treegrid allows navigation and interaction
    When I press 'Enter' and cell-only focus is enabled and focus is on the first cell with the 'aria-expanded' property
    Then it should open or close the child rows
    When I press 'Enter' in any other circumstance
    Then it should perform the default action for the cell
    When I press 'Tab'
    Then focus should move to the next focusable element within the row
    And if focus is on the last focusable element in the row, focus should move out of the treegrid to the next focusable element
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
    When I press 'Control + Space'
    Then the column containing the focused cell should be selected
    When I press 'Shift + Space'
    Then the row containing the focused cell should be selected
    When I press 'Shift + Down Arrow' or 'Shift + Up Arrow'
    Then selection should extend to the cell or row in that direction
    When I press 'Shift + Right Arrow' or 'Shift + Left Arrow'
    Then selection should extend to the cell in that direction
    When I press 'Control + A' (Optional)
    Then all cells or rows in the treegrid should be selected

  Scenario: aria-selected in a Single-Select Treegrid
    Given a single-select treegrid is present on the page
    Then 'aria-selected' should be set to true on the selected row or cell
    And 'aria-selected' should not be present on any other row or cell in the treegrid

  Scenario: aria-selected in a Multi-Select Treegrid
    Given a multi-select treegrid is present on the page
    Then the treegrid should have 'aria-multiselectable' set to true
    And all selected rows or cells should have 'aria-selected' set to true
    And all rows and cells that are not selected should have 'aria-selected' set to false

  Scenario: WAI-ARIA Roles, States, and Properties of the Treegrid
    Given a treegrid is present on the page
    Then the treegrid container should have role 'treegrid'
    And each row should have role 'row'
    And each row should be either a DOM descendant of or owned by the element with role 'treegrid' or an element with role 'rowgroup'
    And any element with role 'rowgroup' should itself be contained in or owned by the treegrid
    And each cell should have appropriate roles ('columnheader', 'rowheader', 'gridcell')
    And parent rows should have 'aria-expanded' set as per their state, on either the row element or a cell contained in the row
    And rows that do not control the display of child rows should not have the 'aria-expanded' attribute
    And 'aria-labelledby', 'aria-label', 'aria-describedby', 'aria-sort', 'aria-readonly', 'aria-colcount', 'aria-rowcount', 'aria-colindex', 'aria-rowindex', 'aria-rowspan', 'aria-colspan' should be used as per the treegrid's features
