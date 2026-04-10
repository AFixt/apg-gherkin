Feature: Landmarks Navigation and Accessibility

  As a user of a website
  I want landmark regions to be properly identified
  So that I can efficiently navigate to different sections of the page

  Background:
    Given a web page uses landmark regions
    And the landmarks conform to the Landmarks Pattern guidelines

  Scenario: Landmark Roles Identify Page Regions
    Given a web page has distinct content sections
    Then the banner area should have a role of 'banner' or use the 'header' element
    And the main content area should have a role of 'main' or use the 'main' element
    And the site navigation should have a role of 'navigation' or use the 'nav' element
    And the content information area should have a role of 'contentinfo' or use the 'footer' element
    And supplementary content should have a role of 'complementary' or use the 'aside' element
    And search functionality should have a role of 'search' or use the 'search' element
    And form regions should have a role of 'form' or use a labeled 'form' element
    And generic sections should have a role of 'region' or use a labeled 'section' element

  Scenario: Unique Landmark Constraints
    Given a web page has landmark regions
    Then there should be no more than one 'banner' landmark in the page
    And there should be no more than one 'main' landmark in the page
    And there should be no more than one 'contentinfo' landmark in the page
    But there may be multiple 'navigation', 'complementary', 'search', 'form', or 'region' landmarks

  Scenario: Labeling Multiple Landmarks of the Same Type
    Given a page has multiple landmarks with the same role
    Then each landmark of the same type should have a unique accessible name
    And the accessible name should be provided via 'aria-labelledby' or 'aria-label'

  Scenario: Labeling Region Landmarks
    Given a 'region' landmark is present
    Then it must have an accessible name via 'aria-labelledby' or 'aria-label'
    And the 'region' landmark should only be used if no other landmark role is appropriate

  Scenario: Keyboard Navigation Between Landmarks
    Given landmarks are present on the page
    Then screen reader users should be able to navigate between landmarks
    And each landmark should provide a meaningful label to aid orientation

  Scenario: Nesting Landmarks
    Given landmarks are nested within other landmarks
    Then nested landmarks should be logical children of their parent landmark
    And 'banner' and 'contentinfo' landmarks nested inside 'main' should refer to the 'main' region content
    And each nested landmark should still be accessible via landmark navigation

  Scenario: All Content Within Landmarks
    Given a web page uses landmark regions
    Then all perceivable content should be contained within a landmark region
    And content outside of landmarks may be missed by assistive technology users navigating by landmarks
