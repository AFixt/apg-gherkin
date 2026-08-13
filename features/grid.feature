Feature: Grid Interaction and Accessibility

  As a user of a website with a grid widget
  I want to be able to navigate and interact with grid cells using keyboard
  So that I can efficiently access and modify data in a tabular format

  Background:
    Given a grid widget is implemented on a web page
    And it conforms to the Grid Pattern guidelines for data or layout grids

  Scenario: Navigating Cells in a Data Grid
    Given a data grid is present on the page
    When I press 'Tab' key
    Then focus should move into the grid on the first cell
    When I press 'Right Arrow' key
    Then focus moves one cell to the right
    When I press 'Left Arrow' key
    Then focus moves one cell to the left
    When I press 'Down Arrow' key
    Then focus moves one cell down
    When I press 'Up Arrow' key
    Then focus moves one cell up
    When I press 'Home' key
    Then focus moves to the first cell in the current row
    When I press 'End' key
    Then focus moves to the last cell in the current row
    When I press 'Page Down' key
    Then focus moves down an author-determined number of rows
    When I press 'Page Up' key
    Then focus moves up an author-determined number of rows
    When I press 'Control' + 'Home' keys
    Then focus moves to the first cell in the first row
    When I press 'Control' + 'End' keys
    Then focus moves to the last cell in the last row

  Scenario: Selecting Cells, Rows, and Columns in a Grid
    Given a grid with selection capabilities is present
    When I press 'Control' + 'Space'
    Then the entire column containing the focus is selected
    When I press 'Shift' + 'Space'
    Then the entire row containing the focus is selected
    When I press 'Control' + 'A'
    Then all cells in the grid are selected
    When I press 'Shift' + 'Right Arrow', 'Shift' + 'Left Arrow', 'Shift' + 'Down Arrow', or 'Shift' + 'Up Arrow'
    Then the selection is extended by one cell in the direction of the arrow key

  Scenario: Accessibility Features of Grid
    Given a grid is present on the page
    Then it should have the role 'grid'
    And each row should have the role 'row'
    And each cell should have the role 'columnheader', 'rowheader', or 'gridcell'
    And it should have an accessible name provided by 'aria-labelledby' or 'aria-label'
    If the grid has a caption or description
    Then 'aria-describedby' should be set on the grid element
    If the grid provides sort functions
    Then 'aria-sort' should be set to an appropriate value on the header cell element
    If the grid supports selection
    Then each selected element should have 'aria-selected' set to true
    If the grid provides content editing functionality
    Then 'aria-readonly' may be set to true on cells where editing is disabled
    If some rows or columns are hidden
    Then 'aria-colcount' or 'aria-rowcount' should be set to the total number, and 'aria-colindex' or 'aria-rowindex' should be set to the position of a cell
    If the grid includes cells that span multiple rows or columns
    Then 'aria-rowspan' or 'aria-colspan' should be applied

  Scenario: Grid Keyboard Interaction for Editing and Navigation Inside Cells
    Given a grid with editable cells is present
    When I press 'Enter' on a focused cell
    Then grid navigation is disabled
    And focus is placed inside the cell for editing
    When I press 'F2' on a focused cell
    Then grid navigation is disabled
    And focus is placed inside the cell for editing
    When I press 'F2' again
    Then grid navigation is restored
    When I press an alphanumeric key on a focused cell containing editable content
    Then focus is placed in the input field for editing
    When I press 'Escape' during editing
    Then grid navigation is restored
    And optionally any edits made in the cell are undone
    When I press 'Tab' while grid navigation is disabled
    Then focus moves to the next widget in the grid

  Scenario: Layout Grid Navigation
    Given a layout grid is present on the page
    When I navigate using 'Right Arrow', 'Left Arrow', 'Down Arrow', and 'Up Arrow' keys
    Then focus should move appropriately between the cells
    And optionally wrap around in the grid
