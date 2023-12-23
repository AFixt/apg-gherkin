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
    And when I press 'Down Arrow' in a menubar
    Then focus should move to the next item, wrapping from the last to the first
    And when I press 'Up Arrow' in a menubar
    Then focus should move to the previous item, wrapping from the first to the last
    And when I press 'Right Arrow' in a menubar
    Then focus should move to the next item, optionally wrapping from the last to the first
    And when I press 'Left Arrow' in a menubar
    Then focus should move to the previous item, optionally wrapping from the first to the last
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
    And parent menu items should indicate if they have a submenu with 'aria-haspopup' and 'aria-expanded'
    And disabled menu items should have 'aria-disabled' set to true
    And separators should have 'aria-orientation' consistent with their orientation
    And the menubar should have a label provided by 'aria-labelledby' or 'aria-label'

  Scenario: Selecting Menu Items with Keyboard
    Given a menu is open
    When I navigate to a menu item and press 'Enter' or 'Space'
    Then the menu item should be activated
    And the menu should close
    And when I press printable characters
    Then focus should move to the next item whose label begins with that character
