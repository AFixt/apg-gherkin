Feature: Table Display and Accessibility

  As a user of the website
  I want tables to display information accurately
  So that I can understand and interact with the content effectively

  Background:
    Given a table is implemented on a web page
    And the table conforms to the WAI-ARIA Table Pattern guidelines

  Scenario: Table Structure and Role Assignments
    Given the table is a static structure
    Then the table container should have role 'table'
    And each row container should have role 'row'
    And each cell should have role 'columnheader', 'rowheader', or 'cell' based on its content

  Scenario: Labelling and Describing the Table
    Given the table has an associated label or description
    When the table has a visible label
    Then 'aria-labelledby' should be set on the table with a value referring to the label element
    When the table has a caption or description
    Then 'aria-describedby' should be set on the table with a value referring to the description element

  Scenario: Handling Sortable Columns or Rows
    Given the table has sortable columns or rows
    Then 'aria-sort' should be set on the header cell elements of sortable columns or rows

  Scenario: Managing Visibility and Presence of Rows and Columns
    Given the table has mechanisms to hide or show rows or columns
    Then 'aria-colcount' and 'aria-rowcount' should reflect the total number of columns or rows
    And 'aria-colindex' and 'aria-rowindex' should reflect the position of each cell within its row or column

  Scenario: Handling Cells Spanning Multiple Rows or Columns
    Given the table includes cells that span multiple rows or columns
    Then 'aria-rowspan' or 'aria-colspan' should be applied to those cells

  Scenario: Integration of Interactive Widgets in the Table
    Given the table contains interactive widgets
    Then each widget should be a separate stop in the page tab sequence
    And replacing the table with a grid should be considered if there are many widgets
