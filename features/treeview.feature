Feature: Tree View Interaction and Accessibility

  As a user of the website
  I want the tree view to be interactable and accessible
  So that I can navigate and interact with hierarchical lists efficiently

  Background:
    Given a tree view is implemented on a web page
    And the tree view conforms to the WAI-ARIA Tree View Pattern guidelines

  Scenario: Initial Focus in Single-Select and Multi-Select Trees
    Given the tree view is either single-select or multi-select
    When the tree view receives focus
    Then focus should be set on the first node if none are selected
    And focus should be set on the selected node if one is already selected

  Scenario: Keyboard Navigation in the Tree View
    Given the tree view allows keyboard navigation
    When I press 'Right Arrow'
    Then focus should open a closed node or move to the first child node
    When I press 'Left Arrow'
    Then focus should close an open node or move to the parent node
    When I press 'Down Arrow'
    Then focus should move to the next node
    When I press 'Up Arrow'
    Then focus should move to the previous node
    When I press 'Home'
    Then focus should move to the first node
    When I press 'End'
    Then focus should move to the last node

  Scenario: Type-Ahead Functionality in the Tree View
    Given the tree view has type-ahead functionality
    When I type a character
    Then focus should move to the next node starting with that character
    When I type multiple characters in rapid succession
    Then focus should move to the next node starting with the string of characters typed

  Scenario: Optional Keyboard Interactions for Expanding All Siblings
    Given the tree view supports expanding all siblings
    When I press '*'
    Then it should expand all siblings at the same level as the current node

  Scenario: Selection Models in Multi-Select Trees
    Given the tree view is multi-select
    When I use selection keys like 'Space', 'Shift + Arrow Keys', or 'Control + A'
    Then it should select or unselect nodes as per the tree view's functionality

  Scenario: WAI-ARIA Roles, States, and Properties of the Tree View
    Given a tree view is present on the page
    Then the tree container should have role 'tree'
    And each tree node should have role 'treeitem'
    And parent nodes should have 'aria-expanded' set as per their state
    And 'aria-multiselectable', 'aria-selected', 'aria-checked', 'aria-labelledby', 'aria-label', 'aria-level', 'aria-setsize', 'aria-posinset', 'aria-orientation' should be used as per the tree view's features
