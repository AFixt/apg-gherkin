Feature: Menubar Interaction and Accessibility

  As a user of the website
  I want the menubar to provide a list of choices
  So that I can access a consistent set of commands or actions

  Background:
    Given a menubar is implemented on a web page
    And it conforms to the Menu and Menubar Pattern guidelines

  Scenario: Navigating through Menubar with Keyboard
    Given the menubar is focusable
    When I press 'Tab' or 'Shift + Tab'
    Then focus should move into and out of the menubar
    And when I press 'Enter' on a menuitem with a submenu
    Then the submenu should open and focus should move to the first item in the submenu
    And optionally, when I press 'Space' on a menuitem with a submenu
    Then the submenu should open and focus should move to the first item in the submenu
    And when I press 'Down Arrow' on a menubar menuitem that has a submenu
    Then the submenu should open and focus should move to the first item in the submenu
    And when I press 'Down Arrow' while focus is in a menu
    Then focus should move to the next item, optionally wrapping from the last to the first
    And when I press 'Up Arrow' while focus is in a menu
    Then focus should move to the previous item, optionally wrapping from the first to the last
    And optionally, when I press 'Up Arrow' on a menubar menuitem that has a submenu
    Then the submenu should open and focus should move to the last item in the submenu
    And when I press 'Right Arrow' in a menubar
    Then focus should move to the next item, optionally wrapping from the last to the first
    And when I press 'Left Arrow' in a menubar
    Then focus should move to the previous item, optionally wrapping from the first to the last
    And when I press 'Right Arrow' in a menu on a menuitem that has a submenu
    Then the submenu should open and focus should move to its first item
    And when I press 'Left Arrow' in a submenu of an item in a menu
    Then the submenu should close and focus should return to the parent menuitem
    And when I press 'Home' in the menubar and arrow key wrapping is not supported
    Then focus should move to the first item
    And when I press 'End' in the menubar and arrow key wrapping is not supported
    Then focus should move to the last item
    And when I press 'Escape' while a menu is open
    Then the menu should close and focus should return to the menubar

  Scenario: Accessibility Features of the Menubar
    Given the menubar is present on the page
    Then it should have the role 'menubar'
    And menu items should have roles like 'menuitem', 'menuitemcheckbox', or 'menuitemradio'
    And parent menu items should have 'aria-haspopup' set to 'menu' or true
    And parent menu items should have 'aria-expanded' set to false when the child menu is not visible and true when it is visible
    And a checked 'menuitemcheckbox' or 'menuitemradio' should have 'aria-checked' set to true
    And disabled menu items should have 'aria-disabled' set to true
    And separators placed between groups of items should have a role of 'separator'
    And separators should have 'aria-orientation' consistent with their orientation
    And the menubar should have a label provided by 'aria-labelledby' or 'aria-label'
    And if the menubar is vertically oriented it should have 'aria-orientation' set to 'vertical'
    And each submenu should have a role of 'menu' labelled by 'aria-labelledby' referring to the menuitem or button that controls its display, or by 'aria-label'
    And if a menu is horizontally oriented it should have 'aria-orientation' set to 'horizontal'

  Scenario: Selecting Menu Items with Keyboard
    Given a menu is open
    When I navigate to a menuitem without a submenu and press 'Enter'
    Then the menu item should be activated
    And the menu should close
    When I press any printable character (Optional)
    Then focus should move to the next item in the current menu whose label begins with that printable character

  Scenario: Activating Menu Items with Space (Optional)
    Given a menu is open
    When I press 'Space' on a menuitem without a submenu
    Then the menu item should be activated
    And the menu should close
    When I press 'Space' on a 'menuitemcheckbox'
    Then its checked state should toggle
    And the menu should not close
    When I press 'Space' on a 'menuitemradio'
    Then it should be checked and the other radio items in its group should be unchecked
    And the menu should not close

  Scenario: Focus Management within the Menubar
    Given a menubar is present on the page
    Then focus should be managed by one of the two mechanisms the APG allows
    And under the first mechanism, the menu container should have 'tabindex' set to '-1' or '0' and 'aria-activedescendant' set to the ID of the focused item
    Or under the second mechanism, each item in the menu should have 'tabindex' set to '-1', except in a menubar where the first item should have 'tabindex' set to '0'
    And whichever mechanism is used, only one element of the menubar should be in the page tab sequence at a time
