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
    And in a multi-select tree, focus should be set on the first selected node if one or more nodes are selected

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
    When I press 'Enter'
    Then the focused node should be activated, performing its default action

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

  # The APG defines two multi-select interaction models for trees and presents them
  # as an author's choice. The first, below, is the recommended model and does not
  # require modifier keys. The alternative model requires modifier keys to maintain
  # a selection. An implementation adopts one model or the other.
  Scenario: Multi-Select Tree - Recommended Model
    Given the tree view is multi-select
    And the tree uses the recommended model that does not require modifier keys
    When I press 'Space'
    Then the selection state of the focused node should toggle
    When I press 'Shift + Down Arrow' (Optional)
    Then focus should move to the next node and its selection state should toggle
    When I press 'Shift + Up Arrow' (Optional)
    Then focus should move to the previous node and its selection state should toggle
    When I press 'Shift + Space' (Optional)
    Then contiguous nodes from the most recently selected node to the focused node should be selected
    When I press 'Control + Shift + Home' (Optional)
    Then the focused node and all nodes up to the first node should be selected
    When I press 'Control + Shift + End' (Optional)
    Then the focused node and all nodes down to the last node should be selected
    When I press 'Control + A' (Optional)
    Then all nodes in the tree should be selected

  Scenario: Multi-Select Tree - Alternative Model
    Given the tree view is multi-select
    And the tree uses the alternative model that requires modifier keys to maintain a selection
    When I press 'Down Arrow' or 'Up Arrow' without a modifier key
    Then focus should move to that node
    And all selected nodes except the focused node should become unselected
    When I press 'Control + Down Arrow'
    Then focus should move to the next node without changing the selection state of any node
    When I press 'Control + Up Arrow'
    Then focus should move to the previous node without changing the selection state of any node
    When I press 'Control + Space'
    Then the selection state of the focused node should toggle
    When I press 'Shift + Down Arrow'
    Then focus should move to the next node and its selection state should toggle
    When I press 'Shift + Up Arrow'
    Then focus should move to the previous node and its selection state should toggle
    When I press 'Shift + Space'
    Then contiguous nodes from the most recently selected node to the focused node should be selected
    When I press 'Control + Shift + Home'
    Then the focused node and all nodes up to the first node should be selected
    When I press 'Control + Shift + End'
    Then the focused node and all nodes down to the last node should be selected

  Scenario: Focus and Selection Are Distinct
    Given the tree view is present on the page
    Then DOM focus and selection state should remain functionally distinct
    And the two should coincide only where the tree implements selection following focus

  Scenario: WAI-ARIA Roles, States, and Properties of the Tree View
    Given a tree view is present on the page
    Then the tree container should have role 'tree'
    And each tree node should have role 'treeitem'
    And each parent node should contain or own an element with role 'group' that contains its child nodes
    And parent nodes should have 'aria-expanded' set as per their state
    And end nodes should not have the 'aria-expanded' attribute
    And 'aria-multiselectable', 'aria-selected', 'aria-checked', 'aria-labelledby', 'aria-label', 'aria-level', 'aria-setsize', 'aria-posinset', 'aria-orientation' should be used as per the tree view's features
