Feature: Feed Interaction and Accessibility

  As a user of the website
  I want the feed to automatically load new content as I scroll
  So that I can continuously view articles without manual intervention

  Background:
    Given a feed is implemented on a web page
    And the feed conforms to the Feed Pattern guidelines

  Scenario: Loading New Articles on Scroll
    Given the feed contains a dynamic list of articles
    When I scroll through the feed
    Then new articles should automatically load into the feed
    And the feed should handle visual scrolling based on the focused article

  Scenario: Keyboard Navigation Within the Feed
    Given the feed allows keyboard navigation
    When I press 'Page Down'
    Then focus should move to the next article
    When I press 'Page Up'
    Then focus should move to the previous article
    When I press 'Control + End'
    Then focus should move to the first focusable element after the feed
    When I press 'Control + Home'
    Then focus should move to the first focusable element before the feed

  Scenario: Navigating Nested Feeds
    Given a feed contains a nested feed within an article
    When I navigate to the nested feed
    Then I should be able to interact with the nested feed separately
    And 'Control + End' should move focus to the next article in the outer feed

  Scenario: WAI-ARIA Roles, States, and Properties of the Feed
    Given a feed is present on the page
    Then the feed container should have role 'feed'
    And each article should have role 'article'
    And the feed should have 'aria-labelledby' or 'aria-label' as appropriate
    And each article should have 'aria-labelledby' referring to its label
    And it is recommended for articles to have 'aria-describedby' referring to primary content
    And each article should have 'aria-posinset' and 'aria-setsize' set correctly
    And 'aria-busy' should be used appropriately during updates to the feed

  Scenario: Accessibility and Usability Considerations
    Given the feed is used by assistive technologies
    When articles are loaded or focus is changed
    Then assistive technologies should be able to interact reliably with the feed
    And documentation for keyboard interface should be easily discoverable
    And the feed should facilitate skim reading for assistive technology users
