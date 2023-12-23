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

  Scenario: Accessibility Features of Grid
    Given a grid is present on the page
    Then it should have the role 'grid'
    And each row should have the role 'row'
    And each cell should have an appropriate role based on its content

  Scenario: Grid Keyboard Interaction for Editing and Navigation Inside Cells
    Given a grid with editable cells is present
    When I press 'Enter' on a focused cell
    Then grid navigation is disabled
    And focus is placed inside the cell for editing
    When I press 'Escape' during editing
    Then editing is cancelled
    And grid navigation is restored

  Scenario: Layout Grid Navigation
    Given a layout grid is present on the page
    When I navigate using 'Right Arrow', 'Left Arrow', 'Down Arrow', and 'Up Arrow' keys
    Then focus should move appropriately between the cells
    And optionally wrap around in the grid
