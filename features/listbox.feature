Feature: Listbox Interaction and Accessibility

  As a user of a website with a listbox
  I want to be able to interact with the listbox and select options
  So that I can make choices from a list of options

  Background:
    Given a listbox is implemented on a web page
    And it conforms to the Listbox Pattern guidelines

  Scenario: Navigating and Selecting in a Single-Select Listbox
    Given a single-select listbox is present
    When the listbox receives focus
    Then focus should be set on the first option if none are selected
    And focus should be set on the selected option if one is selected
    When I press 'Down Arrow'
    Then focus moves to the next option
    And optionally, selection may also move with focus in a single-select listbox
    When I press 'Up Arrow'
    Then focus moves to the previous option
    And optionally, selection may also move with focus in a single-select listbox
    When I press 'Home' (Optional)
    Then focus moves to the first option
    When I press 'End' (Optional)
    Then focus moves to the last option
    And 'Home' and 'End' are strongly recommended for lists with more than five options

  # The APG defines two multi-select interaction models and presents them as an
  # author's choice. The first, below, is the recommended model and does not
  # require modifier keys to maintain a selection. The alternative model further
  # down requires modifier keys. An implementation adopts one model or the other.
  Scenario: Navigating and Selecting in a Multi-Select Listbox - Recommended Model
    Given a multi-select listbox is present
    And the listbox uses the recommended model that does not require modifier keys
    When the listbox receives focus
    Then focus should be set on the first option if none are selected
    And focus should be set on the first selected option if one or more are selected
    When I press 'Down Arrow'
    Then focus moves to the next option without changing selection
    When I press 'Up Arrow'
    Then focus moves to the previous option without changing selection
    When I press 'Space'
    Then the selection state of the focused option changes

  Scenario: Navigating and Selecting in a Multi-Select Listbox - Alternative Model
    Given a multi-select listbox is present
    And the listbox uses the alternative model that requires modifier keys to maintain a selection
    When I press 'Down Arrow' without a modifier key
    Then focus moves to the next option
    And all selected options except the focused option become unselected
    When I press 'Up Arrow' without a modifier key
    Then focus moves to the previous option
    And all selected options except the focused option become unselected
    When I press 'Control + Down Arrow'
    Then focus moves to the next option without changing the selection state of any option
    When I press 'Control + Up Arrow'
    Then focus moves to the previous option without changing the selection state of any option
    When I press 'Control + Space'
    Then the selection state of the focused option changes

  # The Shift-based keys below are common to both multi-select models above.
  Scenario: Multi-Select Listbox with Shift Key
    Given a multi-select listbox is present
    When I press 'Shift + Down Arrow'
    Then focus moves to the next option and its selected state is toggled
    When I press 'Shift + Up Arrow'
    Then focus moves to the previous option and its selected state is toggled
    When I press 'Shift + Space' (Optional)
    Then contiguous items from the most recently selected item to the focused item are selected
    When I press 'Control + Shift + Home'
    Then the focused option and all options up to the first option are selected
    And optionally, focus may move to the first option
    When I press 'Control + Shift + End'
    Then the focused option and all options down to the last option are selected
    And optionally, focus may move to the last option

  Scenario: Select All in a Multi-Select Listbox (Optional)
    Given a multi-select listbox is present
    When I press 'Control + A'
    Then all options in the listbox should be selected
    And optionally, if all options are already selected, all options may be deselected

  Scenario: Type-Ahead Feature in Listboxes
    Given a listbox is present with more than seven options
    When I type a single character
    Then focus moves to the next option starting with that character
    When I type multiple characters in quick succession
    Then focus moves to the next option whose label starts with the typed string

  Scenario: Scrolling Behavior
    Given a listbox has scrollable content
    When focus moves to an option that is not visible
    Then the option should scroll into view
    And the listbox should not scroll when focus does not move

  Scenario: WAI-ARIA Roles, States, and Properties for Listbox Container
    Given a listbox is present on the page
    Then the container element should have a role of 'listbox'
    And the listbox should have an accessible name via 'aria-labelledby' or 'aria-label'
    And if the listbox is not part of another widget, it should be in the page tab sequence

  Scenario: WAI-ARIA Roles, States, and Properties for Options
    Given a listbox is present on the page
    Then each option should have a role of 'option'
    And each option should be a DOM descendant of the listbox or referenced by 'aria-owns'
    And selection should be conveyed with either 'aria-selected' or 'aria-checked', but not both on the same option
    And selected options should have the chosen property set to true
    And selectable but not selected options should have the chosen property set to false
    And options that are not selectable should not have either property set
    Optionally, 'aria-selected' may be used for single-select listboxes and 'aria-checked' for multi-select listboxes, which is the APG's recommended convention in the absence of factors making an alternative more appropriate

  Scenario: WAI-ARIA Roles, States, and Properties for Grouped Options
    Given a listbox contains grouped options
    Then each option group should have a role of 'group' contained in or owned by the element with role 'listbox'
    And each option group should contain at least one option
    And each option group should have an accessible name provided via 'aria-label' or 'aria-labelledby'

  Scenario: WAI-ARIA Roles, States, and Properties for Grouped Options
    Given a listbox contains grouped options
    Then each option group should have a role of 'group' contained in or owned by the element with role 'listbox'
    And each option group should contain at least one option
    And each option group should have an accessible name provided via 'aria-label' or 'aria-labelledby'

  Scenario: Multi-Select Listbox ARIA Properties
    Given a multi-select listbox is present
    Then the listbox element should have 'aria-multiselectable' set to true

  Scenario: Listbox Orientation
    Given a listbox is present on the page
    When options are arranged horizontally
    Then the listbox should have 'aria-orientation' set to 'horizontal'
    And 'Down Arrow' should perform as 'Right Arrow' and 'Up Arrow' should perform as 'Left Arrow'

  Scenario: Disabled Options
    Given a listbox has disabled options
    Then disabled options should have 'aria-disabled' set to true
    And disabled options should remain focusable but not selectable

  Scenario: Dynamic Loading
    Given a listbox uses dynamic loading
    Then options should have 'aria-setsize' set to the total number of available options
    And options should have 'aria-posinset' set to their position within the full list

  Scenario: Focus Management with aria-activedescendant
    Given a listbox uses 'aria-activedescendant' for focus management
    Then DOM focus should remain on the listbox element
    And 'aria-activedescendant' should be set to the ID of the focused option
    And the visual focus indicator should be on the option referenced by 'aria-activedescendant'

  Scenario: Rearranging Options
    Given a listbox supports rearranging options
    When I press 'Alt + Down Arrow' on a focused option
    Then the focused option should move one position down
    When I press 'Alt + Up Arrow' on a focused option
    Then the focused option should move one position up
