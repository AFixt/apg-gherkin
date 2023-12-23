Feature: Breadcrumb Navigation

  As a user of a website with breadcrumb navigation
  I want to understand the hierarchical structure of the site
  So that I can easily navigate through parent pages and understand my current location

  Background: 
    Given a breadcrumb trail is present on a page

  Scenario: Breadcrumb Containment in a Navigation Landmark Region
    Then the breadcrumb should be contained within a navigation landmark region
    And the landmark region should be labelled via aria-label or aria-labelledby

  Scenario: Links in Breadcrumb
    Then each link in the breadcrumb should lead to the respective parent page
    And the link to the current page should have aria-current set to 'page'

  Scenario: Current Page Representation in Breadcrumb
    When the element representing the current page is not a link
    Then it is optional to have aria-current set to 'page'

  Scenario: Visual Structure of Breadcrumb
    Then the breadcrumb should be placed horizontally before the main content of the page

  Scenario: Accessibility of Breadcrumb
    Then each link in the breadcrumb should be accessible to assistive technologies
