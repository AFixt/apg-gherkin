Feature: Combobox Interaction and Accessibility

  As a user of a website
  I want the combobox to be interactable and accessible
  So that I can choose a value efficiently from a collection

  Background:
    Given a combobox is implemented on a web page
    And the combobox conforms to the Combobox Pattern guidelines

  Scenario: Combobox Tab Sequence and Focus
    Given the combobox is in the page tab sequence
    When I press 'Tab' to move focus to the combobox
    Then focus should be set on the combobox input element
    And the popup should not open on focus alone unless the implementation opens it on focus

  Scenario: Opening the Popup
    Given focus is in the combobox
    When I press 'Down Arrow'
    Then the popup should open if it is not already open
    And focus should move to the first focusable element in the popup if using DOM focus
    When I press 'Alt + Down Arrow'
    Then the popup should open without moving focus from the combobox
    Optionally, when I press 'Alt + Up Arrow' while the popup is displayed
    Then the popup should close and focus should return to the combobox input

  Scenario: Closing the Popup
    Given the popup is open
    When I press 'Escape'
    Then the popup should be dismissed
    And focus should return to the combobox input
    And if the combobox is editable, the value in the input should not be cleared
    Optionally, if the popup was already hidden when 'Escape' was pressed, the combobox may be cleared

  Scenario: Selecting a Value
    Given the popup is open
    When I press 'Enter'
    Then the currently highlighted value from the popup should be accepted
    And the popup should close
    And focus should return to the combobox input

  Scenario: Keyboard Navigation in the Combobox Input
    Given focus is in the combobox input
    When I press 'Down Arrow'
    Then the popup should open and focus or highlight the first option
    When I press 'Up Arrow'
    Then the popup should open and focus or highlight the last option
    When I press 'Home' on an editable combobox
    Then the cursor should move to the beginning of the input
    When I press 'End' on an editable combobox
    Then the cursor should move to the end of the input

  Scenario: Typing in an Editable Combobox
    Given an editable combobox is present
    When I type printable characters
    Then the characters should be entered in the combobox input
    And the popup should display suggestions if autocomplete is enabled

  Scenario: Autocomplete Behavior - None
    Given the combobox has autocomplete set to 'none'
    When the popup is displayed
    Then the suggested values it contains should be the same regardless of the characters typed in the combobox

  Scenario: Autocomplete Behavior - List
    Given the combobox has autocomplete set to 'list'
    When I type in the combobox
    Then the popup should present suggested values
    And if the combobox is editable, the suggested values should complete or logically correspond to the characters typed in the combobox
    Optionally, the popup may filter out values that do not correspond to the typed characters

  Scenario: Autocomplete Behavior - Both
    Given the combobox has autocomplete set to 'both'
    When I type in the combobox
    Then the popup should present suggested values that complete or logically correspond to the characters typed in the combobox
    And the portion of the first suggested value not yet typed should appear inline after the cursor
    And the inline completion should be selected so subsequent typing replaces it

  Scenario: Keyboard Navigation in a Listbox Popup
    Given the popup is a listbox and is open
    When I press 'Down Arrow' in the popup
    Then focus or highlight moves to the next option
    When I press 'Up Arrow' in the popup
    Then focus or highlight moves to the previous option
    When I press 'Home' in the popup
    Then focus or highlight moves to the first option
    When I press 'End' in the popup
    Then focus or highlight moves to the last option
    When I press any printable character in the popup and the combobox is editable
    Then focus should return to the combobox input without closing the popup and the character should be typed

  Scenario: Keyboard Navigation in a Grid Popup
    Given the popup is a grid and is open
    When I press 'Down Arrow' in the grid
    Then focus moves to the cell in the next row in the same column
    When I press 'Up Arrow' in the grid
    Then focus moves to the cell in the previous row in the same column
    When I press 'Right Arrow' in the grid
    Then focus moves to the next cell in the same row
    When I press 'Left Arrow' in the grid
    Then focus moves to the previous cell in the same row
    When I press 'Home' in the grid
    Then focus moves to the first cell in the current row
    When I press 'End' in the grid
    Then focus moves to the last cell in the current row

  Scenario: Keyboard Navigation in a Tree Popup
    Given the popup is a tree and is open
    When I press 'Down Arrow' in the tree
    Then focus moves to the next visible tree node
    When I press 'Up Arrow' in the tree
    Then focus moves to the previous visible tree node
    When I press 'Right Arrow' on a closed parent node
    Then the parent node should expand
    When I press 'Right Arrow' on an open parent node
    Then focus moves to the first child node
    When I press 'Left Arrow' on an open parent node
    Then the parent node should collapse
    When I press 'Left Arrow' on a child or closed node
    Then focus moves to the parent node
    When I press 'Home' in the tree
    Then focus moves to the first focusable node in the tree without opening or closing a node
    When I press 'End' in the tree
    Then focus moves to the last focusable node in the tree without opening or closing a node

  Scenario: Dialog Popup
    Given the popup is a dialog
    When the dialog opens
    Then focus should move inside the dialog
    And the dialog should contain interactive elements for selecting or entering a value
    When I close the dialog
    Then the selected value should be reflected in the combobox input
    And focus should return to the combobox input

  Scenario: Tab Behavior with Open Popup
    Given the popup is open
    Then the popup indicator icon or button, the popup, and the popup descendants should be excluded from the page tab sequence
    When I press 'Tab'
    Then focus should move to the next focusable element in the page tab sequence after the combobox
    Optionally, the popup may close when focus leaves the combobox

  Scenario: Focus Management with aria-activedescendant
    Given the combobox uses 'aria-activedescendant' for focus management
    Then DOM focus should remain on the combobox input element
    And 'aria-activedescendant' on the input should refer to the focused element in the popup
    And the visual focus indicator should be on the element referenced by 'aria-activedescendant'

  Scenario: WAI-ARIA Roles, States, and Properties for Combobox
    Given a combobox is present on the page
    Then the input element should have role 'combobox'
    And if the popup has a role other than 'listbox', the combobox should have 'aria-haspopup' set to a value corresponding to the popup type
    And the combobox should have 'aria-expanded' set to true when the popup is open
    And the combobox should have 'aria-expanded' set to false when the popup is closed
    And the combobox should have an accessible name via a visible 'label' element, 'aria-labelledby', or 'aria-label'

  Scenario: WAI-ARIA Properties for Popup Control
    Given a combobox with a popup is present
    Then the combobox should have 'aria-controls' set to the ID of the popup element when the popup is open
    And if the popup has autocomplete, the combobox should have 'aria-autocomplete' set to the appropriate value
    Examples:
      | Autocomplete Type            | aria-autocomplete Value |
      | No autocomplete              | none                    |
      | List of suggested values     | list                    |
      | List plus inline completion  | both                    |

  Scenario: WAI-ARIA Roles for Popup Elements
    Given a combobox popup is present
    Then the popup element should have a role of 'listbox', 'tree', 'grid', or 'dialog'
    And each selectable element in a listbox popup should have a role of 'option'
    And each selectable element in a tree popup should have a role of 'treeitem'
    And each selectable row in a grid popup should have a role of 'row' containing cells with role 'gridcell'

  Scenario: Indicating Selected Value in Popup
    Given the popup is open
    Then the option matching the current combobox value should have 'aria-selected' set to true
    And all other options should not have 'aria-selected' set to true
