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
    And when I press 'Enter' or 'Space' on a menuitem with a submenu
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
    And when I press 'Home' in the menubar
    Then focus should move to the first item
    And when I press 'End' in the menubar
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
    When I navigate to a menu item and press 'Enter' or 'Space'
    Then the menu item should be activated
    And the menu should close
    And when I press printable characters
    Then focus should move to the next item whose label begins with that character
